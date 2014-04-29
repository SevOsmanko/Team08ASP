<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>
<%@ import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- 
        I am using the tabs function which is provided by jquery, so that you can switch the page very easy. 
        You can change the link of the tab if you want.   
        You do not need to do any programming in this page, unless you want to change the interface of the website.
        This page is only for web interface and page switching.
    -->

    <script src ='Scripts/jquery-1.8.2.js' type = 'text/javascript'></script>
    <link rel="stylesheet" href="Scripts/jquery-ui.css" />
    <script src="Scripts/jquery-ui.min.js"></script>
    <link rel="stylesheet" runat="server" media="screen" href="css/home.css" />
    <title>Team 08</title>
</head>

<script type="text/javascript">
    $(document).ready(function () {
        //=========Tab===============
        $("#committees").tabs();
        $("#committees").tabs({
            panelTemplate: "<iframe style='width:99%'></iframe>",
            idPrefix: "ui-tabs-",
            select: function (event, ui) {
                if (!$("#ui-tabs-" + ui.index).prop("src")) {
                    $("#ui-tabs-" + ui.index).attr("src", $.data(ui.tab, 'load.tabs'));
                }
            }
        });
        function resizeUi() {
            var h = $(window).height()-40;
            var w = $(window).width();
            $("#tabs").css('height', h - 95);
            $(".ui-tabs-panel").css('height', h - 140);
        };

        var resizeTimer = null;
        $(window).bind('resize', function () {
            if (resizeTimer) clearTimeout(resizeTimer);
            resizeTimer = setTimeout(resizeUi, 99);
        });
        resizeUi();
        //==========End Tab=================
    });
</script>
<body>
    <form id="form1" runat="server">
    <div>
        <a href="home.aspx"><img src="image/logo-loughborough-university.jpg" runat="server" style='height:15%; width:15%;right:5px'/></a>
    </div>
        <div style='position:absolute;top:0;right:0;'>Department: <b><% //Response.Write(myDataReader["name"]); %></b></div>
        <div id="committees">
        <!-- Change the tab -->
    	<ul>
    		<li><a href="#request_responses">Request Responses</a></li>
    		<li><a href="#pending_requests">Pending Requests</a></li>
    		<li><a href="#modules">Modules</a></li>
            <li><a href="#rooms">Rooms</a></li>
            <li><a href="#room_timetable">Room Timetable</a></li>
            <li><a href="#Rounds">Rounds</a></li>
            <li><a href="#Testing">Testing</a></li>
    	</ul>
        <!-- Get into difference page by clicking the tab -->
        <!-- Change the tab's link -->
    	<iframe id="request_responses" src="" style='width:97%'></iframe>
    	<iframe id="pending_requests" src="" style='width:97%'></iframe>
    	<iframe id="modules" src="module.aspx" style='width:97%'></iframe>
        <iframe id="rooms" src="room.aspx" style='width:97%'></iframe>
    	<iframe id="room_timetable" src="" style='width:97%'></iframe>
    	<iframe id="Rounds" src="" style='width:97%'></iframe>
        <iframe id="Testing" src="testing.aspx" style='width:97%'></iframe>
    </div>
    </form>
</body>
</html>