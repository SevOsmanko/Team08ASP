<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="Team_Projects.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Loughborough Campus Map
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <asp:Image ID="Image99" runat="server" 
        ImageUrl="Pictures/ttlbg-sitecopy.jpg" Height="60px" Width="99%"/>
        <h3 class="ttlbg_heading">Campus Map</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<div >
    <div id="container">
        <iframe width="425" height="350" frameborder="20" scrolling="no" marginheight="5" marginwidth="0" src="http://maps.lboro.ac.uk"></iframe>
    </div>
</div>
</asp:Content>
