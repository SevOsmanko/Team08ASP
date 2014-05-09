<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Team_Projects.WebForm6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
<br /> <br /> <br />
    <form id="Forms" runat="server">
    <asp:Login ID="Login1" align="center" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" 
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="0.8em" ForeColor="#333333" Height="248px" Width="470px" 
            DestinationPageUrl="~/MyRequests.aspx">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" 
                BorderWidth="1.2px" Font-Names="Verdana" Font-Size="1.1em" ForeColor="#284E98" />
            <TextBoxStyle Font-Size="1.3em" Height="20px" Width="200px" />
            <TitleTextStyle BackColor="#330066" Font-Bold="True" Font-Size="1.3em" 
                ForeColor="White"/>
        </asp:Login>
    </form>
    <br />
     <center><img src="Pictures/LU-mark-RGB.gif" /></center>
</body>
</html>
