using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string building_id = Request.Form["TextBox3"];

        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"select * from dbo.Building where Id = "+building_id;
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        myConn.Close();

        //SqlDataReader myDataReader = myCommand.ExecuteReader();

        //Read the result
        /*
        while (myDataReader.Read())
        {
            if (myDataReader["id"].ToString() != "")
            {
                Response.Write("<b>Building id: </b>" + myDataReader["Id"].ToString() + "<br/> <b>Building name: </b>");
                Response.Write(myDataReader["name"].ToString()+"</br>");
            }
        }
        */
    }
}