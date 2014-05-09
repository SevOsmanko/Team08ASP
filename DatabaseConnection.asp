<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
sub Page_Load
dim dbconn,sql,dbcomm
dbconn=New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;
data source=" & server.mappath("CO-WEB.team08"))
dbconn.Open()
sql="SELECT * FROM Timetabler"
dbcomm=New OleDbCommand(sql,dbconn)
end sub
</script>


<html>
<body>