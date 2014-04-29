<%@ Page Language="C#" AutoEventWireup="true" CodeFile="module.aspx.cs" Inherits="module" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ import Namespace="System" %>
<%@ import Namespace="System.Collections.Generic" %>
<%@ import Namespace="System.Linq" %>
<%@ import Namespace="System.Web" %>
<%@ import Namespace="System.Web.UI" %>
<%@ import Namespace="System.Web.UI.WebControls" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src ='Scripts/jquery-1.8.2.js' type = 'text/javascript'></script>
    <link rel="stylesheet" href="Scripts/jquery-ui.css" />
    <script src="Scripts/jquery-ui.min.js"></script>
    <link rel="stylesheet" runat="server" media="screen" href="css/home.css" />
    <title></title>
</head>
    <script type="text/javascript">
        $(document).ready(function () {
            //If user choose the module list
            $("#moduleList").change(function () {
                var moduleChangeID = $("#moduleList option:selected").val(); //Get the module id
                //Get modult title for other page (Communication with the Server side)
                $.ajax({
                    type: "POST",
                    url: "getData.aspx/selectModuleList", //Goto this page
                    data: "{id: "+moduleChangeID+" }", //pass some data to the other page
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function (xhr) {
                        //alert('Ajax request Error');
                    },
                    success: function (response) {
                        var resultString = response; //get the return value
                        $("#moduleTextBox").val(jQuery.parseJSON(JSON.stringify(resultString)).d); //show the title on the textbox
                    }
                });
            });

            //If you click the change module button
            $("#moduleChangeButton").click(function () {
                var moduleChangeID = $("#moduleList option:selected").val();
                var title = $("#moduleTextBox").val();

                //Update the module name (Server Side)
                $.ajax({
                    type: "POST",
                    url: "getData.aspx/changeModuleName", //Goto this page
                    data: "{id: " + moduleChangeID + ", title: '"+title+"'}", //pass some data to the other page
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function (xhr) {
                        alert(xhr.responseText); //display error message, if there is some error
                    },
                    success: function (response) { //what to do if success
                        var resultString = response; //get the return value
                        var moduleCode = jQuery.parseJSON(JSON.stringify(resultString)).d; //show the title on the textbox
                        $('#moduleList option[value="' + moduleChangeID + '"]').text(moduleCode + " - " + title); //Rename the module
                        //location.reload();  //refreash page
                    }
                });
            });

            //If you click the add module button
            $("#moduleAddButton").click(function () {
                var newModuleCode = $("#moduleCodeAdd").val();
                var newModuleTitle = $("#moduleTitleAdd").val();
                var departmentCode = '<%=Session["departmentCode"] %>'; //variable from C# to javascript

                //Add new module (server side)
                $.ajax({
                    type: "POST",
                    url: "getData.aspx/addNewModule", //Goto this page
                    data: "{moduleCode: '" + newModuleCode + "', moduleTitle: '" + newModuleTitle + "', departmentCode: '" + departmentCode + "'}", //pass some data to the other page
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function (xhr) {
                        alert(xhr.responseText);

                    },
                    success: function (response) {
                        location.reload(); //Reload the page to get the latest data
                    }
                });
            });

            //If you click the delete module button
            $("#moduleDeleteButton").click(function () {
                var moduleDeleteID = $("#moduleList option:selected").val();

                //Delete a module (server side)
                $.ajax({
                    type: "POST",
                    url: "getData.aspx/deleteModule", //Goto this page
                    data: "{moduleID: '" + moduleDeleteID + "'}", //pass some data to the other page
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function (xhr) {
                        alert(xhr.responseText);
                    },
                    success: function (response) {
                        $('#moduleList option[value="' + moduleDeleteID + '"]').remove(); //Remove the selected module form the dropdownlist
                    }
                });
            });
        });
    </script>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- Module List -->
        <asp:ListBox id="moduleList" Rows="20" runat="server" Width="500"></asp:ListBox>
        <!-- Delete button -->
        <asp:Button id="moduleDeleteButton" Text="Delete" runat="server" CssClass="button" onclientclick="Javascript:return false;"/>
        <br />
        <!-- Textbox of edit the module name -->
        <asp:TextBox ID="moduleTextBox" runat="server"></asp:TextBox>
        <!-- Button for change the module name -->
        <asp:Button id="moduleChangeButton" Text="Change Title" runat="server" CssClass="button" onclientclick="Javascript:return false;"/><br /><br />
        
       <u><b>Add Module</b></u> <br />
        Module Code: 
            <asp:TextBox ID="moduleCodeAdd" runat="server"></asp:TextBox> <br /> <!-- Textbox for module code (for add module) -->
        Module title: 
            <asp:TextBox ID="moduleTitleAdd" runat="server"></asp:TextBox> <br /> <!--Textbox for module title (for add module) -->
        <!-- Button for add module -->
            <asp:Button ID="moduleAddButton" Text="Add Module" runat="server" CssClass="button" OnClientClick="Javascript:return false;" /> 
            <!-- OnClientClick="Javascript:return false <== mean not do anything after you click the button-->
    </div>
    </form>
</body>
</html>
