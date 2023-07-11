<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Prueba.Net.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="css/Style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="loginForm" runat="server">
        <div>
            <label for="username">Usuario:</label>
            <asp:TextBox ID="txtUsername" runat="server" required> </asp:TextBox>

            <br />

            <label for="password">Contraseña:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required> </asp:TextBox>

            <br />

            <asp:Button ID="loginButton" runat="server" Text="Iniciar sesión" OnClick="LoginButton_Click" />
        </div>
        <div>
            <label id="MensajeError" runat="server"></label>
        </div>
    </form>
</body>
</html>
