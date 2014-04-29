<%@ Page Language="C#" AutoEventWireup="true" CodeFile="room.aspx.cs" Inherits="room" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src ='Scripts/jquery-1.8.2.js' type = 'text/javascript'></script>
</head>
<body>
    <script>
        $(document).ready(function () {
            $(".RowButton").click(function () {
                var roomName = $(this).closest("td").prev().prev().prev().prev().prev().prev().html(); //Get the room name
                var buildingCode = $(this).closest("td").prev().prev().prev().prev().prev().html(); //Get the building code
                var buildingName = ""; //create empty string for storing building name
                var park = $(this).closest("td").prev().prev().prev().prev().html(); //Get park 
                var roomType = $(this).closest("td").prev().prev().prev().html(); //Get room type
                var seatingType = $(this).closest("td").prev().prev().html(); //Get seating type
                var capacity = $(this).closest("td").prev().html(); //Get capacity
                var facility = ""; //create empty string for storing facility
                var detailItem = $(this).closest("tr").next(); //select the detail row, and store into detailItem

                detailItem.html("<b>Name: </b>" + roomName + "<br>"); //Write detail 1/3

                //Get the building name form other page (getData.aspx)
                $.ajax({
                    type: "POST",
                    url: "getData.aspx/getRoomDetail_buildingName", //Goto this page
                    data: "{buildingCode: '" + buildingCode + "'}", //pass some data to the other page
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function (xhr) {
                        alert(xhr.responseText); //If error, show the error message
                    },
                    success: function (response) { //If success, do this
                        var resultString = response; //get the return value
                        var result = jQuery.parseJSON(JSON.stringify(resultString)).d; //Change it into string from json

                        //Write detail 2/3
                        detailItem.append("<b>Building Name: </b>" + result + "<br><b>Building Code: </b>" +
                            buildingCode + "<br><b>Park: </b>" + park + "<br><b>Room Type: </b>" + roomType + "<br><b>Seating Type: </b>" +
                            seatingType + "<br><b>Capacity: </b>" + capacity + "<br><b>Facility: </b><br>");
                    }
                });

                

                //Get facility
                $.ajax({
                    type: "POST",
                    url: "getData.aspx/getRoomDetail_facility", //Goto this page
                    data: "{roomName: '" + roomName + "'}", //pass some data to the other page
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error: function (xhr) {
                        alert(xhr.responseText);
                    },
                    success: function (response) {
                        var resultString = response; //get the return value
                        var result = jQuery.parseJSON(JSON.stringify(resultString)).d; //show the title on the textbox
                        var data = result.split('~'); //cut the string if there is '~', the result is array
                        var facility = "";
                        for (var i = 0; data.length-1 > i; i++) //loop all the facility array
                        {
                            if (i == data.length - 2) //Because the last array item is empty, so -2
                                facility += data[i]; //put into the string, it is the last item, so no ','
                            else
                                facility += data[i] + ", "; //put into the string
                        }
                        detailItem.append(facility); //Write detail 3/3
                    }
                });

                //check id the detail table display or not
                if ($(this).closest("tr").next().is(':visible')) {
                    $(this).closest("tr").next().fadeOut(); //If it is displaying, hide it
                } else {
                    $(this).closest("tr").next().fadeIn(); //If it is not displaying, display it
                }
            });

            //Redirect to "newRoom.aspx" for create a new room
            $("#newRoom").click(function () {
                location.href = "newRoom.aspx";
            });
        });
    </script>

    <form id="form1" runat="server">
    <div>
        <!-- the list of the room -->
        <asp:table borderwidth="1" id="roomList" runat="server" Width="60%"></asp:table> 
    </div>
    <div>
        <!-- New Room Button -->
        <asp:Button ID="newRoom" Text="New Room" runat="server" CssClass="button" OnClientClick="Javascript:return false;" />
    </div>
    </form>
</body>
</html>
