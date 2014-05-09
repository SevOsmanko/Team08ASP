<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="Team_Projects.WebForm8" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:DropDownList ID="moduleCode" runat="server"   
        DataSourceID="SqlDataSource1" DataTextField="mod_code" 
        DataValueField="mod_code" AutoPostBack="True"
       onselectedindexchanged="moduleTitle_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
        SelectCommand="SELECT [mod_code], [mod_name] FROM [Module] ORDER BY [mod_code] ">
    </asp:SqlDataSource>
    <asp:DropDownList ID="moduleTitle" runat="server" AppendDataBoundItems="True"
        DataSourceID="SqlDataSource1" DataTextField="mod_name" 
        DataValueField="mod_code" 
        onselectedindexchanged="moduleCode_SelectedIndexChanged" 
        AutoPostBack="True" >
    </asp:DropDownList>
</asp:Content>
