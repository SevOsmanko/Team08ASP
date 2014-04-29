<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Timetabler System</title>
</head>
<body>

    <% if (!String.IsNullOrEmpty(Request.Form["login_button"])) //If clicked the login button
       {
           string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
           SqlConnection myConn = new SqlConnection(strConn);
           myConn.Open(); 
           String strSQL = "select count(*) as no from dbo.department where departmentCode= '" + Request.Form["department"] + "' and password = '" + Request.Form["password"] + "'";
           SqlCommand myCommand = new SqlCommand(strSQL, myConn);
           SqlDataReader myDataReader = myCommand.ExecuteReader();
           Response.Write(strSQL);
           myDataReader.Read();
           
           //Password checking
           if (Convert.ToInt32(myDataReader["no"]) > 0) //if found a record, login success
           { 
               Session["departmentCode"] = Request.Form["department"]; //Storage the department ID, you can use this in any page
               Response.Redirect("home.aspx"); //if correct, goto home page
           }
           else
               Response.Redirect("default.aspx"); //if not correct, goto login page again
           myConn.Close();
       }else{ //If not clicked the login button 
    %>
    <form id="form1" runat="server">
    <div id="login-wrapper">
		<div class="field">
            <h3><b>Team08</b></h3><br />

            <!-- Creates Department label -->
			<label for="form-department" class="block">Department: </label>
            <!-- Dropdownlist detail is in "default.aspx.cs" -->
            <asp:DropDownList ID="department" runat="server"></asp:DropDownList>
		</div>
					
		<div class="field text">
		<!-- Creates Password label -->
			<label for="password" class="block">Password:</label>
            <asp:TextBox ID="password" TextMode="Password" runat="server"></asp:TextBox>password = "password"
		</div>
				
		<div class="form-footer">
		<!-- Create the footer with label and login button -->
            <!-- Will goto the same page(default.aspx) for password checking -->
            <asp:Button id="login_button" Text="Login" runat="server" PostBackUrl="Default.aspx" CssClass="button"/>
		</div>
			
		</div>
    </form>
    <% } %>
</body>
</html>
