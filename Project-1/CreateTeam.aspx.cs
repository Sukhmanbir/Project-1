using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//required for EF DB access
using Project_1.Models;
using System.Web.ModelBinding;

namespace Project_1
{
    public partial class CreateTeams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetTeam();
            }
        }

        protected void GetTeam()
        {
            //populate the form with existing department data from the db
            int TeamID = Convert.ToInt32(Request.QueryString["TeamID"]);

            //connect to the EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //populate a team instance with the TeamID from the URL parameter
                Team updatedTeam = (from team in db.Teams
                                           where team.TeamID == TeamID
                                           select team).FirstOrDefault();


                //map the department properties to the form controls
                if (updatedTeam != null)
                {
                    TeamNameTextBox.Text = updatedTeam.TeamName;
                    DescriptionTextBox.Text = updatedTeam.TeamDesc;
                }
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Teams.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //connect to the EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //use team model to save the object
                Team newTeam = new Team();

                int TeamID = 0;
                if (Request.QueryString.Count > 0)
                {
                    //get the id from the URL
                    TeamID = Convert.ToInt32(Request.QueryString["TeamID"]);

                    //get the current team from the EF DB
                    newTeam = (from team in db.Teams
                               where team.TeamID == TeamID
                               select team).FirstOrDefault();
                }

                    newTeam.TeamName = TeamNameTextBox.Text;
                    newTeam.TeamDesc = DescriptionTextBox.Text;

                    //adds new team to the team Table collection

                    //check to see if new team is being added
                    if (TeamID == 0)
                    {
                        db.Teams.Add(newTeam);
                    }

                    //save changes - run an update
                    db.SaveChanges();

                    //redirect to the updated team table
                    Response.Redirect("~/Teams.aspx");
                }
            }
        }
    }