<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testing.aspx.cs" Inherits="testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src ='Scripts/jquery-1.8.2.js' type = 'text/javascript'></script>
    <link rel="stylesheet" href="Scripts/jquery-ui.css" />
    <script src="Scripts/jquery-ui.min.js"></script>
    <link rel="stylesheet" runat="server" media="screen" href="css/home.css" />
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#testingButton").click(function () {
                location.href = "testing.aspx?a=abc&b=234";
            });
        });
    </script>

    <form id="form1" runat="server">
    <div>
        <asp:table borderwidth="1" id="Table1" runat="server"></asp:table> 
        <asp:Button ID="testingButton" Text="Add Module" runat="server" CssClass="button" OnClientClick="Javascript:return false;" />
    </div>
    </form>
</body>
</html>
