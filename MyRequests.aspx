<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="MyRequests.aspx.cs" Inherits="Team_Projects._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    My Requests
</asp:Content>

<asp:Content ID="Heading" runat="server" ContentPlaceHolderID="Heading">
<img alt="bander" src="Pictures/ttlbg-sitecopy.jpg" height="60px" 
        style="width: 100%" />
        <h3 class="ttlbg_heading">My Requests: Round P</h3>
<div onclick="window.location.href='MyRequests.aspx'" class="swapP"><span class="swapview_title">Round P</span></div>
<div onclick="window.location.href='Round1.aspx'" class="swap1"><span class="swapview_title">Round 1</span></div>
<div onclick="window.location.href='Round2.aspx'" class="swap2"><span class="swapview_title">Round 2</span></div>
<div onclick="window.location.href='Round3.aspx'" class="swap3"><span class="swapview_title">Round 3</span></div>
</asp:Content>
  
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="Content"><br /><br /><br />
    <div style="position:relative;">
    <div class="my_request_left_panel">
        <div class="Failed" onclick='showFailed();'><span class="Request_title">Failed</span></div>
        <div class="failed">
        <asp:SqlDataSource ID="Failed_req" runat="server"
            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
            
                SelectCommand="SELECT dbo.Request.request_id, dbo.Request.moduleCode AS 'Module Code', dbo.Module.moduleName AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Preference.rbp_ID AS Preference FROM dbo.Preference CROSS JOIN dbo.Module CROSS JOIN dbo.Request WHERE dbo.Request.status = 'Failed' AND dbo.Request.moduleCode = dbo.Module.moduleCode AND dbo.Preference.preference_ID = dbo.Request.preference_ID" 
                DeleteCommand="DELETE FROM dbo.Request WHERE (request_id = @request_id)">
           </asp:SqlDataSource>
           
    <asp:GridView ID="Failed_GridView" runat="server" 
            AllowSorting="True"  DataSourceID="Failed_req" CellPadding="3" DataKeyNames="request_id"
            GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" 
            BorderWidth="1px" style="margin-left: 15px" Width="700px" 
                AutoGenerateColumns="False" EnableSortingAndPagingCallbacks="False"> 
            <AlternatingRowStyle BackColor="#FFE3ED" />
            <Columns>
            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="Pictures/delete2.png"></asp:CommandField>
                <asp:BoundField DataField="Module Code" HeaderText="Module Code" 
                    SortExpression="Module Code" />
                <asp:BoundField DataField="Module Title" HeaderText="Module Title" 
                    SortExpression="Module Title" />
                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Preference" HeaderText="Preference" 
                    SortExpression="Preference" />
            </Columns>
            <FooterStyle BackColor="#FFE3ED" ForeColor="Black" />
            <HeaderStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#FFE3ED" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFE3ED" ForeColor="Black"  HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFE3ED" />
            <SortedAscendingHeaderStyle BackColor="#FFE3ED" />
            <SortedDescendingCellStyle BackColor="#FFE3ED" />
            <SortedDescendingHeaderStyle BackColor="#FFE3ED" />
        </asp:GridView>
             
    </div>
        <br />

    <div class="Pending" onclick='showPending();'><span class="Request_title">Pending</span></div>
    <div class="pending" style=" display:none;" >
        <asp:SqlDataSource ID="Pending_req" runat="server" 
            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
            SelectCommand="SELECT DISTINCT dbo.Request.request_id, dbo.Request.moduleCode AS 'Module Code', dbo.Module.moduleName AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Preference.rbp_ID AS 'Preference' FROM dbo.Preference CROSS JOIN dbo.Module CROSS JOIN dbo.Request WHERE dbo.Request.status = 'Pending' AND dbo.Request.moduleCode = dbo.Module.moduleCode AND dbo.Preference.preference_ID = dbo.Request.preference_ID "
            DeleteCommand="DELETE FROM dbo.Request WHERE (request_id = @request_id)">
            </asp:SqlDataSource>

        <asp:GridView ID="Pending_GridView" runat="server" 
            AllowSorting="True" DataSourceID="Pending_req" CellPadding="3" DataKeyNames="request_id"
            GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" 
            BorderWidth="1px" style="margin-left: 15px; display:block" Width="700px" 
           AutoGenerateColumns="False" EnableSortingAndPagingCallbacks="True">
            <AlternatingRowStyle BackColor="#EEEEEE" />
            <Columns>
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="Pictures/delete2.png"></asp:CommandField>
                <asp:BoundField DataField="request_id" HeaderText="request_id" 
                    SortExpression="request_id" InsertVisible="true" Visible="false" ReadOnly="True" />
                <asp:BoundField DataField="Module Code" HeaderText="Module Code" 
                    SortExpression="Module Code" />
                <asp:BoundField DataField="Module Title" HeaderText="Module Title" 
                    SortExpression="Module Title" />
                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Preference" HeaderText="Preference" 
                    SortExpression="Preference" />
            </Columns>
            <FooterStyle BackColor="#EEEEEE" ForeColor="Black" />
            <HeaderStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#EEEEEE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#EEEEEE" />
            <SortedAscendingHeaderStyle BackColor="#EEEEEE" />
            <SortedDescendingCellStyle BackColor="#EEEEEE" />
            <SortedDescendingHeaderStyle BackColor="#EEEEEE" />
        </asp:GridView>
    </div>
    <br />

    <div class="Allocated" onclick='showAllocated();'> <span class="Request_title">Allocated</span></div>
    <div class="allocated" style=" display:none;">
        <asp:SqlDataSource ID="Allocated_req" runat="server" 
            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
            SelectCommand="SELECT DISTINCT dbo.Request.request_id, dbo.Request.moduleCode AS 'Module Code', dbo.Module.moduleName AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Request.status AS 'Allocated' FROM dbo.Request CROSS JOIN dbo.Module WHERE dbo.Request.allocated = '1' AND dbo.Request.moduleCode = dbo.Module.moduleCode"
            DeleteCommand="DELETE FROM dbo.Request WHERE (request_id = @request_id)">
            </asp:SqlDataSource>
    
        <asp:GridView ID="Allocated_GridView" runat="server"
     
            AllowSorting="True" DataSourceID="Allocated_req" CellPadding="3" DataKeyNames="request_id"
            GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" 
            BorderWidth="1px" style="margin-left: 15px" Width="700px" 
            EnableSortingAndPagingCallbacks="True" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="#E0FFE0" />
            <Columns>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="Pictures/delete2.png"></asp:CommandField>
                <asp:BoundField DataField="request_id" HeaderText="request_id" 
                    InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="request_id" />
                <asp:BoundField DataField="Module Code" HeaderText="Module Code" 
                    SortExpression="Module Code" />
                <asp:BoundField DataField="Module Title" HeaderText="Module Title" 
                    SortExpression="Module Title" />
                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Allocated" HeaderText="Allocated" 
                    SortExpression="Allocated" />
            </Columns>
            <FooterStyle BackColor="#E0FFE0" ForeColor="Black" />
            <HeaderStyle BackColor="#E0FFE0" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#E0FFE0" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#E0FFE0" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E0FFE0" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#E0FFE0" />
            <SortedAscendingHeaderStyle BackColor="#E0FFE0" />
            <SortedDescendingCellStyle BackColor="#E0FFE0" />
            <SortedDescendingHeaderStyle BackColor="#E0FFE0" />
        </asp:GridView>
    </div>
    <br />
    <div class="Cancelled" onclick='showCancelled();'><span class="Request_title">Cancelled</span></div>
    <div class="cancelled" style=" display:none;" >
        <asp:SqlDataSource ID="Cancelled_req" runat="server" 
            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
            SelectCommand="SELECT DISTINCT dbo.Request.request_id, dbo.Request.moduleCode AS 'Module Code', dbo.Module.moduleName AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Preference.rbp_ID AS 'Preference' FROM dbo.Request CROSS JOIN dbo.Module CROSS JOIN dbo.Preference WHERE dbo.Preference.preference_ID = dbo.Request.preference_ID AND dbo.Request.status = 'Cancelled' AND dbo.Request.moduleCode = dbo.Module.moduleCode"
            DeleteCommand="DELETE FROM dbo.Request WHERE (request_id = @request_id)">
            </asp:SqlDataSource>
        <asp:GridView ID="Cancelled_GridView" runat="server" 

           AllowSorting="True" DataSourceID="Cancelled_req" CellPadding="3" DataKeyNames="request_id"
            GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" 
            BorderWidth="1px" style="margin-left: 15px" Width="700px" 
            EnableSortingAndPagingCallbacks="True" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="#FFFFFF" />
            <Columns>
            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="Pictures/delete2.png"></asp:CommandField>
                <asp:BoundField DataField="request_id" HeaderText="request_id" 
                    InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="request_id" />
                <asp:BoundField DataField="Module Code" HeaderText="Module Code" 
                    SortExpression="Module Code" />
                <asp:BoundField DataField="Module Title" HeaderText="Module Title" 
                    SortExpression="Module Title" />
                <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Preference" HeaderText="Preference" 
                    SortExpression="Preference" />
            </Columns>
            <FooterStyle BackColor="#FFFFFF" ForeColor="Black" />
            <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#FFFFFF" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFFFF" ForeColor="Black" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFFFFF" />
            <SortedAscendingHeaderStyle BackColor="#FFFFFF" />
            <SortedDescendingCellStyle BackColor="#FFFFFF" />
            <SortedDescendingHeaderStyle BackColor="#FFFFFF" />
        </asp:GridView>
    </div>
    
</div>
<div class="my_request_right_panel">
        <div class="Make_Request"><a class="Make_Request_txt" href="RequestRoom.aspx">Make A Request</a></div>
        <br />

    </div>
    <div class="my_request_right_panel">
    <div class="LastYear"><a class="LastYear_txt" href="LastYearRequest.aspx">Last Year Requests</a></div>
    </div>
 <br /><br /> <br /><br /><br /><br /><br />
    <div class="CountList"> 
       
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <span style="">
                <span onclick='showFailed();' style="background-color:#FFE3ED; padding:10px; border: solid 1px black; float:right; margin-right: 50px; position: relative; width: 100px; cursor:pointer">Failed:
                <asp:Label ID="FailedLabel" runat="server" Text='<%# Eval("Failed") %>' /></span>
                <br /><br /><br />
                <span onclick='showPending();' style="background-color:#EEEEEE; padding:10px; border: solid 1px black; float:right; margin-right: 50px; position: relative;  width: 100px; cursor:pointer">Pending:
                <asp:Label ID="PendingLabel" runat="server" Text='<%# Eval("Pending") %>' /></span>
                <br /><br /><br />
               <span onclick='showAllocated();' style="background-color:#E0FFE0; border: solid 1px black; padding:10px; float:right; margin-right: 50px; position:relative;  width: 100px; cursor:pointer"> Allocated:
                <asp:Label ID="AllocatedLabel" runat="server" Text='<%# Eval("Allocated") %>' /></span>
                <br /><br /><br />
                <span onclick='showCancelled();' style="background-color:#FFFFFF; border: solid 1px black; padding:10px; float:right; margin-right: 50px; position:relative;  width: 100px; cursor:pointer">Cancelled:
                <asp:Label ID="CancelledLabel" runat="server" Text='<%# Eval("Cancelled") %>' /></span>
                <br />
                <br />
                </span>
            </ItemTemplate>
        </asp:ListView>
        </div>
        </div>
        

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
        SelectCommand="SELECT (SELECT COUNT(*) FROM dbo.Request WHERE (dbo.Request.status = 'Failed')) AS Failed, ( SELECT COUNT(*) FROM dbo.Request WHERE status='Pending') AS Pending,(SELECT COUNT(*)  FROM dbo.Request WHERE allocated='1') AS 'Allocated', (SELECT COUNT(*)  FROM dbo.Request WHERE status = 'Cancelled') AS 'Cancelled'">
    </asp:SqlDataSource>
     
      <div style=" clear: both;"></div>
<br />
</asp:Content>
