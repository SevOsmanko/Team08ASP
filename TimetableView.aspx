<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TimetableView.aspx.cs" Inherits="Team_Projects.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Round Result: Timetable View
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <img alt="banner" src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
     <h3 class="ttlbg_heading">Round Results: Timetable View</h3>
     <div onclick="window.location.href='GridviewwithFiltering.aspx'" class="swapview2"><span class="swapview_title">Switch to List View</span></div>
     </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<br />
<br />
<br />
<div class="timetable_title"><span class="Time_title">Timetable - Choose Module:
    <asp:DropDownList ID="ModCode" runat="server" DataSourceID="ModuleCodes" 
        DataTextField="mod_code" DataValueField="mod_code" AutoPostBack="True" 
        AppendDataBoundItems="true" Height="22px">
         <asp:ListItem Text="-" Value="0"></asp:ListItem>
        <asp:ListItem Text="All" Value="%"></asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="ModuleCodes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT [mod_code] FROM [Module] WHERE mod_code LIKE 'CO%'"></asp:SqlDataSource>
</span></div>
    <table border="1" align="center" style="width: 900px; ">
  <tbody>
    <!-- Results table headers -->
    <tr>
      <th align="center" height="30" width="50"></th>
      <th height="30" width="135">Monday</th>
      <th height="30" width="135">Tuesday</th>
      <th height="30" width="135">Wednesday</th>
      <th height="30" width="135">Thursday</th>
      <th height="30">Friday</th>
    </tr>
    <tr>
      <td align="center" width="50" style="height: 20px">09.00 - 09:50</td>
      <td width="125" style="height: 20px">
          <asp:GridView ID="GridView1" runat="server" DataSourceID="M1" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M1" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '09.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125" style="height: 20px">
          <asp:GridView ID="GridView2" runat="server" DataSourceID="T1" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T1" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '09.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125" style="height: 20px">
          <asp:GridView ID="GridView3" runat="server" DataSourceID="W1" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W1" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '09.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125" style="height: 20px">
          <asp:GridView ID="GridView4" runat="server" DataSourceID="TH1" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH1" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '09.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px; height: 20px;">
          <asp:GridView ID="GridView5" runat="server" DataSourceID="F1" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F1" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '09.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50" style="height: 20px">10.00 - 10:50</td>   
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView6" runat="server" DataSourceID="M2" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M2" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '10.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView14" runat="server" DataSourceID="T2" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T2" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '10.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView22" runat="server" DataSourceID="W2" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W2" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '10.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView30" runat="server" DataSourceID="TH2" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH2" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '10.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView38" runat="server" DataSourceID="F2" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F2" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '10.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" style="height: 20px" width="50">11.00 - 11:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView7" runat="server" DataSourceID="M3" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M3" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '11.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView15" runat="server" DataSourceID="T3" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T3" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '11.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView23" runat="server" DataSourceID="W3" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W3" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '11.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView31" runat="server" DataSourceID="TH3" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH3" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '11.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView39" runat="server" DataSourceID="F3" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F3" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '11.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50">12.00 - 12:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView8" runat="server" DataSourceID="M4" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M4" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '12.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView16" runat="server" DataSourceID="T4" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T4" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '12.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView24" runat="server" DataSourceID="W4" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W4" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '12.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView32" runat="server" DataSourceID="TH4" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH4" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '12.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView40" runat="server" DataSourceID="F4" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F4" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '12.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50">13.00 - 13:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView9" runat="server" DataSourceID="M5" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M5" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '13.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView17" runat="server" DataSourceID="T5" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T5" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '13.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView25" runat="server" DataSourceID="W5" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W5" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '13.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView33" runat="server" DataSourceID="TH5" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH5" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '13.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView41" runat="server" DataSourceID="F5" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F5" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '13.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50">14.00 - 14:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView10" runat="server" DataSourceID="M6" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M6" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '14.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView18" runat="server" DataSourceID="T6" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T6" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '14.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView26" runat="server" DataSourceID="W6" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W6" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '14.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView34" runat="server" DataSourceID="TH6" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH6" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '14.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView42" runat="server" DataSourceID="F6" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F6" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '14.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50">15.00 - 15:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView11" runat="server" DataSourceID="M7" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M7" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '15.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView19" runat="server" DataSourceID="T7" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T7" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '15.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView27" runat="server" DataSourceID="W7" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W7" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '15.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView35" runat="server" DataSourceID="TH7" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH7" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '15.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView43" runat="server" DataSourceID="F7" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F7" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '15.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50">16.00 - 16:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView12" runat="server" DataSourceID="M8" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M8" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '16.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView20" runat="server" DataSourceID="T8" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T8" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '16.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView28" runat="server" DataSourceID="W8" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W8" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '16.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView36" runat="server" DataSourceID="TH8" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH8" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '16.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView44" runat="server" DataSourceID="F8" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F8" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '16.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
      <td align="center" width="50">17.00 - 17:50</td>
       <td width="125" style="height: 20px">
          <asp:GridView ID="GridView13" runat="server" DataSourceID="M9" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="M9" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Monday' AND time LIKE '17.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView21" runat="server" DataSourceID="T9" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="T9" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Tuesday' AND time LIKE '17.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView29" runat="server" DataSourceID="W9" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="W9" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Wednesday' AND time LIKE '17.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td width="125">
          <asp:GridView ID="GridView37" runat="server" DataSourceID="TH9" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="TH9" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Thursday' AND time LIKE '17.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
      <td style="width: 125px">
          <asp:GridView ID="GridView45" runat="server" DataSourceID="F9" width="100%"
          EmptyDataText="No Requests" EmptyDataRowStyle-HorizontalAlign="Center"
              AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" 
              AllowPaging="True" PageSize="3" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" >
              <Columns>
                  <asp:BoundField DataField="mod_code" HeaderText="Module" />
                  <asp:BoundField DataField="result" HeaderText="Result" />
              </Columns>
              <FooterStyle BackColor="White" ForeColor="#000066" />
              <HeaderStyle BackColor="#800080" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="white" ForeColor="#000066" HorizontalAlign="Left" />
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#F1F1F1" />
              <SortedAscendingHeaderStyle BackColor="#007DBB" />
              <SortedDescendingCellStyle BackColor="#CAC9C9" />
              <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>
          <asp:SqlDataSource ID="F9" runat="server"
          ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, result FROM dbo.Request WHERE day = 'Friday' AND time LIKE '17.00%'  "
          FilterExpression=" mod_code LIKE '{0}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="Module Code" ControlID="ModCode" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
  </tbody>
</table>
<br />

</asp:Content>
