<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="RoundResults.aspx.cs" Inherits="Team_Projects._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    Round Results
</asp:Content>

<asp:Content ID="Heading" runat="server" ContentPlaceHolderID="Heading">
    <img src="Pictures/ttlbg-sitecopy.jpg" height="60px" width="100%" />
        <h3 class="ttlbg_heading">Round Results</h3>
</asp:Content>
  
  <asp:Content ID="Content" runat="server" ContentPlaceHolderID="Content"><br /><br /><br />
<div style="position:relative;">
    <div class="filter_div">
    <div class="methods_status" onclick="showStatus();">
    <img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Status
  </div>
  
  <div class="sub_methods_status" style="background-color: transparent;">
        <div class="sub_methods_alloc">
            <input type="checkbox" id="alloc_filter" />
            <span id="​alloc_filtercheck" style="background-color:rgb(255,255,255);"></span>
            <label for="alloc_filter" style="text-decoration: none;" onmouseover="change_to_purple();"class="filter">Allocated</label>
        </div>

        <div class="sub_methods_ammend" >
            <input type="checkbox" id="amend_filter" />
            <span id="amend_filtercheck" style="background-color:rgb(255,255,255); "></span>
            <label for="amend_filter" style="text-decoration: none;"class="filter">Amended</label>
        </div>

        <div class="sub_methods_fail">
            <input type="checkbox" id="fail_filter" />
            <span id="fail_filtercheck" style="background-color:rgb(255,255,255); "></span>
            <label for="fail_filter" style="text-decoration: none;"class="filter">Failed</label>
        </div>

    </div>

    <div class="methods_dep" onclick="showDepartment();">
    <img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Department
    </div>

    <div class="sub_methods_dep" style="background-color: transparent; ">
    <select style="width: 128px">
    <option>Select department</option>
    <option value="TT">Aeronautical and Automotive Engineering</option>
    <option value="BS">Business</option>
    <option value="CG">Chemical Engineering</option>
    <option value="CM">Chemistry</option>
    <option value="CV">Civil & Building Engineering</option>
    <option value="CO">Computer Science</option>
    <option value="DS">Design</option>
    <option value="EC">Economics</option>
    <option value="EL">Electronic & Electrical Engineering</option>
    <option value="EA">English & Drama</option>
    <option value="GY">Geography</option>
    <option value="IS">Information Science</option>
    <option value="MP">Materials</option>
    <option value="MA">Mathematics</option>
    <option value="MM">Mechanical & Manufacturing Engineering</option>
    <option value="PH">Physics</option>
    <option value="EU">Politics, History and International Relations</option>
    <option value="SS">Social Sciences</option>
    <option value="PS">Sport, Exercise and Health Sciences</option>
    <option value="SA">The Arts</option>
    </select>
    
    <input type="button" class="filterbtn_dep" onmouseover="adddephoverbtn();" onmouseout="removedephoverbtn();" style="background-image:url(Pictures/btn.png);"/>
    <div class="depfilts"></div>
    </div>
    
    <div class="methods_module" onclick="showModule();">
    <img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Module
    </div>

    <div class="sub_methods_module" style="background-color: transparent;">
    <input type="text" class="autoc" id="mod_filter" size="15;"/>
    <input type="button" class="filterbtn_mod" onmouseover="addhoverbtn();" onmouseout="removehoverbtn();" style="background-image:url(Pictures/btn.png);"/>
    <div class="modfilts"></div>
    </div>

    <div class="methods_day" onclick="showDay();">
    <img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Day
    </div>

    <div class="sub_methods_day">
        <div class="sub_methods_day_mon">
        <input type="checkbox" id="day1" />
        <span id="day1check" style="background-color: rgb(255,255,255);"></span>
        <label for="day1" style="text-decoration: none;"class="filter">Monday</label>
        </div>

        <div class="sub_methods_day_tue">
        <input type="checkbox" id="day2" />
        <span id="day2check" style="background-color: rgb(255,255,255);"></span>
        <label for="day2" style="text-decoration: none;"class="filter">Tuesday</label>
        </div>

        <div class="sub_methods_day_wed">
        <input type="checkbox" id="day3" />
        <span id="day3check" style="background-color: rgb(255,255,255);"></span>
        <label for="day3" style="text-decoration: none;"class="filter">Wednesday</label>
        </div>

        <div class="sub_methods_day_thur">
        <input type="checkbox" id="day4" />
        <span id="day4check" style="background-color: rgb(255,255,255);"></span>
        <label for="day4" style="text-decoration: none;"class="filter">Thursday</label>
        </div>

         <div class="sub_methods_day_fri">
        <input type="checkbox" id="day5" />
        <span id="day5check" style="background-color: rgb(255,255,255);"></span>
        <label for="day5" style="text-decoration: none;"class="filter">Friday</label>
        </div>
    </div>
    


    <div class="methods_period" onclick="showStartPeriod();">
    <img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Start Period
    </div>
    <div class="sub_methods_period">
        <div class="sub_methods_9">
        <input type="checkbox" id="p1" />
        <span id="p1check"></span>
        <label for="p1"class="filter">09:00</label>
        </div>

        <div class="sub_methods_10">
        <input type="checkbox" id="p2" />
        <span id="p2check"></span>
        <label for="p2"class="filter">10:00</label>
        </div>

        <div class="sub_methods_11">
        <input type="checkbox" id="p3" />
        <span id="p3check"></span>
        <label for="p3"class="filter">11:00</label>
        </div>

        <div class="sub_methods_12">
        <input type="checkbox" id="p4" />
        <span id="p4check"></span>
        <label for="p4"class="filter">12:00</label>
        </div>

        <div class="sub_methods_13">
        <input type="checkbox" id="p5" />
        <span id="p5check"></span>
        <label for="p5"class="filter">13:00</label>
        </div>

        <div class="sub_methods_14">
        <input type="checkbox" id="p6" />
        <span id="p6check"></span>
        <label for="p6"class="filter">14:00</label>
        </div>

        <div class="sub_methods_15">
        <input type="checkbox" id="p7" />
        <span id="p7check"></span>
        <label for="p7"class="filter">15:00</label>
        </div>

        <div class="sub_methods_16">
        <input type="checkbox" id="p8" />
        <span id="p8check"></span>
        <label for="p8" class="filter">16:00</label>
        </div>

        <div class="sub_methods_17">
            <input type="checkbox" id="p9" />
            <span id="p9check"></span>
            <label for="p9" class="filter">17:00</label>
        </div>
    </div>


    <div class="methods_room" onclick="showRoom();">
    <img src="Pictures/downarrow.png" alt="" style="width:12px; height:10px;"/>Room
    </div>

    <div class="sub_methods_room" style="position:relative">
    <input type="text" id="room_filter" class="autoc" size="15" />
    <input type="button" class="filterbtn_room" onmouseover="addroomhoverbtn();" onmouseout="removeroomhoverbtn();" style="background-image:url(Pictures/btn.png);"/>
    <div class="roomfilts"></div>
    </div>

    </div>
    <div class="right_panel">
        <div class="round_result" onclick='showRound_Result();'><span class="Request_title">Round Results
            </span>
        </div>
        <div class="r_result">
        <asp:SqlDataSource ID="Round_Results" runat="server" 
            ConnectionString="<%$ ConnectionStrings:team08ConnectionString %>" 
               SelectCommand="SELECT DISTINCT dbo.Request.mod_code AS 'Module Code', dbo.Module.mod_name AS 'Module Title', dbo.Request.day AS 'Day', dbo.Request.time AS 'Time', dbo.Preference.rbp_ID AS 'Preference' FROM dbo.Request CROSS JOIN dbo.Module CROSS JOIN dbo.Preference WHERE dbo.Preference.Prefid = dbo.Request.Prefid AND dbo.Request.mod_code = dbo.Module.mod_code AND dept_code = 'CO' ">
               
        </asp:SqlDataSource>
      
           <asp:GridView ID="RoundResultsGridView" runat="server" 
            AllowSorting="True" DataSourceID="Round_Results" CellPadding="3" 
            GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" 
            BorderWidth="1px" style="margin-left: 15px" Width="700px" AutoGenerateSelectButton=true AutoGenerateDeleteButton=true AutoGenerateEditButton=true EmptyDataText="No Results Match Your Filtering Criteria!" SelectedRowStyle-BorderColor=Black SelectedRowStyle-BackColor="Aqua">
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
            </asp:GridView>
        </div>
    </div>
    <div style="height:1px; width:100%; clear:both;"></div>
</div>
<br />
<br />
</asp:Content>

   