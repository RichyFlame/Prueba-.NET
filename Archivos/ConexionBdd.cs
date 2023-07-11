using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Prueba.Net.App_Code
{
    public class ConexionBdd
    {
        public SqlConnection myConnection { get; set; }
        public SqlCommand myCommand { get; set; }
        public SqlDataReader myReader { get; set; }
        public SqlDataAdapter myAdapter { get; set; }
        public DataSet myDataSet { get; set; }
        public SqlTransaction myTransaction { get; set; }
        public string mySqlText { get; set; }

        public string  myConnectionString { get; set; }
        public string  myServerId { get; set; }
        public string myUserId { get; set; }
        public string myPassword { get; set; }
        public string myDataBaseName { get; set; }

        public int myRowsnumRowsAffected { get; set; }
        public string myErrorMessage { get; set; }

        public bool blnOnTransaction { get; set; }

        public ConexionBdd()
        {
            this.myConnectionString = "";
            this.myServerId = "";
            this.myUserId = "";
            this.myPassword = "";
            this.myDataBaseName = "";
            this.myRowsnumRowsAffected = -1;
            this.myErrorMessage = "";
            this.blnOnTransaction = false;
        }

        public DataSet ResultDataSet()
        {
            return this.myDataSet;
        }

        public SqlDataReader ResultReader()
        {
            return this.myReader;
        }

        public string ErrorMessage()
        {
            return this.myErrorMessage;
        }

        public bool IsOpen()
        {
            if (this.myConnection.State == ConnectionState.Open)
            {
                return true;
            }
            return false;
        }

        private bool LoadConnectionString()
        {
            try
            {
                myConnectionString = $"user id={this.myUserId}; pwd={this.myPassword}; data source={this.myServerId}; persist security info=False; initial catalog={this.myDataBaseName}";
                return true;
            }
            catch (Exception ex)
            {
                this.myErrorMessage = ex.ToString();
                return false;
            }
        }
        public bool Open(string userId, string password, string serverId, string dataBaseName)
        {
            try
            {
                this.myUserId = userId;
                this.myPassword = password;
                this.myServerId = serverId;
                this.myDataBaseName = dataBaseName;
                if (LoadConnectionString())
                {
                    this.myConnection = new SqlConnection(this.myConnectionString);
                    this.myConnection.Open();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                this.myErrorMessage = ex.ToString();
                return false;
            }
        }

        public bool Close()
        {
            try
            {
                this.myConnection.Close();
                return true;
            }
            catch (Exception ex)
            {
                this.myErrorMessage = ex.ToString();
                return false;
            }
        }

        // Consulta a la base de datos
        public bool Query(string strTabla, string strCampos = "", string strRestriccion = "", string strAgrupamiento = "", string strRestriccionAgrupamiento = "", string strOrdenamiento = "")
        {
            try
            {
                this.mySqlText = "SELECT " + strCampos + " FROM " + strTabla;
                this.mySqlText += string.IsNullOrEmpty(strRestriccion) ? "" : $" WHERE    {strRestriccion} ";
                this.mySqlText += string.IsNullOrEmpty(strAgrupamiento) ? "" : $" GROUP BY    {strAgrupamiento} ";
                this.mySqlText += string.IsNullOrEmpty(strRestriccionAgrupamiento) ? "" : $" HAVING    {strRestriccionAgrupamiento} ";
                this.mySqlText += string.IsNullOrEmpty(strOrdenamiento) ? "" : $" ORDER BY    {strOrdenamiento} ";

                this.myCommand = new SqlCommand(this.mySqlText, this.myConnection);
                this.myCommand.CommandType = CommandType.Text;

                this.myRowsnumRowsAffected = Convert.ToInt32(this.myCommand.ExecuteScalar());

                if (this.myAdapter == null)
                    this.myAdapter = new SqlDataAdapter();

                if (this.blnOnTransaction)
                    this.myCommand.Transaction = myTransaction;
                this.myAdapter.SelectCommand = myCommand;
                this.myDataSet = new DataSet();
                myAdapter.Fill(this.myDataSet);
                return true;
            }
            catch (Exception ex)
            {
                if (this.blnOnTransaction)
                {
                    this.myTransaction.Rollback();
                    this.blnOnTransaction = false;
                }
                this.myErrorMessage = ex.Message;
                return false;
            }
        }

        // Insertar en la base de datos 
        public int Insert(string strTabla, string strCampos, string strValores)
        {
            try
            {
                this.mySqlText = "INSERT INTO " + strTabla + " (" + strCampos + ") " + " VALUES (" + strValores + ")";

                this.myCommand = new SqlCommand(this.mySqlText, this.myConnection);
                this.myCommand.CommandType = CommandType.Text;
                if (this.blnOnTransaction)
                    this.myCommand.Transaction = myTransaction;
                this.myRowsnumRowsAffected = this.myCommand.ExecuteNonQuery();
                return this.myRowsnumRowsAffected;
            }
            catch (Exception ex)
            {
                if (this.blnOnTransaction)
                {
                    this.myTransaction.Rollback();
                    this.blnOnTransaction = false;
                }
                this.myErrorMessage = ex.Message;
                return -1;
            }
        }

        // Actualziar en la base de datos 
        public int Update(string strTabla, string strCampos, string strRestriccion = "")
        {
            try
            {
                this.mySqlText = "UPDATE " + strTabla + " SET " + strCampos;
                this.mySqlText += string.IsNullOrEmpty(strRestriccion) ? "" : $" WHERE {strRestriccion}";

                this.myCommand = new SqlCommand(this.mySqlText, this.myConnection);
                this.myCommand.CommandType = CommandType.Text;
                if (this.blnOnTransaction)
                    this.myCommand.Transaction = this.myTransaction;
                this.myRowsnumRowsAffected = this.myCommand.ExecuteNonQuery();
                return this.myRowsnumRowsAffected;
            }
            catch (Exception ex)
            {
                if (this.blnOnTransaction)
                {
                    this.myTransaction.Rollback();
                    this.blnOnTransaction = false;
                }
                this.myErrorMessage = ex.Message;
                return -1;
            }
        }

        // Elimnar en la base de datos
        public int Delete(string strTabla, string strRestriccion = "")
        {
            try
            {
                this.mySqlText = "DELETE " + strTabla;
                this.mySqlText += string.IsNullOrEmpty(strRestriccion)? "": $" WHERE {strRestriccion}";

                this.myCommand = new SqlCommand(this.mySqlText, this.myConnection);
                this.myCommand.CommandType = CommandType.Text;
                if (this.blnOnTransaction)
                    this.myCommand.Transaction = this.myTransaction;
                this.myRowsnumRowsAffected = this.myCommand.ExecuteNonQuery();
                return this.myRowsnumRowsAffected;
            }
            catch (Exception ex)
            {
                if (this.blnOnTransaction)
                {
                    this.myTransaction.Rollback();
                    this.blnOnTransaction = false;
                }
                this.myErrorMessage = ex.Message;
                return -1;
            }
        }


    }
}