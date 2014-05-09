<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modules_Page.aspx.cs" Inherits="Team_Projects._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Modules Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
 <img src="Pictures/ttlbg-sitecopy.jpg" Height="60px" Width="100%" />
        <h3 class="ttlbg_heading">Modules</h3>

        <script language="javascript" type="text/javascript">
            function add_module() {
               alert("Add");
            }

            function edit_module() {
                alert("Edit");
            }

            function remove_module() {
                    alert("Remove");
            }       
        </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <div style="position:relative;">
        <div class="controls">
            <div class="button_row" style="height: 67px">
                <div class="add_module">
                <br />
                    <asp:Button ID="Button1" runat="server" Height="30px" Width="100px" 
                        Text="Add Module" onclientclick="add_module();"/>
                </div>
                <div class="edit_module">
                    <asp:Button ID="Button2" runat="server" Height="30px" Width="100px" 
                    Text="Edit Module" onclientclick="edit_module();"/>
                
                </div>
                <div class="remove_module">
                    <asp:Button ID="Button3" runat="server" Height="30px" Width="120px" 
                    Text="Remove Module" onclientclick="remove_module();"/>
                </div>    
            </div>
            <div class="module_content" height="600px" style="align: "center";">
                <div class="module_list">
                    <asp:GridView ID="Modules_GridView" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" DataSourceID="Module_List" CellPadding="3" 
                        GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" 
                        BorderWidth="1px" style="margin-left: 15px" Width="700px">
                        <AlternatingRowStyle BackColor="#FFE3ED" />
                        <FooterStyle BackColor="#FFE3ED" ForeColor="Black" />
                        <HeaderStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="Black" />
                        <PagerStyle BackColor="#FFE3ED" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFE3ED" ForeColor="Black"  HorizontalAlign="Center"/>
                        <SelectedRowStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFE3ED" />
                        <SortedAscendingHeaderStyle BackColor="#FFE3ED" />
                        <SortedDescendingCellStyle BackColor="#FFE3ED" />
                        <SortedDescendingHeaderStyle BackColor="#FFE3ED" />
                        <Columns>
                            <asp:BoundField DataField="Module Code" HeaderText="Module Code" 
                                SortExpression="Module Code" />
                            <asp:BoundField DataField="Module Title" HeaderText="Module Title" 
                                SortExpression="Module Title" />
                            <asp:BoundField DataField="Lecturer" HeaderText="Lecturer" 
                                SortExpression="Lecturer" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="Module_List" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                        
                        
                        SelectCommand="SELECT mod_code AS 'Module Code', mod_name AS 'Module Title', lecturer_name AS 'Lecturer' FROM dbo.Module WHERE (dept_code = 'CO') ORDER BY 'Module Code'"></asp:SqlDataSource>
                </div>
            
            </div>        
        </div>
    </div>
    <div style="width:100%; height:1px; clear:both;"></div>
</asp:Content>
