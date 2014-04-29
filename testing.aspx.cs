using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            //TableRow row = new TableRow();

            //TableCell cell1 = new TableCell();
            //cell1.Text = "表格第一列";
            //row.Cells.Add(cell1);

            //TableCell cell2 = new TableCell();
            //cell2.Text = "表格第二列";
            ////cell2.Font.Size = FontUnit.Large; //設定文字尺寸
            //cell2.ForeColor = System.Drawing.Color.Blue; //設定文字顏色
            //cell2.BackColor = System.Drawing.Color.Red; //設定文字顏色
            //row.Cells.Add(cell2);


            //TableCell cell3 = new TableCell();
            //cell3.Text = "表格第三列";
            //row.Cells.Add(cell3);

            //產生表格
            //Table1.Rows.Add(row);
            //Table1.Rows.Add(row);
        int i = 0;
        while (i < 10)
        {
            TableRow row = new TableRow();
            TableCell cell = new TableCell();
            TableCell cel2 = new TableCell();
            cell.Text = "abc";
            cel2.Controls.Add(new TextBox());
            row.Cells.Add(cell);
            row.Cells.Add(cel2);
            Table1.Rows.Add(row);
            i++;
        }
        TableRow rowTest = new TableRow();
        TableCell cellTest = new TableCell();
        //TableCell cel2Test = new TableCell();
        cellTest.Text = "abddddddddddddddddddddddddddddddddddddddc";
        cellTest.ColumnSpan = 2;
        rowTest.Cells.Add(cellTest);
        Table1.Rows.Add(rowTest);

        if (Request.QueryString["a"] != null)
        {
            Response.Write(Request.QueryString["a"]);
            Response.Write(Request.QueryString["b"]);
        }
    }
}