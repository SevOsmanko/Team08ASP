<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Round2.aspx.cs" Inherits="Team_Projects._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
Round 2 Results
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <img alt="bander" src="Pictures/ttlbg-sitecopy.jpg" height="60px" 
        style="width: 100%" />
        <h3 class="ttlbg_heading">My Requests: Round 2</h3>
<div onclick="window.location.href='MyRequests.aspx'" class="swapP"><span class="swapview_title">Round P</span></div>
<div onclick="window.location.href='Round1.aspx'" class="swap1"><span class="swapview_title">Round 1</span></div>
<div onclick="window.location.href='Round2.aspx'" class="swap2"><span class="swapview_title">Round 2</span></div>
<div onclick="window.location.href='Round3.aspx'" class="swap3"><span class="swapview_title">Round 3</span></div>
</asp:Content>
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="Content"><br /><br /><br />
    <div style="position:relative;">
    <div class="my_request_left_panel">
        <div class="Failed" onclick='showFailed();'><span class="Request_title">Failed</span></div>
        <div class="failed" style="border: 1; background-color:#CCCCCC; Width: 700px; margin-left: 15px;">
        <br />
        <a style="margin-left: 15px;">Results for this round will appear here.</a>
        <br />
        <br />
    </div>
        <br />

    <div class="Pending" onclick='showPending();'><span class="Request_title">Pending</span></div>
    <div class="pending" style="display:none; border: 1; background-color:#CCCCCC; Width: 700px; margin-left: 15px;">
        <br />
        <a style="margin-left: 15px;">Results for this round will appear here.</a>
        <br />
        <br />
    </div>
    <br />

    <div class="Allocated" onclick='showAllocated();'> <span class="Request_title">Allocated</span></div>
    <div class="allocated" style="display:none; border: 1; background-color:#CCCCCC; Width: 700px; margin-left: 15px;">
        <br />
        <a style="margin-left: 15px;">Results for this round will appear here.</a>
        <br />
        <br />
    </div>
    <br />
    <div class="Cancelled" onclick='showCancelled();'><span class="Request_title">Cancelled</span></div>
    <div class="cancelled" style="display:none; border: 1; background-color:#CCCCCC; Width: 700px; margin-left: 15px;">
        <br />
        <a style="margin-left: 15px;">Results for this round will appear here.</a>
        <br />
        <br />
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
                <asp:Label ID="FailedLabel" runat="server" Text='0' /></span>
                <br /><br /><br />
                <span onclick='showPending();' style="background-color:#EEEEEE; padding:10px; border: solid 1px black; float:right; margin-right: 50px; position: relative;  width: 100px; cursor:pointer">Pending:
                <asp:Label ID="PendingLabel" runat="server" Text='0' /></span>
                <br /><br /><br />
               <span onclick='showAllocated();' style="background-color:#E0FFE0; border: solid 1px black; padding:10px; float:right; margin-right: 50px; position:relative;  width: 100px; cursor:pointer"> Allocated:
                <asp:Label ID="AllocatedLabel" runat="server" Text='0' /></span>
                <br /><br /><br />
                <span onclick='showCancelled();' style="background-color:#FFFFFF; border: solid 1px black; padding:10px; float:right; margin-right: 50px; position:relative;  width: 100px; cursor:pointer">Cancelled:
                <asp:Label ID="CancelledLabel" runat="server" Text='0' /></span>
                <br />
                <br />
                </span>
            </ItemTemplate>
        </asp:ListView>
        </div>
        </div>
        

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:team10ConnectionString %>" 
        SelectCommand="SELECT (SELECT COUNT(*) FROM dbo.Request WHERE (dbo.Request.result = 'Failed')) AS Failed, ( SELECT COUNT(*) FROM dbo.Request WHERE result='Pending') AS Pending,(SELECT COUNT(*)  FROM dbo.Request WHERE allocated='1') AS 'Allocated', (SELECT COUNT(*)  FROM dbo.Request WHERE result = 'Cancelled') AS 'Cancelled'">
    </asp:SqlDataSource>
     
      <div style=" clear: both;"></div>
<br />
</asp:Content>
