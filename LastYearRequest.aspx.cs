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






using System.Web.Security;


using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


namespace Team_Projects
{
    public partial class _Default : System.Web.UI.Page
    {
        void LastYearRequestGridView_DataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label3.Text = ";fgzd fgz ";

            }
            Label3.Text = "hello";
        }
        
    }
}