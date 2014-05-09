<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LastYearRequest.aspx.cs" Inherits="Team_Projects._Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Heading" runat="server">
    <img src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
        <h3 class="ttlbg_heading">My Requests: Last Year Requests</h3>

 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <br /><br /><br /><br />
  <div style=" position:relative;">
        <div class="last_year" ><span class="Request_title">Last Years Requests</span></div>
        <div class="last_">
           <asp:GridView ID="LastYearRequestGridView" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id" AllowSorting="True"  
                DataSourceID="LastYearRequest" CellPadding="3" BackColor="White" BorderColor="#999999" 
                 BorderStyle="None" BorderWidth="1px" style="margin-left: 15px" 
                Width="900px">
            <AlternatingRowStyle BackColor="#FFE3ED" />
            
                <Columns>
                    <asp:CommandField ShowEditButton="True" ButtonType="Button"/>
                    <asp:BoundField DataField="mod_code" HeaderText="Module Code"  SortExpression="mod_code" />
                    <asp:BoundField DataField="weeks" HeaderText="Weeks"  SortExpression="weeks" />
                    <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                    <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                    <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                    <asp:BoundField DataField="no_rooms" HeaderText="No Rooms" SortExpression="no_rooms" />
                    <asp:BoundField DataField="no_students" HeaderText="No Students" SortExpression="no_students" />
                    <asp:BoundField DataField="Prefid" HeaderText="Preference" SortExpression="Prefid" />
                    <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                    <asp:BoundField DataField="spec_req" HeaderText="Special Req" SortExpression="spec_req" />
                    <asp:BoundField DataField="facility_ids" HeaderText="Facility IDs" SortExpression="facility_ids" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                    <asp:BoundField DataField="priority1" HeaderText="Priority" SortExpression="priority1" />
                    <asp:BoundField DataField="allocated" HeaderText="Result" SortExpression="allocated" />
                </Columns>
                <FooterStyle BackColor="#FFE3ED" ForeColor="Black" />
                <HeaderStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="Black" />
                <PagerStyle BackColor="#FFE3ED" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFE3ED" ForeColor="Black"  HorizontalAlign="Center"/>
                <SelectedRowStyle BackColor="#FFE3ED" Font-Bold="True" ForeColor="Red" />
                <SortedAscendingCellStyle BackColor="#FFE3ED" />
                <SortedAscendingHeaderStyle BackColor="#FFE3ED" />
                <SortedDescendingCellStyle BackColor="#FFE3ED" />
                <SortedDescendingHeaderStyle BackColor="#FFE3ED" />
            </asp:GridView>
            <asp:SqlDataSource ID="LastYearRequest" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
                DeleteCommand="DELETE FROM [Archived] WHERE [id] = @original_id AND (([mod_code] = @original_mod_code) OR ([mod_code] IS NULL AND @original_mod_code IS NULL)) AND (([weeks] = @original_weeks) OR ([weeks] IS NULL AND @original_weeks IS NULL)) AND (([day] = @original_day) OR ([day] IS NULL AND @original_day IS NULL)) AND (([time] = @original_time) OR ([time] IS NULL AND @original_time IS NULL)) AND (([priority] = @original_priority) OR ([priority] IS NULL AND @original_priority IS NULL)) AND (([no_rooms] = @original_no_rooms) OR ([no_rooms] IS NULL AND @original_no_rooms IS NULL)) AND (([no_students] = @original_no_students) OR ([no_students] IS NULL AND @original_no_students IS NULL)) AND (([Prefid] = @original_Prefid) OR ([Prefid] IS NULL AND @original_Prefid IS NULL)) AND (([type] = @original_type) OR ([type] IS NULL AND @original_type IS NULL)) AND (([spec_req] = @original_spec_req) OR ([spec_req] IS NULL AND @original_spec_req IS NULL)) AND (([facility_ids] = @original_facility_ids) OR ([facility_ids] IS NULL AND @original_facility_ids IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL)) AND (([priority1] = @original_priority1) OR ([priority1] IS NULL AND @original_priority1 IS NULL)) AND (([allocated] = @original_allocated) OR ([allocated] IS NULL AND @original_allocated IS NULL))" 
                InsertCommand="INSERT INTO dbo.Request(mod_code, weeks, day, time, priority, no_rooms, no_students, type, spec_req, facility_ids, allocated, Round, result) VALUES (@mod_code, @weeks, @day, @time, @priority, @no_rooms, @no_students, @type, @spec_req, @facility_ids, 0, 2, 'Pending')" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [Archived]" 
                
                UpdateCommand="UPDATE [Archived] SET [mod_code] = @mod_code, [weeks] = @weeks, [day] = @day, [time] = @time, [priority] = @priority, [no_rooms] = @no_rooms, [no_students] = @no_students, [Prefid] = @Prefid, [type] = @type, [spec_req] = @spec_req, [facility_ids] = @facility_ids, [year] = @year, [priority1] = @priority1, [allocated] = @allocated WHERE [id] = @original_id AND (([mod_code] = @original_mod_code) OR ([mod_code] IS NULL AND @original_mod_code IS NULL)) AND (([weeks] = @original_weeks) OR ([weeks] IS NULL AND @original_weeks IS NULL)) AND (([day] = @original_day) OR ([day] IS NULL AND @original_day IS NULL)) AND (([time] = @original_time) OR ([time] IS NULL AND @original_time IS NULL)) AND (([priority] = @original_priority) OR ([priority] IS NULL AND @original_priority IS NULL)) AND (([no_rooms] = @original_no_rooms) OR ([no_rooms] IS NULL AND @original_no_rooms IS NULL)) AND (([no_students] = @original_no_students) OR ([no_students] IS NULL AND @original_no_students IS NULL)) AND (([Prefid] = @original_Prefid) OR ([Prefid] IS NULL AND @original_Prefid IS NULL)) AND (([type] = @original_type) OR ([type] IS NULL AND @original_type IS NULL)) AND (([spec_req] = @original_spec_req) OR ([spec_req] IS NULL AND @original_spec_req IS NULL)) AND (([facility_ids] = @original_facility_ids) OR ([facility_ids] IS NULL AND @original_facility_ids IS NULL)) AND (([year] = @original_year) OR ([year] IS NULL AND @original_year IS NULL)) AND (([priority1] = @original_priority1) OR ([priority1] IS NULL AND @original_priority1 IS NULL)) AND (([allocated] = @original_allocated) OR ([allocated] IS NULL AND @original_allocated IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_mod_code" Type="String" />
                    <asp:Parameter Name="original_weeks" Type="String" />
                    <asp:Parameter Name="original_day" Type="String" />
                    <asp:Parameter Name="original_time" Type="String" />
                    <asp:Parameter Name="original_priority" Type="String" />
                    <asp:Parameter Name="original_no_rooms" Type="String" />
                    <asp:Parameter Name="original_no_students" Type="String" />
                    <asp:Parameter Name="original_Prefid" Type="String" />
                    <asp:Parameter Name="original_type" Type="String" />
                    <asp:Parameter Name="original_spec_req" Type="String" />
                    <asp:Parameter Name="original_facility_ids" Type="String" />
                    <asp:Parameter Name="original_year" Type="String" />
                    <asp:Parameter Name="original_priority1" Type="String" />
                    <asp:Parameter Name="original_allocated" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="mod_code" Type="String" />
                    <asp:Parameter Name="weeks" Type="String" />
                    <asp:Parameter Name="day" Type="String" />
                    <asp:Parameter Name="time" Type="String" />
                    <asp:Parameter Name="priority" Type="String" />
                    <asp:Parameter Name="no_rooms" Type="String" />
                    <asp:Parameter Name="no_students" Type="String" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="spec_req" Type="String" />
                    <asp:Parameter Name="facility_ids" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="mod_code" Type="String" />
                    <asp:Parameter Name="weeks" Type="String" />
                    <asp:Parameter Name="day" Type="String" />
                    <asp:Parameter Name="time" Type="String" />
                    <asp:Parameter Name="priority" Type="String" />
                    <asp:Parameter Name="no_rooms" Type="String" />
                    <asp:Parameter Name="no_students" Type="String" />
                    <asp:Parameter Name="Prefid" Type="String" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="spec_req" Type="String" />
                    <asp:Parameter Name="facility_ids" Type="String" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="priority1" Type="String" />
                    <asp:Parameter Name="allocated" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_mod_code" Type="String" />
                    <asp:Parameter Name="original_weeks" Type="String" />
                    <asp:Parameter Name="original_day" Type="String" />
                    <asp:Parameter Name="original_time" Type="String" />
                    <asp:Parameter Name="original_priority" Type="String" />
                    <asp:Parameter Name="original_no_rooms" Type="String" />
                    <asp:Parameter Name="original_no_students" Type="String" />
                    <asp:Parameter Name="original_Prefid" Type="String" />
                    <asp:Parameter Name="original_type" Type="String" />
                    <asp:Parameter Name="original_spec_req" Type="String" />
                    <asp:Parameter Name="original_facility_ids" Type="String" />
                    <asp:Parameter Name="original_year" Type="String" />
                    <asp:Parameter Name="original_priority1" Type="String" />
                    <asp:Parameter Name="original_allocated" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
    




           </div>
      </div>
      <br />
       <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>

</asp:Content>
