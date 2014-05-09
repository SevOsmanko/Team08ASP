<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm11.aspx.cs" Inherits="Team_Projects._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">

    <form id="form1" runat="server">

      <h3>Northwind Employees</h3>

        <table cellspacing="10">            
          <tr>
            <td valign="top">
              <table border="0">
                <tr>
                  <td valign="top">Country</td>
                  <td><asp:DropDownList runat="server" id="CountryListBox" AppendDataBoundItems="True"
                                        DataSourceID="CountrySqlDataSource" 
                                        DataTextField="Park" DataValueField="Park" >
                        <asp:ListItem Selected="True" Value="" >(Show All)</asp:ListItem>
                      </asp:DropDownList>
                  </td>
                </tr>
                <tr>
                  <td>Last Name</td>
                  <td><asp:TextBox runat="server" id="LastNameTextBox" Text="*" /></td>
                </tr>
                <tr>
                  <td></td>
                  <td><asp:Button runat="server" id="FilterButton" Text="Filter Results" /></td>
                </tr>
              </table>
            </td>

            <td valign="top">                
              <asp:GridView ID="EmployeesGridView"
                DataSourceID="EmployeeDetailsSqlDataSource"
                AutoGenerateColumns="False"
                AllowSorting="True"
                RunAt="server">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>

                <AlternatingRowStyle backcolor="LightGray"/>

                <EditRowStyle backcolor="LightCyan"/>

                <Columns>                  
                  <asp:BoundField DataField="building_code" HeaderText="building_code" 
                        ReadOnly="true" SortExpression="building_code"/>                    
                  <asp:BoundField DataField="building_name"  HeaderText="building_name" 
                        SortExpression="building_name"/>
                  <asp:BoundField DataField="park"   HeaderText="park" SortExpression="park"/>                    
                </Columns>                 
              </asp:GridView>
            </td>                
          </tr>            
        </table>

        <asp:SqlDataSource ID="CountrySqlDataSource" 
          SelectCommand="SELECT dbo.Park.* FROM dbo.Park"
          EnableCaching="True"
          CacheDuration="60"
          ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>"
          RunAt="server" />

        <asp:SqlDataSource ID="EmployeeDetailsSqlDataSource" 
          SelectCommand="SELECT dbo.Building.* FROM dbo.Building"
          EnableCaching="True"
          CacheDuration="60"
          ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>"
          FilterExpression="Park LIKE '{0}' AND Building LIKE '{1}'"
          RunAt="server">

          <FilterParameters>
            <asp:ControlParameter ControlID="CountryListBox"   PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="LastNameTextBox" PropertyName="Text" />
          </FilterParameters>
        </asp:SqlDataSource>
      </form>

</asp:Content>
