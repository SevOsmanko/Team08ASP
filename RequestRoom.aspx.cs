using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Text;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;


namespace Team_Projects
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void submitButton_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                Label1.Text = "";
                var round = 2;
                
                var mod_code = moduleCode.SelectedItem.ToString();
                var mod_title = moduleTitle.SelectedItem.ToString();
                
                var day_input = dayInput.SelectedItem.ToString();

                var starttime = startTime.SelectedItem.ToString();
                var endtime = endTime.SelectedItem.ToString();

                var noofrooms = noOfRooms.SelectedItem.ToString();
                var noofstuds = noofStuds.Text.ToString();
                var roomtype = roomType.SelectedItem.ToString();
                var location = locationType.SelectedItem.ToString();

                var park = "";
                if (parkDropDown.Enabled == false)
                {
                    park = "NO PARK ACTIVE";
                }
                else
                {
                    park = parkDropDown.SelectedItem.ToString();
                }

                var building = "";
                if (buildingDropDown.Enabled == false)
                {
                    building = "NO BUILDING ACTIVE";
                }
                else
                {
                    building = buildingDropDown.SelectedItem.ToString();
                }

                var room = "";
                if (roomDropDown.Enabled == false)
                {
                    room = "NO ROOM ACTIVE";
                }
                else
                {
                    room = roomDropDown.SelectedItem.ToString();
                }

                var time = starttime + " - " + endtime;

                var facs_selected = "";
                for (var i = 0; i < 8; i++)
                {
                    if (fac_checkboxes.Items[i].Selected == true)
                    {
                        facs_selected += fac_checkboxes.Items[i].Value + ",";
                        
                    }
                }

                int stime = Convert.ToInt32(startTime.SelectedItem.ToString().Replace(":", "").Replace(".", ""));
                int etime = Convert.ToInt32(endTime.SelectedItem.ToString().Replace(":", "").Replace(".", ""));
                int count = stime - etime;
                if (count > 0)
                {
                    Label1.Text = "YOUR REQUEST CAN'T BE SUBMITTED! INVALID FINISHING TIME!";
                }
                else if (count < 0)
                {
                }

                var weeks_selected = "";
                for (var i = 0; i < 15; i++)
                {
                    if (weekCheckBox.Items[i].Selected == true)
                    {
                        weeks_selected += weekCheckBox.Items[i].Text+",";
                    }
                }
                
                var specialrequirements = specreq.Text;

                var priority_checked = "";
                if (priority_checkbox.Checked == true)
                {
                    priority_checked += "1";
                }
                else if (priority_checkbox.Checked == false)
                {
                    priority_checked += "0";
                }

                string connectionstring = WebConfigurationManager.ConnectionStrings["team08ConnectionString"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(connectionstring);

                SqlCommand submitrequest = new SqlCommand();
                submitrequest = myConnection.CreateCommand();
                submitrequest.CommandText = @"INSERT INTO dbo.Request (mod_code, weeks, day, time, priority, no_rooms, no_students, facility_ids, Round, result) " + "Values (@mod_code, @weeks_selected, @day_input, @time, @priority_checked, @noofrooms, @noofstuds, @facs_selected, @round, 'Pending')";
                               
                submitrequest.Parameters.Add("@mod_code", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@mod_code"].Value = mod_code;
                submitrequest.Parameters.Add("@weeks_selected", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@weeks_selected"].Value = weeks_selected;
                submitrequest.Parameters.Add("@day_input", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@day_input"].Value = day_input;
                submitrequest.Parameters.Add("@time", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@time"].Value = time;
                submitrequest.Parameters.Add("@priority_checked", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@priority_checked"].Value = priority_checked;
                submitrequest.Parameters.Add("@noofrooms", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@noofrooms"].Value = noofrooms;
                submitrequest.Parameters.Add("@noofstuds", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@noofstuds"].Value = noofstuds;
                submitrequest.Parameters.Add("@facs_selected", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@facs_selected"].Value = facs_selected;
                submitrequest.Parameters.Add("@round", System.Data.SqlDbType.NVarChar);
                submitrequest.Parameters["@round"].Value = round;
                                
                myConnection.Open();
                submitrequest.ExecuteNonQuery();
                myConnection.Close();
                Label1.Text = "YOUR REQUEST HAS BEEN SUBMITTED!";
            }
        }


        protected void day_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void starttime_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "";
          int st = startTime.SelectedIndex;
          endTime.SelectedIndex = startTime.SelectedIndex;
           
            int starttime = startTime.SelectedIndex;
            int endtime = endTime.SelectedIndex;
            int count = starttime - endtime;

            if (count > 0)
            {
                Label1.Text = "YOU'RE START TIME IS GREATER THAN YOUR END TIME!";
            }
            else if (count < 0)
            { 
            }
        }

        protected void endtime_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "";

            int starttime = startTime.SelectedIndex;
            int endtime = endTime.SelectedIndex;
            int count = starttime - endtime;

            if (count > 0)
            {
                Label1.Text = "YOU'RE START TIME IS GREATER THAN YOUR END TIME!";
            }
            else if (count < 0)
            {
            }
        }

        protected void noofrooms_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void roomtype_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void locationType_SelectedIndexChanged(object sender, EventArgs e)
        {
            var location = locationType.SelectedItem.ToString();

            if (location == "No Preference")
            {
                parkDropDown.Enabled = false;
                buildingDropDown.Enabled = false;
                roomDropDown.Enabled = false;
                
            }
            else if (location == "Park")
            {
                parkDropDown.Enabled = true;
                buildingDropDown.Enabled = false;
                roomDropDown.Enabled = false;
            }
            else if (location == "Building")
            {
                parkDropDown.Enabled = true;
                buildingDropDown.Enabled = true;
                roomDropDown.Enabled = false;
            }
            else if (location == "Room")
            {
                parkDropDown.Enabled = true;
                roomDropDown.Enabled = true;
                buildingDropDown.Enabled = true;
            }
        }

        protected void parkDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void buildingDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void roomDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void week_term_Click(object sender, EventArgs e)
        {
            for (var i = 0; i < 12; i++)
            {
                weekCheckBox.Items[i].Selected = true;
            }

            for (var i = 12; i < 15; i++)
            {
                weekCheckBox.Items[i].Selected = false;
            }
        }

        protected void week_odd_Click(object sender, EventArgs e)
        {
            var count = 0;
            for (var i = 0; i < 15; i++)
            {
                if (count % 2 == 1)
                {
                    weekCheckBox.Items[i].Selected = false;
                    count += 1;
                }
                else
                {
                    weekCheckBox.Items[i].Selected = true;
                    count += 1;
                }
            }
        }

        protected void week_even_Click(object sender, EventArgs e)
        {
            var count = 0;
            for (var i = 0; i < 15; i++)
            {
                if (count % 2 != 0)
                {
                    weekCheckBox.Items[i].Selected = true;
                    count += 1;
                }
                else
                {
                    weekCheckBox.Items[i].Selected = false;
                    count += 1;
                }  
            }
        }

        protected void week_none_Click(object sender, EventArgs e)
        {
            for (var i = 0; i < 15; i++)
            {
                weekCheckBox.Items[i].Selected = false;
            }
        }

        protected void week_all_Click(object sender, EventArgs e)
        {
            for (var i = 0; i < 15; i++)
            {
                weekCheckBox.Items[i].Selected = true;
            }    
        }

        protected void moduleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            moduleCode.SelectedValue = moduleTitle.SelectedValue;
        }

        protected void moduleTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            moduleTitle.SelectedValue = moduleCode.SelectedValue;
        }
        
        protected void weekCheckBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {

        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            moduleCode.SelectedIndex = 0;
            moduleTitle.SelectedIndex = 0;
            dayInput.SelectedIndex = 0;

            startTime.SelectedIndex = 0;
            endTime.SelectedIndex = 0;

            noofStuds.Text = "";
            noOfRooms.SelectedIndex = 0;
            roomType.SelectedIndex = 0;
            locationType.SelectedIndex = 0;

            for (var i = 0; i < 12; i++)
            {
                weekCheckBox.Items[i].Selected = true;
            }

            for (var i = 12; i < 15; i++)
            {
                weekCheckBox.Items[i].Selected = false;
            }
        }

        protected void fac_checkboxes_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void new_mod_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "";
            var newmod = new_mod.SelectedItem.ToString();
            
            if (newmod == "Yes")
            {
                nmc.Enabled = true;
                nmt.Enabled = true;
                addmodbtn.Enabled = true; 

                moduleCode.Enabled = false;
                moduleTitle.Enabled = false;
            }
            else if (newmod == "No")
            {
                nmc.Enabled = false;
                nmt.Enabled = false;
                addmodbtn.Enabled = false; 
                moduleCode.Enabled = true;
                moduleTitle.Enabled = true;
            }
            Label1.Text = "";
        }

        protected void nmc_TextChanged(object sender, EventArgs e)
        {

        }

        protected void addmodbtn_Click(object sender, EventArgs e)
        {
            if (nmc.Enabled == true)
            {
                var newmodcode = nmc.Text;
                var newmodtitle = nmt.Text;
                

                string connectionstring = WebConfigurationManager.ConnectionStrings["team08ConnectionString"].ConnectionString;
                SqlConnection myConnection = new SqlConnection(connectionstring);

                SqlCommand submitenewmodule = new SqlCommand();
                submitenewmodule = myConnection.CreateCommand();
                submitenewmodule.CommandText = @"INSERT INTO dbo.Module (mod_code, dept_code, mod_name, lecturer_name) " + "Values (@mod_code, 'CO', @mod_title, 'None')";

                submitenewmodule.Parameters.Add("@mod_code", System.Data.SqlDbType.NVarChar);
                submitenewmodule.Parameters["@mod_code"].Value = newmodcode;
                submitenewmodule.Parameters.Add("@mod_title", System.Data.SqlDbType.NVarChar);
                submitenewmodule.Parameters["@mod_title"].Value = newmodtitle;

                myConnection.Open();
                submitenewmodule.ExecuteNonQuery();
                myConnection.Close();
                Label1.Text = "NEW MODULE ADDED!!";
            }
        }
    }
}
