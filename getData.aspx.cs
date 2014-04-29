using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data.Common;
using System.Web.Script.Serialization; //For connection database

public partial class getData : System.Web.UI.Page
{
    [WebMethod(Description = "selectmoduleList")]
    public static string selectmoduleList(String id)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"select * from dbo.Module where Id = " + id;
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();
        myDataReader.Read();
        String result = myDataReader["title"].ToString();
        myConn.Close();
        return result;
    }

    [WebMethod(Description = "changeModuleName")]
    public static String changeModuleName(String id, String title)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"update dbo.Module set title = '"+title+"' where Id =" + id;
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();
        myConn.Close();

        strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        myConn = new SqlConnection(strConn);
        myConn.Open();
        strSQL = @"select * from dbo.Module where Id = " + id;
        myCommand = new SqlCommand(strSQL, myConn);
        myDataReader = myCommand.ExecuteReader();
        myDataReader.Read();
        String result = myDataReader["moduleCode"].ToString();
        myConn.Close();

        return result;
    }

    [WebMethod(Description = "addNewModule")]
    public static String addNewModule(String moduleCode, String moduleTitle, String departmentCode)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"SELECT TOP 1 Id FROM dbo.Module ORDER BY Id DESC"; //Get the last Id of module table
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();
        myDataReader.Read();
        int id = Convert.ToInt32(myDataReader["Id"])+1;
        myDataReader.Close();

        strSQL = @"INSERT INTO dbo.Module (Id,departmentCode,moduleCode,title) VALUES ('" + id + "','" + departmentCode + "','" + moduleCode + "','" + moduleTitle + "')";
        myCommand = new SqlCommand(strSQL, myConn);
        int rows = myCommand.ExecuteNonQuery();
        myConn.Close();

        return "";
    }

    [WebMethod(Description = "deleteModule")]
    public static String deleteModule(String moduleID)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"DELETE FROM dbo.Module WHERE Id='" + moduleID + "'"; 
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();
        //int rows = myCommand.ExecuteNonQuery();
        myConn.Close();
        return "";
    }

    [WebMethod(Description = "getRoomDetail_facility)")]
    public static String getRoomDetail_facility(String roomName)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"select FacilityID from dbo.RoomFacility where RoomID = (select Id from dbo.Room where name = '"+ roomName +"')";
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();

        String result = "";
        while (myDataReader.Read())
        {
            if (myDataReader["FacilityID"] != "")
            {
                string strConn2 = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
                SqlConnection myConn2 = new SqlConnection(strConn2);
                myConn2.Open();
                String strSQL2 = @"select * from dbo.Facility where Id = '" + myDataReader["FacilityID"] + "'";
                SqlCommand myCommand2 = new SqlCommand(strSQL2, myConn2);
                SqlDataReader myDataReader2 = myCommand2.ExecuteReader();
                myDataReader2.Read();

                result += myDataReader2["name"]+"~";
                myDataReader2.Close();
                myConn2.Close();
            }
        }


        myDataReader.Close();
        myConn.Close();
        return result;
    }

    [WebMethod(Description="getRoomDetail_buildingName")]
    public static String getRoomDetail_buildingName(String buildingCode)
    {
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"select * from dbo.Building where buildingCode = '"+buildingCode+"'";
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();
        myDataReader.Read();
        String buildingName = myDataReader["name"].ToString();
        myDataReader.Close();
        myConn.Close();
        return buildingName;
    }
}

public class module
{
    public string Id { set; get; }
    public string departmentCode { set; get; }
    public string moduleCode { set; get; }
    public string title { set; get; }
}