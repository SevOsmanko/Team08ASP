using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team_Projects
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

                  protected void moduleCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            moduleCode.SelectedIndex = moduleTitle.SelectedIndex;
        }

           protected void moduleTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            moduleTitle.SelectedIndex = moduleCode.SelectedIndex;
        }
        } 
    }
