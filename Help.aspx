<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="Team_Projects.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Help Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <asp:Image ID="Image99" runat="server" 
        ImageUrl="Pictures/ttlbg-sitecopy.jpg" Height="60px" Width="100%"/>
        <h3 class="ttlbg_heading">Help</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<div style="height:2028px;">
    <fieldset class="help_list"><legend><h2>Accessibility Help</h2></legend>
    <h4>Increasing Text Size</h4>
    <p>To increase the text size on our Web pages, you can change the settings in your Web browser. Just follow the instructions below based on the browser you are using or see your browser's help for details.</p>

    <h5>Internet Explorer</h5>
    <ol>
        <li>Select "View" in the menu bar.</li>
        <li>Select "Text Size".</li>
        <li>Select "Larger" or "Largest".</li>
    </ol>

    <h5>Mozilla Firefox</h5>
    <ol>
        <li>Select "View" in the menu bar.</li>
        <li>Select "Text Size".</li>
        <li>Select "Increase".</li>
        <li>To increase the text size further, continue selecting "Increase".</li>
    </ol>

    <h5>Opera</h5>
    <ol>
        <li>Select "View" in the menu bar.</li>
        <li>Select "Zoom".</li>
        <li>From the menu, select the size with which you would like to view the Web site.</li>
        <li>To increase the text size further, increase the percentage.</li>
    </ol>
    <h5>Safari</h5>
    <ol>
	    <li>Select "Preferences" in the "Safari" menu.</li>
	    <li>Select "Advanced".</li>
	    <li>Use the "Other" button to select your client-side CSS file.</li>
	    <li>Confirm the changes by using the "OK" button.</li>
    </ol>

    </fieldset>

    <fieldset class="help_list">
    <legend><h2>Using the map to aid browsing</h2></legend>

    <p>Using the map can dramatically help you in finding the room or building in the most ideal place on campus. The interactive map will allow you to drag, thereby browsing across the campus, but it also allows the interaction of buildings. Clicking on a building's icon will tell you a little about it and show you what facilites and departments are linked with it.</p>
    <p>As you can see by the example below, there are also other features such as the search bar where you can search for any building or department on the campus and it will find this for you</p>
    <div class="mapexample">
    <asp:Image ID="Image2" runat="server" 
            ImageUrl="Pictures/mapexample.png" Height="350px" />

     </div>
    <p>As you can see there is also a list of collapsable menus, enabling the user to find what they are looking for if they do not know the code. It categorises related buildings together, either by department, facilities or by foo and drink.</p>
    <br />    <br />
    </fieldset>

    <fieldset class="help_list">
    <legend><h2>Navigational help</h2></legend>
    <p>Our web site has been designed to provide an extremely simple solution to navigation.</p>
    <br />


    <h5 id="rr">Round Results</h5>
    <p> Here you are able to view the results of the current round, or multiple rounds. <br />
    The results are able to be sorted through all fields. </p>

    <h5 id="ra">Room Availability</h5>
    <p>Here you can see whether a room you have searched for is free to be booked.<br />
    You can view an image of the room and the facilities available in the room.<p/> 

    <h5 id="mr">My Requests</h5>
    <p>My Requests enables you to view all the requests you have made; whether allocated, pending, failed or cancelled. <br />
    You can easily view the module code and title, the requested time booked, and the allocated room.</p>
    <p>You are also able to create a new room request using the button on the right hand side of the page. </p>

    <h5 id="map">Map</h5>
    <p>You can discover everything Loughborough campus has to offer by viewing the interactive campus map.</p>
    <p>Easily look through different departments, facilities and other areas of interest by using the drop down boxes on the left, or directly search for a specific building using the search box. </p>

    </fieldset>
</div>
 
</asp:Content>
