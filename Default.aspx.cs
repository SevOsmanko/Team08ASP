using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient; //For connection database
using System.Web.UI.WebControls; //For ListItem

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Connect to database
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();

        //Setup SQL
        String strSQL = @"select * from dbo.department";
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();

        //Show department information into the dropdownlist
        while (myDataReader.Read())
        {
            if (myDataReader["departmentID"] != "")
            {
                department.Items.Add(new ListItem(myDataReader["departmentCode"].ToString() + " - " + myDataReader["name"].ToString(), myDataReader["departmentCode"].ToString()));
            }
        }
        myConn.Close();
    }
}
