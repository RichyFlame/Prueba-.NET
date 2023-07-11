using Prueba.Net.App_Code;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Prueba.Net
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LimpiarDatos()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            MensajeError.InnerText = "";
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string user = txtUsername.Text;
            string pass = txtPassword.Text;

            if(string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass))
            {
                MensajeError.InnerText = "Por favor, ingresa un usuario y contraseña válidos.";
            }else
            {
                IsValidUser();
                ConsultaDB();
            }
        }

        protected void IsValidUser()
        {
            // peticion al servidor de validacion de usuario 
        }
        protected void ConsultaDB()
        {
            ConexionBdd conexion = new ConexionBdd();
            try
            {
                conexion.Open("prueba", "Prueba1+", "MSI", "PruebaDB");

                if (conexion.IsOpen())
                {
                    DataSet data;
                    if (conexion.Query("PROYECTO", "PROYECTO, NOMBRE", "", "", "", ""))
                    {
                        data = conexion.ResultDataSet();
                        foreach (DataRow item in data.Tables[0].Rows)
                        {
                            MensajeError.InnerText += item["PROYECTO"] + " - " + item["NOMBRE"] + "\n";
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}