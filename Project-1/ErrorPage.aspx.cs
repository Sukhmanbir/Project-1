using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_1.Gametracker
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // show the default error if none was provided
            if (Request.QueryString["error"] == null)
            {
                ErrorLabel.Text = "An error occured with the system.";
            } else
            {
                ErrorLabel.Text = Request.QueryString["error"];
            }
        }
    }
}