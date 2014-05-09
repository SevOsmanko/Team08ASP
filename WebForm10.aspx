<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm10.aspx.cs" Inherits="Team_Projects.WebForm10" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
<br />
<br />
<br />
<br />  
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
        CellPadding="5" CellSpacing="5" RepeatDirection="Horizontal">
    <asp:ListItem Value="1" selected="true">Allocated</asp:ListItem>
    <asp:ListItem Value="NULL">Pendind</asp:ListItem>
    <asp:ListItem Value="0" >Cancelled</asp:ListItem>
    </asp:RadioButtonList>
    
    <table border="1" bordercolor="#FFCC00" 
        
        style="border: thin solid #800080; background-color:#CCCCCC; text-align: center; vertical-align: middle;" 
        cellpadding="0" cellspacing="3" class='ttable' align="center">
	<thead>
		<tr>
            <th width="70" style="border: thin solid #800080"></th>
			<th style="border: thin solid #800080">MONDAY</th>
			<th style="border: thin solid #800080">TUESDAY</th>
			<th style="border: thin solid #800080">WEDNESDAY</th>
			<th style="border: thin solid #800080">THURSDAY</th>
			<th style="border: thin solid #800080">FRIDAY</th>
		</tr>
	</thead>
	<tbody>
   	<tr>
    	<td width="70" style="border: thin solid #800080">9am</td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="M1">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    allocated:
                    <asp:Label ID="allocatedLabel" runat="server" Text='<%# Eval("allocated") %>' />
                    <br />
                    Cancelled2:
                    <asp:Label ID="Cancelled2Label" runat="server" 
                        Text='<%# Eval("Cancelled2") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    allocated:
                    <asp:TextBox ID="allocatedTextBox" runat="server" 
                        Text='<%# Bind("allocated") %>' />
                    <br />
                    Cancelled2:
                    <asp:TextBox ID="Cancelled2TextBox" runat="server" 
                        Text='<%# Bind("Cancelled2") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    allocated:
                    <asp:TextBox ID="allocatedTextBox" runat="server" 
                        Text='<%# Bind("allocated") %>' />
                    <br />
                    Cancelled2:
                    <asp:TextBox ID="Cancelled2TextBox" runat="server" 
                        Text='<%# Bind("Cancelled2") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    allocated:
                    <asp:Label ID="allocatedLabel" runat="server" Text='<%# Eval("allocated") %>' />
                    <br />
                    Cancelled2:
                    <asp:Label ID="Cancelled2Label" runat="server" 
                        Text='<%# Eval("Cancelled2") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    allocated:
                    <asp:Label ID="allocatedLabel" runat="server" Text='<%# Eval("allocated") %>' />
                    <br />
                    Cancelled2:
                    <asp:Label ID="Cancelled2Label" runat="server" 
                        Text='<%# Eval("Cancelled2") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="M1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT DISTINCT mod_code, allocated, Cancelled2 FROM dbo.Request WHERE day = 'Monday' AND time LIKE '09:00%'  "
                FilterExpression=" allocated = '{0}%' or allocated LIKE '{1}%' AND Cancelled2 = 0 or Cancelled2 NOT LIKE '{2}%' ">
                <FilterParameters>
                    <asp:ControlParameter Name="RadioButtonList1" ControlID="RadioButtonList1" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="RadioButtonList1" ControlID="RadioButtonList1" PropertyName="SelectedValue" />
                    <asp:ControlParameter Name="RadioButtonList1" ControlID="RadioButtonList1" PropertyName="SelectedValue" />
                </FilterParameters>
           
           
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView2" runat="server" DataSourceID="T1">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="T1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Tuesday' AND time LIKE '09:00%'"></asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080" >
            <asp:ListView ID="ListView3" runat="server" DataSourceID="W1">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="W1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Wednesday' AND time LIKE '09:00%' ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView4" runat="server" DataSourceID="TH1">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="TH1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Thursday' AND time LIKE '09:00%' ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView5" runat="server" DataSourceID="F1">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="F1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Friday' AND time LIKE '09:00%' ">
            </asp:SqlDataSource>
        </td>
	</tr>
	<tr>
    	<td width="70" style="border: thin solid #800080">10am</td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView6" runat="server" DataSourceID="M2">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="M2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Monday' AND time LIKE '10:00%'  ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView7" runat="server" DataSourceID="T2">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="T2" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Tuesday' AND time LIKE '10:00%'"></asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080" >
            <asp:ListView ID="ListView8" runat="server" DataSourceID="W2">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="W2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Wednesday' AND time LIKE '10:00%' ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView9" runat="server" DataSourceID="TH2">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="TH2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Thursday' AND time LIKE '10:00%' ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView10" runat="server" DataSourceID="F2">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="F2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Friday' AND time LIKE '10:00%' ">
            </asp:SqlDataSource>
        </td>
	</tr>
	<tr>
    	<td width="70" style="border: thin solid #800080">11am</td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView11" runat="server" DataSourceID="M3">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div ID="itemPlaceholderContainer" runat="server" 
                        style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="M3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Monday' AND time LIKE '10:00%'  ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView12" runat="server" DataSourceID="T3">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="T3" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Tuesday' AND time LIKE '10:00%'"></asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080" >
            <asp:ListView ID="ListView13" runat="server" DataSourceID="W3">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="W3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Wednesday' AND time LIKE '10:00%' ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView14" runat="server" DataSourceID="TH3">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="TH3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Thursday' AND time LIKE '10:00%' ">
            </asp:SqlDataSource>
        </td>
		<td height="120" width="130" style="border: thin solid #800080">
            <asp:ListView ID="ListView15" runat="server" DataSourceID="F3">
                <AlternatingItemTemplate>
                    <span style="background-color: #FAFAD2;color: #284775;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #FFCC66;color: #000080;">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">mod_code:
                    <asp:TextBox ID="mod_codeTextBox" runat="server" 
                        Text='<%# Bind("mod_code") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFBD6;color: #333333;">mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="font-family: Verdana, Arial, Helvetica, sans-serif;" 
                        ID="itemPlaceholderContainer" runat="server">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                    mod_code:
                    <asp:Label ID="mod_codeLabel" runat="server" Text='<%# Eval("mod_code") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="F3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
                
                SelectCommand="SELECT mod_code FROM dbo.Request WHERE allocated='1' AND day = 'Friday' AND time LIKE '10:00%' ">
            </asp:SqlDataSource>
        </td>
	</tr>
	<tr>
		    	<td width="70" style="border: thin solid #800080">12pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
	<tr>
    	<td width="70" style="border: thin solid #800080">13pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
	<tr>
    	<td width="70" style="border: thin solid #800080">14pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
	<tr>
    	<td width="70" style="border: thin solid #800080">15pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
	<tr>
    	<td width="70" style="border: thin solid #800080">16pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
	<tr>
		    	<td width="70" style="border: thin solid #800080">17pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
	<tr>
		    	<td width="70" style="border: thin solid #800080">18pm</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080" >Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
		<td height="120" width="130" style="border: thin solid #800080">Table Cell</td>
	</tr>
    </tbody>
	</table>

</asp:Content>
