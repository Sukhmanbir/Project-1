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

namespace Project_1
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            //create new userStore and userManager object
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);

            //create a new user object
            var user = new IdentityUser()
            {
                UserName = UserNameTextBox.Text,
                Email = EmailTextBox.Text
            };

            //create new user in the db and store the result
            IdentityResult result = userManager.Create(user, PasswordTextBox.Text);

            //check if successfully registered
            if (result.Succeeded)
            {
                //authenticate and login our new user
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                //sign in
                authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

                //redirect to the default page
                Response.Redirect("/Default.aspx");
            }
            else
            {
                //display error in the AlertFlash div
                StatusLabel.Text = result.Errors.FirstOrDefault();
                AlertFlash.Visible = true;
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //Redirect back to the Default page
            Response.Redirect("~/Default.aspx");
        }

    }
} 