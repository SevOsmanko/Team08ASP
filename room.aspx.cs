using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //For connection database
using System.Web.Services;

public partial class room : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        //=========Table Title setup (start)==========

        //Create a row
        TableRow titleRow = new TableRow();

        //Create cell
        TableCell titleCel1 = new TableCell();
        TableCell titleCel2 = new TableCell();
        TableCell titleCel3 = new TableCell();
        TableCell titleCel4 = new TableCell();
        TableCell titleCel5 = new TableCell();
        TableCell titleCel6 = new TableCell();

        //Put the text into the cell
        titleCel1.Text = "<b>Name</b>";
        titleCel2.Text = "<b>Building</b>";
        titleCel3.Text = "<b>Park</b>";
        titleCel4.Text = "<b>Room Type</b>";
        titleCel5.Text = "<b>Seating Type</b>";
        titleCel6.Text = "<b>Capacity</b>";

        //Put the cell into the row
        titleRow.Cells.Add(titleCel1);
        titleRow.Cells.Add(titleCel2);
        titleRow.Cells.Add(titleCel3);
        titleRow.Cells.Add(titleCel4);
        titleRow.Cells.Add(titleCel5);
        titleRow.Cells.Add(titleCel6);

        //Put the row into the table
        roomList.Rows.Add(titleRow);

        //===========Table Title setup (End)===============


        //Get all the room data order by name
        string strConn = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
        SqlConnection myConn = new SqlConnection(strConn);
        myConn.Open();
        String strSQL = @"select * from dbo.room order by name";
        SqlCommand myCommand = new SqlCommand(strSQL, myConn);
        SqlDataReader myDataReader = myCommand.ExecuteReader();

        //Loop out the result
        while (myDataReader.Read())
        {
            if (myDataReader["Id"] != "")
            {
                //Connect to the database for getting the parkCode
                string strConn2 = "server=co-web.lboro.ac.uk;database=team08;User ID=team08;Password=vfh47fh;Trusted_Connection=False;";
                SqlConnection myConn2 = new SqlConnection(strConn2);
                myConn2.Open();
                String strSQL2 = @"select * from dbo.building where buildingCode = '" + myDataReader["buildingCode"] + "'";
                SqlCommand myCommand2 = new SqlCommand(strSQL2, myConn2);
                SqlDataReader myDataReader2 = myCommand2.ExecuteReader();
                myDataReader2.Read();

                //Create a row
                TableRow row = new TableRow();
                TableRow rowDetail = new TableRow(); //detail

                //Create cell
                TableCell cell = new TableCell();
                TableCell cel2 = new TableCell();
                TableCell cel3 = new TableCell();
                TableCell cel4 = new TableCell();
                TableCell cel5 = new TableCell();
                TableCell cel6 = new TableCell();
                TableCell cel7 = new TableCell();
                TableCell detail = new TableCell(); //Detail cell

                detail.ColumnSpan = 6; //Column span for showing the detail of the room, it will not work after changing the contain of detail, need to fix it

                detail.Text = "<div>hello</div>"; //Just put some testing word into the detail column
                rowDetail.Style.Add(HtmlTextWriterStyle.Display, "none"); //Hidden the room details

                //Put the text into the cell
                //Cel1
                cell.Text = myDataReader["name"].ToString();

                //Cel2
                cel2.Text = myDataReader["buildingCode"].ToString();
                
                //Cel3
                cel3.Text = myDataReader2["parkCode"].ToString();

                //Cel4
                if(myDataReader["roomType"].ToString()=="L")
                    cel4.Text = "Lecture"; //Replace L to Lecture
                else
                    cel4.Text = "Seminar"; //Replace S to Seminar

                //Cel5
                if (myDataReader["seatingType"].ToString() == "T")
                    cel5.Text = "Tiered"; //Replace T to Tiered
                else
                    cel5.Text = "Flat"; //Replace F to Flat
                
                //Cel6
                cel6.Text = myDataReader["capacity"].ToString();

                //Cel7
                cel7.Text = "<input type='button' class='RowButton' value='Details'/>";

                //Put the cell into the row
                row.Cells.Add(cell);
                row.Cells.Add(cel2);
                row.Cells.Add(cel3);
                row.Cells.Add(cel4);
                row.Cells.Add(cel5);
                row.Cells.Add(cel6);
                row.Cells.Add(cel7);
                rowDetail.Cells.Add(detail);//For detail cell

                //Put the row into the table
                roomList.Rows.Add(row);
                roomList.Rows.Add(rowDetail);

                //Close the connection
                myDataReader2.Close();
                myConn2.Close();
            }
        }
        //Close the connection
        myDataReader.Close(); 
        myConn.Close();
    }
}