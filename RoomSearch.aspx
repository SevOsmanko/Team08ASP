<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RoomSearch.aspx.cs" Inherits="Team_Projects._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Rooms
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
         <img src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
        <h3 class="ttlbg_heading">Rooms</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:SqlDataSource ID="BuildingCode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT [buildingCode], [buildingName] FROM [Building]"></asp:SqlDataSource>
    <asp:DropDownList ID="BuildingCodeDrop" runat="server" 
        DataSourceID="BuildingCode" DataTextField="buildingName" 
        DataValueField="building_code" AutoPostBack="True">
    </asp:DropDownList>
    <asp:GridView ID="RoomInfo" runat="server" DataSourceID="rooms" DataKeyNames="room_code"
        AutoGenerateColumns="False">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="room_code" HeaderText="room_code" 
                SortExpression="room_code" />
            <asp:BoundField DataField="building_code" HeaderText="building_code" 
                SortExpression="building_code" />
            <asp:BoundField DataField="capacity" HeaderText="capacity" 
                SortExpression="capacity" />
            <asp:BoundField DataField="parkname" HeaderText="parkname" 
                SortExpression="parkname" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="rooms" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT dbo.Room.room_code, dbo.Room.buildingCode, dbo.Room.capacity, dbo.Building.parkname FROM dbo.Room INNER JOIN dbo.Building ON dbo.Room.buildingCode = dbo.Building.buildingCode"
        FilterExpression=" buildingCode LIKE '{0}%'  " >
                <FilterParameters>
                    <asp:ControlParameter Name="Building Code" ControlID="BuildingCodeDrop" PropertyName="SelectedValue" />
                </FilterParameters>
        </asp:SqlDataSource>
    <asp:GridView ID="FacilityGrid" runat="server" DataSourceID="RoomFacDetail" 
        AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="facility" HeaderText="facility" 
                SortExpression="facility" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="RoomFacDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        
        SelectCommand="SELECT DISTINCT dbo.Facilities.facility FROM dbo.Room INNER JOIN dbo.Room_Facilities ON dbo.Room.room_code = dbo.Room_Facilities.room_code INNER JOIN dbo.Facilities ON dbo.Room_Facilities.facility_id = dbo.Facilities.facility_id WHERE dbo.Room.room_code = @room_code">
        <SelectParameters>
            <asp:ControlParameter ControlID="RoomInfo" DefaultValue="room_code" 
                Name="room_code" PropertyName="SelectedValue" />
        </SelectParameters>
          </asp:SqlDataSource>
</asp:Content>
