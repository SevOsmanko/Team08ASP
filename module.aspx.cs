using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //For connection database
using System.Web.Services;

public partial class module : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"select * from dbo.Module order by moduleCode";
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();
        while (myDataReader.Read())
        {
            if (myDataReader["Id"] != "")
            {
                moduleList.Items.Add(new ListItem(myDataReader["moduleCode"].ToString() + " - " + myDataReader["title"].ToString(), myDataReader["Id"].ToString()));
            }
        }
        myDataReader.Close();
    }
}