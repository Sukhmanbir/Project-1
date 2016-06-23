using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//required for identity and OWIN security
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

/**
 * @author: Tom Tsiliopoulos
 * @date: May 26, 2016
 * @version: 0.0.1 - added SetActivePage method
 */

namespace Project_1
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //check if the user is logged in
                if(HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    //show the game tracker content area
                    GametrackerPlaceHolder.Visible = true;
                    PublicPlaceHolder.Visible = false;
                }
                else
                {
                    //only show login and signup
                    GametrackerPlaceHolder.Visible = false;
                    PublicPlaceHolder.Visible = true;
                }
                SetActivePage();
            }
        }

        /**
         * This method adds a css class of "active" to list items
         * relating to the current page
         * 
         * @private
         * @method SetActivePage
         * @return {void}
         */
        private void SetActivePage()
        {
            switch (Page.Title)
            {
                case "Home Page":
                    home.Attributes.Add("class", "active");
                    break;
                case "Signup":
                    signup.Attributes.Add("class", "active");
                    break;
                case "Login":
                    login.Attributes.Add("class", "active");
                    break;
                case "Trackers":
                    trackers.Attributes.Add("class", "active");
                    break;
                case "Create Tracker":
                    trackers.Attributes.Add("class", "active");
                    break;
                case "Teams":
                    teams.Attributes.Add("class", "active");
                    break;
                case "Create Team":
                    teams.Attributes.Add("class", "active");
                    break;
                case "Games":
                    games.Attributes.Add("class", "active");
                    break;
                case "Create Game":
                    games.Attributes.Add("class", "active");
                    break;
                case "Enter Game Results":
                    results.Attributes.Add("class", "active");
                    break;
                case "Logout":
                    logout.Attributes.Add("class", "active");
                    break;
            }
        }
    }
}