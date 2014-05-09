<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestRoom.aspx.cs" Inherits="Team_Projects.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    Request Room
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server"> 
    <img alt="banner" src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
        <h3 class="ttlbg_heading">Make A Request</h3>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <!--  SINGLE REQUEST FORM  -->

<asp:ScriptManager ID="week_sm" runat="server" />
        <asp:UpdatePanel ID="Week_UpdatePanel" RenderMode="Block" ChildrenAsTriggers="true" UpdateMode="Always" runat="server">
            <ContentTemplate>
            

<div class="singlediv">

<strong style="margin-left:725px;">*   </strong> denotes mandatory field 


<fieldset>
<legend>Module Requirements</legend>
<table class="reqtable" style="width:100%;">

    
    <tr>
        <th>
        <asp:SqlDataSource ID="mod_code_SqlDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                
                SelectCommand="SELECT mod_code FROM dbo.Module WHERE dept_code='CO' ORDER BY mod_code"></asp:SqlDataSource>
            <label for="moduleCode">Module Code: *</label>
        </th>
        <td>
            <asp:DropDownList ID="moduleCode" runat="server" DataSourceID="mod_code_SqlDataSource" 
                DataTextField="mod_code" DataValueField="mod_code" 
                AutoPostBack="True" 
                onselectedindexchanged="moduleTitle_SelectedIndexChanged"></asp:DropDownList>
        </td>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
            
            
            
            SelectCommand="SELECT [mod_code], [dept_code], [mod_name] FROM [Module] WHERE ([dept_code] = @dept_code) ORDER BY [mod_name]">
            <SelectParameters>
                <asp:Parameter DefaultValue="CO" Name="dept_code" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <th>
            <label for="moduleTitle">Module Title: *</label>
        </th>
        <td>
            <asp:DropDownList ID="moduleTitle" runat="server" DataSourceID="SqlDataSource2" 
                DataTextField="mod_name" DataValueField="mod_code" 
                AutoPostBack="True" 
                onselectedindexchanged="moduleCode_SelectedIndexChanged"></asp:DropDownList> 
        </td>
    </tr>

    <tr>
        <th rowspan="2">
            <label for="day">Day: *</label>
        </th>
        <td rowspan="2"> 
	        <asp:DropDownList ID="dayInput" runat="server" DataTextField="day_input"
            DataValueField="day_input" OnSelectedIndexChanged="day_SelectedIndexChanged">
            <asp:ListItem>Monday</asp:ListItem>
            <asp:ListItem>Tuesday</asp:ListItem> 
            <asp:ListItem>Wednesday</asp:ListItem> 
            <asp:ListItem>Thursday</asp:ListItem> 
            <asp:ListItem>Friday</asp:ListItem>  
        </asp:DropDownList>
        </td>

        <th rowspan="2">
            <label for="period">Start time: *</label>
        </th>
        <td rowspan="2" style="padding-right:0px;">
  	         <asp:DropDownList ID="startTime" runat="server" DataTextField="start_time"
            DataValueField="start_time" OnSelectedIndexChanged="starttime_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem >09:00</asp:ListItem>
                <asp:ListItem>10.00</asp:ListItem> 
                <asp:ListItem>11.00</asp:ListItem> 
                <asp:ListItem>12.00</asp:ListItem> 
                <asp:ListItem>13.00</asp:ListItem>
                <asp:ListItem>14.00</asp:ListItem>
                <asp:ListItem>15.00</asp:ListItem>
                <asp:ListItem>16.00</asp:ListItem>
                <asp:ListItem>17.00</asp:ListItem>  
            </asp:DropDownList>

            <strong>to: </strong>
	        <asp:DropDownList ID="endTime" runat="server" DataTextField="end_time"
            DataValueField="end_time" OnSelectedIndexChanged="endtime_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>09:50</asp:ListItem>
                <asp:ListItem>10.50</asp:ListItem> 
                <asp:ListItem>11.50</asp:ListItem> 
                <asp:ListItem>12.50</asp:ListItem> 
                <asp:ListItem>13.50</asp:ListItem>
                <asp:ListItem>14.50</asp:ListItem>
                <asp:ListItem>15.50</asp:ListItem>
                <asp:ListItem>16.50</asp:ListItem>
                <asp:ListItem>17.50</asp:ListItem>  
            </asp:DropDownList>
        </td>
        <td rowspan="2">
            <asp:CheckBox ID="priority_checkbox" runat="server" Text="Priority"/>
        </td>
    </tr>
</table>

</fieldset>
<br />
<div class='v'>
<fieldset class="roomreq" 
        style="position:relative; float:left;">

<legend>Room Requirements</legend>

<div class="reqtable" style="position:relative;">        
        <div class="rooms_bar">
            <div class="row">
                <div class="left_cell">
                <label for="">No of Rooms: *</label>
                </div>
                <div class="right_cell" style="margin-left: 22px;">
                    <asp:DropDownList ID="noOfRooms" runat="server" DataTextField="noof_rooms"
            DataValueField="noof_rooms" OnSelectedIndexChanged="noofrooms_SelectedIndexChanged">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem> 
                <asp:ListItem>3</asp:ListItem> 
                </asp:DropDownList>
                </div>
            </div>
        </div>
       
       <div class="rooms_bar">
        <div class="row">       
            <label class="left_cell" for="noofstuds">No of Students: *</label>
            <div class="right_cell" style="margin-left: 17px;">
                <asp:TextBox ID="noofStuds" name="noofStuds" runat="server" style="width:60px; height: 15px;"  
                size="5" MaxLength="3" onkeypress="return isNumberKey(event)"></asp:TextBox>
            </div>
        </div>
           <asp:RequiredFieldValidator ID="rfvstudents" runat="server" 
               ControlToValidate="noofStuds" ErrorMessage="Please enter number of students"></asp:RequiredFieldValidator>
      </div>
        
        <div class="rooms_bar">
        <div class="row">        
            <label class="left_cell" for="roomtype">Room Type:</label>
            <div class="right_cell"style="margin-left: 46px;">            
	          <asp:DropDownList ID="roomType" runat="server" DataTextField="roomType"
            DataValueField="roomType" OnSelectedIndexChanged="roomtype_SelectedIndexChanged">
                <asp:ListItem>Any</asp:ListItem>
                <asp:ListItem>Lecture</asp:ListItem> 
                <asp:ListItem>Seminar</asp:ListItem> 
                </asp:DropDownList>
            </div>
        </div>
    </div>
            
        

    <!-- LOCATION TYPE -->
    <div class="rooms_bar">
        <div class="row">
	        <label class="left_cell" for="location_type">Select location by: </label>
            <div class="right_cell">
                <asp:RadioButtonList ID="locationType" runat="server" AutoPostBack="True" 
                    RepeatDirection="Horizontal" 
                    onselectedindexchanged="locationType_SelectedIndexChanged" >
                    <asp:ListItem Selected="True" >No Preference</asp:ListItem>
                    <asp:ListItem>Park</asp:ListItem>
                    <asp:ListItem>Building</asp:ListItem>
                    <asp:ListItem>Room</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
	</div>
	 <!-- PARK -->
     <div class="rooms_bar">
		<div class="row">
            <label class="left_cell" for="park">Park: </label>
            <div class="right_cell" style="margin-left: 90px;">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT [park], [park_code] FROM [Park] ORDER BY [park]">
            </asp:SqlDataSource>
            <asp:DropDownList id="parkDropDown" name="park" runat="server" 
                DataSourceID="SqlDataSource3" DataTextField="park" DataValueField="park" 
                    Enabled="false" onselectedindexchanged="parkDropDown_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            </div>
        
                
	    </div>	
    </div>
			 <!-- BUILDING -->
             <div class="rooms_bar">
				<div class="row">
                
                    <label class="left_cell" for="park">Building: </label>
                    <div class="right_cell" style="margin-left: 73px;">
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                        SelectCommand="SELECT building_name, building_code, parkname FROM dbo.Building  ORDER BY building_name" 
                        FilterExpression=" parkname LIKE '{0}%'">
                        <FilterParameters>
                    <asp:ControlParameter Name="ParkFilter" ControlID="parkDropDown" PropertyName="SelectedValue" />
                </FilterParameters>
           </asp:SqlDataSource>

                    <asp:DropDownList id="buildingDropDown" name="building" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="building_name" 
                        DataValueField="building_name" AutoPostBack="True" Height="22px" Width="150px" 
                            Enabled="false" onselectedindexchanged="buildingDropDown_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                
                    
            </div>
        </div>
             <!-- ROOM -->
             <div class="rooms_bar">
				<div class="row">
                <label class="left_cell" style="margin-top:-10px;" for="room">Room: </label>
                <div class="right_cell" style="margin-left: 83px; margin-top:-10px;">
                
                 
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                        SelectCommand="SELECT dbo.Room.room_code, dbo.Room.building_code, dbo.Building.building_name FROM dbo.Room CROSS JOIN dbo.Building WHERE dbo.Building.building_code = dbo.Room.building_code ORDER BY dbo.Room.room_code" 
                        FilterExpression="building_name LIKE '{0}%'">
                        <FilterParameters>
                    <asp:ControlParameter Name="BuildingFilter" ControlID="buildingDropDown" PropertyName="SelectedValue" />
                </FilterParameters>
                </asp:SqlDataSource>
                
                <asp:DropDownList id="roomDropDown" name="room" runat="server" 
                    DataSourceID="SqlDataSource5" DataTextField="room_code" 
                    DataValueField="room_code" AutoPostBack="True" Enabled="false" 
                        onselectedindexchanged="roomDropDown_SelectedIndexChanged">
                </asp:DropDownList>
                
                </div>
               
            </div>
        </div>
    </div>

</fieldset>


<fieldset class="specreq">

<legend>Special Requirements</legend>



<table class="reqtable" style="position:relative; float:left;">
    <tr>
        <th>
            <label for="wks">Weeks: *</label>
        </th>
    <td style="position:relative; text-align:center;">
        
                <asp:CheckBoxList ID="weekCheckBox" runat="server" RepeatDirection="Horizontal" 
                    RepeatLayout="Table" 
                    onselectedindexchanged="weekCheckBox_SelectedIndexChanged" 
                    AutoPostBack="True" >
                    <asp:ListItem Selected="True"  >1</asp:ListItem>
                    <asp:ListItem Selected="True" Value="item2">2</asp:ListItem>
                    <asp:ListItem Selected="True">3</asp:ListItem>
                    <asp:ListItem Selected="True">4</asp:ListItem>
                    <asp:ListItem Selected="True">5</asp:ListItem>
                    <asp:ListItem Selected="True">6</asp:ListItem>
                    <asp:ListItem Selected="True">7</asp:ListItem>
                    <asp:ListItem Selected="True">8</asp:ListItem>
                    <asp:ListItem Selected="True">9</asp:ListItem>
                    <asp:ListItem Selected="True">10</asp:ListItem>
                    <asp:ListItem Selected="True">11</asp:ListItem>
                    <asp:ListItem Selected="True">12</asp:ListItem>
                    <asp:ListItem Selected="False" Value="item1">13</asp:ListItem>
                    <asp:ListItem Selected="False">14</asp:ListItem>
                    <asp:ListItem Selected="False">15</asp:ListItem>
                </asp:CheckBoxList>

        
		</td>
    </tr>
<tr>
    <td align="center" style="padding-left:30px;">&nbsp;</td>
    <td height=""> 
        <asp:Button ID="week_all" runat="server" onclick="week_all_Click" Text="All" />
        <asp:Button ID="week_term" runat="server" Text="1 - 12" onclick="week_term_Click" />
        <asp:Button ID="week_odd" runat="server" onclick="week_odd_Click" Text="Odd" />
        <asp:Button ID="week_even" runat="server" onclick="week_even_Click" Text="Even" />
        <asp:Button ID="week_none" runat="server" onclick="week_none_Click" Text="None" />
    </td>
    </tr>
    <tr>          
        <th>
            <label for="specreq">Special Requirement:</label>
        </th> 
            <td>
                <asp:TextBox ID="specreq" TextMode="MultiLine" runat="server" Height="140px" Width="410px"></asp:TextBox>
            </td> 
    </tr>
</table>
            
</fieldset>



<span class='notify' style='margin-top:6px; display:none;'>Request Sent</span>
<span class='unotify' style='margin-top:6px; display:none;'>Request Updated</span>
<br />

<div class='errorssection'>
<span class="error"> </span>
<span class="moreerror"> </span>
<span class="moremoreerror"> </span>
</div>





<fieldset class="faclty">

<legend class="legendfaclty"><p>Select Facilities</p></legend>

<div id="facilities" >
    <asp:CheckBoxList ID="fac_checkboxes" runat="server" RepeatDirection="Horizontal" Width="850px" Visible="true" 
        onselectedindexchanged="fac_checkboxes_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Text="Computer" value="1" Enabled="true" Selected="False"></asp:ListItem>
        <asp:ListItem Text="Projector" value="2" Enabled="true" Selected="False"></asp:ListItem>
        <asp:ListItem Text="OHP" value="3" Enabled="true" Selected="False"></asp:ListItem>
        <asp:ListItem Text="Chalk/WhiteBoard" value="4" Enabled="true" Selected="False"></asp:ListItem>

        <asp:ListItem Text="Large Board" value="5" Enabled="true" Selected="False"></asp:ListItem>
        <asp:ListItem Text="WheelChair Access" value="6" Enabled="true" Selected="False"></asp:ListItem>
        <asp:ListItem Text="Air Conditioning" value="7" Enabled="true" Selected="False"></asp:ListItem>
        <asp:ListItem Text="Video/DVD" value="8" Enabled="true" Selected="False"></asp:ListItem>
    </asp:CheckBoxList>



 
</div>
 


</fieldset>
<br />
 
<fieldset class="faclty">
<div class="formbtns">
    
    <asp:Button ID="submitButton" runat="server" Text="Submit" onclick="submitButton_Click" style="float:right;" />

    <asp:Button ID="updateButton" runat="server" Text="Update" onclick="updateButton_Click" style="float:right;" />

    <asp:Button ID="resetButton" runat="server" Text="Reset" onclick="resetButton_Click" style="float:right;" />

</div>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
<br />
</fieldset>
</div>
        
        </ContentTemplate> 
        </asp:UpdatePanel>
</asp:Content>