<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Team_Projects.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Heading" ContentPlaceHolderID="Heading" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">
    <div><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT [room_code], [capacity], [style], [type], [building_code] FROM [Room]"></asp:SqlDataSource>
   <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
            Height="329px" Width="958px">
    </asp:GridView></div>
</asp:Content>


