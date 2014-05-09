<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GridviewwithFiltering.aspx.vb"
    Inherits="GridviewwithFiltering"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
    <link rel="stylesheet" type="text/css" href="gridview.css" media="all" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <h3>Gridview with Filtering</h3>
            <div class="GridviewDiv">
            <table style="width: 540px" border="0" cellpadding="0" cellspacing="1" class="GridviewTable">
                <tr >
                    <td style="width: 120px;">
                        Module Code
                    </td>
                    <td style="width: 120px;" >
                        Module Title
                    </td>
                    <td style="width: 120px;">
                        Day
                    </td>
                    <td style="width: 130px;">
                        Time
                    </td>
                    <td style="width: 130px;">
                        Preference
                    </td>
                </tr>
                <tr >
                    <td style="width: 40px;">
                        <asp:DropDownList ID="ModuleCode" DataSourceID="dsGridview" AutoPostBack="True"
                            DataValueField="Module Code" runat="server" Width="120px" Font-Size="11px" 
                            AppendDataBoundItems="True" DataTextField="Module Code">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 120px;">
                        <asp:DropDownList ID="ModuleTitle" DataSourceID="dsGridview" AutoPostBack="true"
                            DataValueField="Module Title" runat="server" Width="120px" Font-Size="11px" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 120px;">
                        <asp:DropDownList ID="Day" DataSourceID="dsGridview" AutoPostBack="true"
                            DataValueField="Day" runat="server" Width="120px" Font-Size="11px" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 130px;">
                        <asp:DropDownList ID="Time" DataSourceID="dsGridview" AutoPostBack="true"
                            DataValueField="Time" runat="server" Width="120px" Font-Size="11px" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 130px;">
                        <asp:DropDownList ID="Preference" DataSourceID="dsGridview" AutoPostBack="true"
                            DataValueField="Preference" runat="server" Width="120px" Font-Size="11px" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="False"
                            AllowSorting="True" DataSourceID="dsGridview" Width="614px" 
                            CssClass="Gridview">
                            <Columns>
                                <asp:BoundField DataField="Module Code" HeaderText="Sort" SortExpression="Module Code" ItemStyle-Width="120px"
                                    ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Module Title" HeaderText="Sort" SortExpression="Module Title"
                                    ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Day" HeaderText="Sort" SortExpression="Day"
                                    ItemStyle-Width="120px" />
                                <asp:BoundField DataField="Time" HeaderText="Sort" SortExpression="Time"
                                    ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Preference" HeaderText="Sort" SortExpression="Preference"
                                    ItemStyle-Width="130px" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            </div>
            <asp:SqlDataSource ID="dsGridview" runat="server" ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>"
                SelectCommand="SELECT DISTINCT dbo.Request.mod_code AS 'Module Code', dbo.Module.mod_name AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Preference.rbp_ID AS 'Preference' FROM dbo.Request CROSS JOIN dbo.Module CROSS JOIN dbo.Preference WHERE dbo.Preference.Prefid = dbo.Request.Prefid AND dbo.Request.mod_code = dbo.Module.mod_code AND dept_code = 'CO' "
                FilterExpression="'ModuleCode' like '{0}%' and 'ModuleTitle' like '{1}%'">
                <FilterParameters>
                    <asp:ControlParameter Name="ModuleCode" ControlID="ModuleCode" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="ModuleTitle" ControlID="ModuleTitle" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Day" ControlID="Day" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Time" ControlID="Time" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Preference" ControlID="Preference" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource></div>
        </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>