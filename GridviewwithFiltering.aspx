<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeFile="GridviewwithFiltering.aspx.vb" Inherits="GridviewwithFiltering"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Round Result: List View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
     <img src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
        <h3 class="ttlbg_heading">Round Results: List View</h3>
<div onclick="window.location.href='TimetableView.aspx'" class="swapview"><span class="swapview_title">Switch to Timetable View</span></div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<br />
<br />
<br />
<br />

<div class="Facilities" onclick="showFailed()">Click For Facilities Key</div>
<br /><br />
<table style=" display: none; border: thin solid #000000; margin-bottom: 15px;" 
        class="failed" align="center">
    <tr>
      <td style="color: #FFFFFF; background-color: #660066">Data Projector</td>
      <td style="color: #FFFFFF; background-color: #660066">OHP</td>
      <td style="color: #FFFFFF; background-color: #660066">Chalk/Whiteboard</td>
      <td style="color: #FFFFFF; background-color: #660066">Large Board</td>
      <td style="color: #FFFFFF; background-color: #660066">Wheelchair Access</td>
      <td style="color: #FFFFFF; background-color: #660066">Air Conditioning</td>
      <td style="color: #FFFFFF; background-color: #660066">Video/DVD</td>
      <td style="color: #FFFFFF; background-color: #660066">Computer</td>
      <td style="color: #FFFFFF; background-color: #660066">PA</td>
      <td style="color: #FFFFFF; background-color: #660066">Radio Mic</td>
      <td style="color: #FFFFFF; background-color: #660066">Visualizer</td>
    </tr>
    <tr style="background-color:#CCCCCC ">
      <td align="center">1</td>
      <td align="center">2</td>
      <td align="center">3</td>
      <td align="center">4</td>
      <td align="center">5</td>
      <td align="center">6</td>
      <td align="center">7</td>
      <td align="center">8</td>
      <td align="center">9</td>
      <td align="center">10</td>
      <td align="center">11</td>
    </tr>
</table>
    <asp:GridView AutoGenerateRows="False" DataKeyNames="request_id" DataSourceID="Details"
            HeaderText="Details" ID="DetailsGrid" runat="server"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1"  GridLines="None"  
        AutoGenerateColumns="False" ForeColor="#CC0000" CssClass="DetailsView" 
        Width="888px">
            <EditRowStyle BackColor="#CC3399" Font-Bold="True" ForeColor="White" />
            <Columns>
               <asp:BoundField DataField="no_rooms" HeaderText="No. Rooms" SortExpression="no rooms" />
              <asp:BoundField DataField="no_students" HeaderText="No. Students" SortExpression="no students" />
              <asp:BoundField DataField="weeks" HeaderText="Weeks" ReadOnly="True" SortExpression="weeks" />
              <asp:BoundField DataField="facility_ids" HeaderText="Facility IDs" SortExpression="Facility IDs" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            </asp:GridView>


          <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" ID="SqlDataSource1"
            runat="server" SelectCommand="SELECT [request_id], [weeks], [no_rooms], [no_students], [facility_ids] FROM [Request] WHERE ([request_id] = @request_id)">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridViewResults" Name="request_id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>

        <div class="r_result2" align="center">
            <div class="GridviewDiv">
            <table style="border: medium solid #306; width: 800px; color: #FFFFFF; text-align: center; vertical-align: middle; margin-top: 0px;" 
                    border="0" cellpadding="0" cellspacing="1" 
                    class="GridviewTable" style="align:center;background-color: #B7B7B7">
                <tr >
                    <td style="border: thin solid #000000; width: 125px; font-weight: bold;" 
                        align="center">
                        Module Code
                    </td>
                    <td style="border: thin solid #000000; width: 383px; font-weight: bold;" >
                        Module Title
                    </td>
                    <td style="border: thin solid #000000; width:   120px; font-weight: bold;">
                        Day
                    </td>
                    <td style="border: thin solid #000000; width: 116px; font-weight: bold;">
                        Start
                        Time
                    </td>
                    <td style="border: thin solid #000000; width: 100px; font-weight: bold;">
                        Preference
                    </td>
                    <td style="border: thin solid #000000; width: 90px; font-weight: bold;">
                        Result
                    </td>
                     <td style="border: thin solid #000000; font-weight: bold;">
                        
                         </td>
                </tr>
                <tr >
                    <td style="border: thin solid #000000; width: 100px;" align="center">
                        <asp:DropDownList ID="ModuleCode" DataSourceID="modcode" AutoPostBack="True"
                            DataValueField="mod_code" runat="server" Width="90px" Font-Size="11px" 
                            AppendDataBoundItems="True" DataTextField="mod_code"
                            onselectedindexchanged="ModuleTitle_SelectedIndexChanged">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="modcode" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                            SelectCommand="SELECT [moduleCode], [moduleName] FROM [Module] WHERE moduleCode like 'CO%'"></asp:SqlDataSource>
                    </td>
                    <td style="border: thin solid #000000; width: 130px;">
                        <asp:DropDownList ID="ModuleTitle" DataSourceID="modcode" AutoPostBack="True"
                            DataValueField="mod_name" runat="server" Width="300px" Font-Size="11px" AppendDataBoundItems="True"
                            onselectedindexchanged="ModuleCode_SelectedIndexChanged" 
                            DataTextField="mod_name">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                  <asp:SqlDataSource ID="modtitle" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                            SelectCommand="SELECT [mod_name] FROM [Module]"></asp:SqlDataSource>
                    </td>
                    <td style="border: thin solid #000000; width: 105px;">
                        <asp:DropDownList ID="Day" DataSourceID="day2" AutoPostBack="true"
                            DataValueField="Day" runat="server" Width="70px" Font-Size="11px" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                     <asp:SqlDataSource ID="day2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                            SelectCommand="SELECT [day] FROM [day] ORDER BY [day_ID]"></asp:SqlDataSource>
                    </td>
                    <td style="border: thin solid #000000; width: 130px;">
                    <asp:DropDownList ID="Time" DataSourceID="timedata" AutoPostBack="true"
                            DataValueField="time" runat="server" Width="70px" Font-Size="11px" AppendDataBoundItems="true">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                     <asp:SqlDataSource ID="timedata" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                            SelectCommand="SELECT [time] FROM [time] ORDER BY [time_ID]"></asp:SqlDataSource>
                    </td>
                    <td style="border: thin solid #000000; width: 115px;">

                    </td>
                    <td style="border: thin solid #000000; width: 70px;">
                    <asp:DropDownList ID="Result" DataSourceID="PosResult" AutoPostBack="True"
                            DataValueField="resultvalue" runat="server" Width="65px" Font-Size="11px" 
                            AppendDataBoundItems="True" DataTextField="posresult">
                            <asp:ListItem Text="All" Value="%"></asp:ListItem>
                        </asp:DropDownList>
                     
                     <asp:SqlDataSource ID="PosResult" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                            SelectCommand="SELECT [PosResult], [resultid], [resultvalue] FROM [PosResult] ORDER BY [resultid]"></asp:SqlDataSource>
                    </td>
               <td style="border: thin solid #000000; width: 23px; font-weight: bold;">
                    </td>
                </tr>
                <tr>
                    <td colspan="7" align="center">
                        <asp:GridView ID="GridViewResults" EmptyDataText="No Results Match Your Filtering! Please Try Again!" 
                            EmptyDataRowStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False"
                            AllowSorting="True" DataSourceID="dsGridview" Width="900px" 
                            CssClass="Gridview" style="margin-top: 0px" DataKeyNames="request_id">
                                        <AlternatingRowStyle BackColor="#FFE3ED" />

<EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>

            <FooterStyle BackColor="#FFE3ED" ForeColor="Black" />
            <HeaderStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#FFE3ED" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFE3ED" ForeColor="Black"  HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#E0E0E0" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#FFE3ED" />
            <SortedAscendingHeaderStyle BackColor="#FFE3ED" />
            <SortedDescendingCellStyle BackColor="#FFE3ED" />
            <SortedDescendingHeaderStyle BackColor="#FFE3ED" />
                            <Columns>
                   <asp:BoundField DataField="request_id" Visible="false"></asp:BoundField>
                                <asp:BoundField DataField="mod_code" HeaderText="Sort" 
                                    SortExpression="mod_code" ItemStyle-Width="111px"
                                    ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center" Width="111px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="mod_name" HeaderText="Sort" SortExpression="mod_name"
                                    ItemStyle-Width="347px" >
<ItemStyle Width="347px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="day" HeaderText="Sort" SortExpression="day"
                                    ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="time" HeaderText="Sort" SortExpression="time"
                                    ItemStyle-Width="110px" >
<ItemStyle Width="110px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="rbp_ID" HeaderText="Sort" SortExpression="rbp_ID"
                                    ItemStyle-Width="96px" >
<ItemStyle Width="98px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="result" HeaderText="Sort" SortExpression="result"
                                    ItemStyle-Width="85px" >
<ItemStyle Width="79px"></ItemStyle>
                                </asp:BoundField>

                                <asp:CommandField ItemStyle-Width="8px" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="Pictures/info.png"> 
                                  
                                </asp:CommandField>
                            

                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            </div>
            <asp:SqlDataSource ID="dsGridview" runat="server" ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>"
                SelectCommand="SELECT dbo.Request.request_id, dbo.Request.moduleCode, dbo.Module.moduleName, dbo.Request.day, dbo.Request.time, dbo.Preference.rbp_ID, dbo.Request.result, dbo.Request.allocated, dbo.Module.mod_code, dbo.Request.Prefid, dbo.Preference.Prefid AS Expr2 FROM dbo.Module CROSS JOIN dbo.Request CROSS JOIN dbo.Preference WHERE (dbo.Module.dept_code = 'CO') AND dbo.Module.mod_code = dbo.Request.mod_code AND dbo.Request.Prefid = dbo.Preference.Prefid"               
                
                FilterExpression=" moduleCode LIKE '{0}%' AND moduleName LIKE '{1}%' AND day LIKE '{2}%' AND time LIKE '{3}%' AND (result LIKE '{4}%' OR allocated LIKE '{4}%')  " >
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModuleCode" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Module Title" ControlID="ModuleTitle" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Day" ControlID="Day" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="Time" ControlID="Time" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="PosResult" ControlID="Result" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
            </div>
<br />
<div></div>

       <asp:GridView AutoGenerateRows="False" DataKeyNames="request_id" DataSourceID="Details"
            HeaderText="Details" ID="GridView1" runat="server"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1"  GridLines="None" 
        AutoGenerateColumns="False" ForeColor="#CC0000" CssClass="DetailsView2" 
        Width="888px">
            <EditRowStyle BackColor="#CC3399" Font-Bold="True" ForeColor="White" />
            <Columns>
               <asp:BoundField DataField="no_rooms" HeaderText="No. Rooms" SortExpression="no rooms" />
              <asp:BoundField DataField="no_students" HeaderText="No. Students" SortExpression="no students" />
              <asp:BoundField DataField="weeks" HeaderText="Weeks" ReadOnly="True" SortExpression="weeks" />
              <asp:BoundField DataField="facility_ids" HeaderText="Facility IDs" SortExpression="Facility IDs" />
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            </asp:GridView>
          <asp:SqlDataSource ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" ID="Details"
            runat="server" SelectCommand="SELECT [request_id], [weeks], [no_rooms], [no_students], [facility_ids] FROM [Request] WHERE ([request_id] = @request_id)">
            <SelectParameters>
              <asp:ControlParameter ControlID="GridViewResults" Name="request_id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>


</asp:Content>
