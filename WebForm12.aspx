<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm12.aspx.cs" Inherits="Team_Projects._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <asp:Image ID="Image99" runat="server" 
        ImageUrl="Pictures/ttlbg-sitecopy.jpg" Height="60px" Width="100%"/>
        <h3 class="ttlbg_heading">Round Results</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<br />
<br />
<br />
<br />
<br />
    <asp:SqlDataSource ID="RoundResults" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
        SelectCommand="SELECT DISTINCT dbo.Request.mod_code AS 'Module Code', dbo.Module.mod_name AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Preference.rbp_ID AS 'Preference' FROM dbo.Request CROSS JOIN dbo.Module CROSS JOIN dbo.Preference WHERE dbo.Preference.Prefid = dbo.Request.Prefid AND dbo.Request.mod_code = dbo.Module.mod_code AND dept_code = 'CO' "
        FilterExpression="'Module Code' like '{0}%'">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModuleCode" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Module Title" ControlID="ModuleTitle" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>

<table style="width: 650px" border="0" cellpadding="0" cellspacing="1"
class="GridviewTable">
<tr>
    <td style="width: 50px;">
        Module Code
    </td>
    <td style="width: 150px;">
        Module Title
    </td>
    <td style="width: 150px;">
        Day
    </td>
    <td style="width: 150px;">
        Time
    </td>
    <td style="width: 150px;">
        Preference
    </td>
</tr>
<tr>
    <td style="width: 50px;">
        <asp:DropDownList ID="ModuleCode" DataSourceID="ModCode"
            AutoPostBack="True" DataValueField="mod_code" runat="server" Width="130px"
            Font-Size="11px" AppendDataBoundItems="True" DataTextField="mod_code">
            <asp:ListItem Text="All" Value="%"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="ModCode" runat="server" 
            ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
            SelectCommand="SELECT DISTINCT dbo.Request.mod_code FROM dbo.Request" EnableCaching="True"></asp:SqlDataSource>
    </td>
    <td style="width: 150px;">
        <asp:DropDownList ID="ModuleTitle" DataSourceID="RoundResults"
            AutoPostBack="true" DataValueField="Module Title" runat="server" Width="130px"
            Font-Size="11px" AppendDataBoundItems="true">
            <asp:ListItem Text="All" Value="%"></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td style="width: 150px;">
        <asp:DropDownList ID="Day" DataSourceID="RoundResults"
            AutoPostBack="true" DataValueField="Day" runat="server" Width="130px"
            Font-Size="11px" AppendDataBoundItems="true">
            <asp:ListItem Text="All" Value="%"></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td style="width: 150px;">
        <asp:DropDownList ID="Time" DataSourceID="RoundResults"
            AutoPostBack="true" DataValueField="Time" runat="server" Width="130px"
            Font-Size="11px" AppendDataBoundItems="true">
            <asp:ListItem Text="All" Value="%"></asp:ListItem>
        </asp:DropDownList>
    </td>
    <td style="width: 150px;">
        <asp:DropDownList ID="Preference" DataSourceID="RoundResults"
            AutoPostBack="true" DataValueField="Preference" runat="server" Width="130px"
            Font-Size="11px" AppendDataBoundItems="true">
            <asp:ListItem Text="All" Value="%"></asp:ListItem>
        </asp:DropDownList>
    </td>
</tr>
<tr>
    <td colspan="5">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        DataSourceID="RoundResults">
    </asp:GridView>

    </td>
</tr>
</table>
</asp:Content>
