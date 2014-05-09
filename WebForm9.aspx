<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs" Inherits="Team_Projects.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
</asp:Content>
SelectCommand="SELECT DISTINCT dbo.Room.room_code, dbo.Room.building_code, dbo.Room.capacity, dbo.Facilities.facility FROM dbo.Room CROSS JOIN dbo.Room_Facilities CROSS JOIN dbo.Facilities WHERE dbo.Room_Facilities.room_code = dbo.Room.room_code AND dbo.Room_Facilities.facility_id = dbo.Facilities.facility_id"></asp:SqlDataSource>
