<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newRoom.aspx.cs" Inherits="newRoom" %>

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
            $("#newRoomCancelButton").click(function () {
                location.href = "room.aspx"; //Go back to "room.aspx"
            });
        });
    </script>
    <form id="form1" runat="server">
    <div>
    Name: <asp:TextBox ID="name" runat="server"></asp:TextBox><br />
    Building: <asp:DropDownList ID="ddlGender" runat="server" Width="200px"></asp:DropDownList><br />
    Capacity: <asp:TextBox ID="capacity" runat="server"></asp:TextBox><br />

    Room Type: <asp:RadioButton ID="roomType1" runat="server" Text="Lecture" GroupName="roomType"  />
                <asp:RadioButton ID="roomType2" runat="server" Text="Seminar" GroupName="roomType"/><br />

    Seating Type: <asp:RadioButton ID="SeatingType1" runat="server" Text="Lecture" GroupName="seatingType"  />
                    <asp:RadioButton ID="SeatingType2" runat="server" Text="Flat" GroupName="seatingType"  /><br />
    Room Facilities:
        <asp:CheckBox ID="facility1" runat="server"  Text="Blu-ray Player" value="1"/> <!-- value is the facilityID -->
        <asp:CheckBox ID="facility2" runat="server"  Text="CD Player" value="2"/>
        <asp:CheckBox ID="facility3" runat="server"  Text="Chalk Boards" value="3"/>
        <asp:CheckBox ID="facility4" runat="server"  Text="Computer" value="4"/>
        <asp:CheckBox ID="facility5" runat="server"  Text="Data Projector" value="5"/>
        <asp:CheckBox ID="facility6" runat="server"  Text="Dual Data Projector" value="6"/><br /><br />

    <asp:Button ID="newRoomAddButton" Text="New Room" runat="server" CssClass="button" OnClientClick="Javascript:return false;" />
    <asp:Button ID="newRoomCancelButton" Text="Cancel" runat="server" CssClass="button" OnClientClick="Javascript:return false;" /> 
    </div>
    </form>
</body>
</html>
