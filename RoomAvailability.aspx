<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomAvailability.aspx.cs" Inherits="Team_Projects.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Room Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <img alt="banner" src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
     <h3 class="ttlbg_heading">Room Availability</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <br /><br /><br /><br />

<div class="RoomSearch" onclick='showPending()'><span  class="Request_title">Room Search</span></div>
<div class="pending" >
<br />
 <asp:SqlDataSource ID="BuildingCode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT [buildingCode], [buildingName] FROM [Building]"></asp:SqlDataSource>
<div style="margin-left: 50px; width: 520px;"><label for="SelectBuilding">Select Building</label>
        <asp:DropDownList ID="BuildingCodeDrop" runat="server" 
        DataSourceID="BuildingCode" DataTextField="buildingName" 
        DataValueField="buildingCode" AutoPostBack="True" Enabled="true" 
         AppendDataBoundItems="true" style="margin-left:10px;">
        <asp:ListItem Text="-" Value="0" Selected="True"></asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Book_RoomBtn" runat="server" Text="Book Room" />

    </div>

    <asp:SqlDataSource ID="rooms" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT dbo.Room.roomCode, dbo.Room.buildingCode, dbo.Room.capacity, dbo.Building.parkCode FROM dbo.Room INNER JOIN dbo.Building ON dbo.Room.buildingCode = dbo.Building.buildingCode"
        FilterExpression=" buildingCode LIKE '{0}%'  " >
                <FilterParameters>
                    <asp:ControlParameter Name="Building Code" ControlID="BuildingCodeDrop" PropertyName="SelectedValue" />
                </FilterParameters>
        </asp:SqlDataSource>
    <!-- @room_code -->
    <asp:SqlDataSource ID="RoomFacDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        
        SelectCommand="SELECT DISTINCT dbo.facility.facility FROM dbo.Room INNER JOIN dbo.room_facility ON dbo.Room.roomCode = dbo.room_facility.roomCode INNER JOIN dbo.facility ON dbo.room_facility.facility_id = dbo.facility.facility_id WHERE dbo.Room.roomCode = @roomCode">
        <SelectParameters>
            <asp:ControlParameter ControlID="RoomInfo" DefaultValue="roomCode" 
                Name="roomCode" PropertyName="SelectedValue" />
        </SelectParameters>
          </asp:SqlDataSource>
<br />
    <asp:GridView ID="RoomInfo" runat="server" DataSourceID="rooms" DataKeyNames="roomCode"
        AutoGenerateColumns="False" BackColor="White" BorderColor="White" 
        BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
        GridLines="None" style="float: left; margin-left: 68px;" Width="511px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="Pictures/info.png" />
            <asp:BoundField DataField="roomCode" HeaderText="Room" SortExpression="roomCode" />
            <asp:BoundField DataField="buildingCode" HeaderText="Building Code" SortExpression="buildingCode" />
            <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
            <asp:BoundField DataField="parkCode" HeaderText="Park" SortExpression="parkCode" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>

  
    <asp:GridView ID="FacilityGrid" runat="server" DataSourceID="RoomFacDetail" 
        AutoGenerateColumns="False" BackColor="#CCCCCC" 
    BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" ForeColor="Black" style="float: left; margin-left: 70px; margin-top: 0px;" 
        Width="179px">
        <Columns>
            <asp:BoundField DataField="facility" HeaderText="Rooms Facilities" SortExpression="facility" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#993399" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>


    <div style="height:5px; width:100%; clear:both;"></div>
</div>

<br />
<div class="RoomSearch" onclick='showFailed()'><span class="Request_title">Room Search Suggestions</span></div>
<div class="failed"  style="display:none">
<div id="roomavailability"><br />
    <div class="room_availability_row">
        <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV1" class="roomAV" href="Pictures/rooms/CC011BIG.jpg" title="Data projector, Computer, Video/DVD, OHP, White board, PA, Radio mic, Visualizer"><img class="last" alt="CC011" src="Pictures/rooms/CC011.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">CC.0.11</div>
        </div>
        <div class="room_instance"> 
            <div class="picRow"> 
		        <a id="roomAV2" class="roomAV" href="Pictures/rooms/CC012BIG.jpg" title="Data projector, Computer, Video/DVD, OHP, White board, PA, Radio mic, Visualizer"><img class="last" alt="CC012" src="Pictures/rooms/CC012.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">CC.0.12</div>
        </div>
        <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV3" class="roomAV" href="Pictures/rooms/CC013BIG.jpg" title="Data projector, Computer, Video/DVD, OHP, White board, PA, Radio mic, Visualizer"><img class="last" alt="CC013" src="Pictures/rooms/CC013.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">CC.0.13</div>
        </div>
     </div>

     <div class="room_availability_row">
        <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV4" class="roomAV" href="Pictures/rooms/CC014BIG.jpg" title="Computer, Data projector, Video/DVD, White boards, Visualizer"><img class="last" alt="CC014" src="Pictures/rooms/CC014.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">CC.0.14</div>
         </div>
         <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV5" class="roomAV" href="Pictures/rooms/RT037BIG.jpg" title="Computer, Data projector, DC control, Video/DVD, OHP, Chalk boards"><img class="last" alt="RT037" src="Pictures/rooms/RT037.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">RT.0.37</div>
        </div>
        <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV6" class="roomAV" href="Pictures/rooms/S173BIG.jpg" title="Data projector, Computer, Video/DVD, OHP, Chalk boards"><img class="last" alt="S173" src="Pictures/rooms/S173.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">S.1.73</div>
        </div>
    </div>

    <div class="room_availability_row">
        <div class="room_instance">
            <div class="picRow">
		            <a id="roomAV7" class="roomAV" href="Pictures/rooms/SMB102BIG.jpg" title="Data projector trolley, Video/DVD, OHP."><img class="last" alt="SMB102" src="Pictures/rooms/SMB102.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">SMB.1.02</div>
        </div>
        <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV8" class="roomAV" href="Pictures/rooms/SMB108BIG.jpg" title="Data projector"><img class="last" alt="SMB108" src="Pictures/rooms/SMB108.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">SMB.1.08</div>
        </div>
        <div class="room_instance">
            <div class="picRow">
		        <a id="roomAV9" class="roomAV" href="Pictures/rooms/a001BIG.jpg" title="Computer, Data projector, Video/DVD, OHP, White boards"><img class="last" alt="a001" src="Pictures/rooms/a001.jpg" /></a>
            </div>
            <div style="font-family: Verdana; text-align: center;">A.0.01</div>
        </div>
    </div>
    <div style="height:33px; width:100%; clear:both;"></div>
</div>
</div>




<br />
</asp:Content>
