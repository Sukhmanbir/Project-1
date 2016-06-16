using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//required for EF DB access
using Project_1.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace Project_1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.GetTrackers();
            this.GetGames();
        }

        protected void Trackers_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        /**
         * Gets the list of games for selected tracker
         */
        protected void GetGames()
        {
            
            //connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {

                int tracker_id = Convert.ToInt32(TrackerList.SelectedValue);

                //query the students table using EF and LINQ
                var Games = (from allGames in db.Games
                             where allGames.tracker_fk == tracker_id
                             select allGames);
                    
                //bind the result to the GridView    
                GameDeatilsGridView.DataSource = Games.AsQueryable().ToList();
                GameDeatilsGridView.DataBind();
            }
        }

        /**
         * Gets the list of trackers from the database
         */
        protected void GetTrackers()
        {
            
            //connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //query the students table using EF and LINQ
                var Trackers = (from allTrackers in db.Trackers
                                select allTrackers).ToList();

                //bind the result to the GridView
                TrackerList.DataValueField = "tracker_id";
                TrackerList.DataTextField = "name";
                TrackerList.DataSource = Trackers;
                TrackerList.DataBind();
            }
        }

    }
}