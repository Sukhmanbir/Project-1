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
    public partial class CreateTracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetTracker();
                
            }
        }

        /**
         * Populates the form with the requested tracker
         */
        protected void GetTracker()
        {
            //populate the form with existing department data from the db
            int tracker_id = Convert.ToInt32(Request.QueryString["tracker_id"]);

            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //populate a tracker instance with the tracker_id from the URL parameter
                Models.Tracker updatedTracker = (from tracker in db.Trackers
                                                 where tracker.tracker_id == tracker_id
                                                 select tracker).FirstOrDefault();


                //map the department properties to the form controls
                if (updatedTracker != null)
                {
                    TrackerNameTextBox.Text = updatedTracker.name;
                    DescriptionTextBox.Text = updatedTracker.description;
                }
            }
        }
        
        /**
         * Returns the user to the tracker page
         */
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Gametracker/Trackers.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //use tracker model to save the object
                Models.Tracker newTracker = new Models.Tracker();

                int tracker_id = 0;
                if (Request.QueryString.Count > 0)
                {
                    //get the id from the URL
                    tracker_id = Convert.ToInt32(Request.QueryString["tracker_id"]);

                    //get the current tracker from the EF DB
                    newTracker = (from tracker in db.Trackers
                                  where tracker.tracker_id == tracker_id
                                  select tracker).FirstOrDefault();
                }

                    newTracker.name = TrackerNameTextBox.Text;
                    newTracker.description = DescriptionTextBox.Text;

                    //adds new tracker to the Tracker Table collection

                    //check to see if new tracker is being added
                    if (tracker_id == 0)
                    {
                        db.Trackers.Add(newTracker);
                    }

                    //save changes - run an update
                    db.SaveChanges();

                    //redirect to the updated tracker table
                    Response.Redirect("~/Gametracker/Trackers.aspx");
                
            }
        }
    }
}