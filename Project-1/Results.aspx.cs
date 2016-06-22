using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using Project_1.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace Project_1
{
    public partial class Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // load the trackers
            this.GetTrackers();
            this.GetGames();
        }

        protected void GetTrackers()
        {

            if (!IsPostBack)
            {

                //connect to EF DB
                using (GameTrackerConnection db = new GameTrackerConnection())
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

        protected void GetGames()
        {
            
            // get control values
            int tracker_id = Convert.ToInt32(TrackerList.SelectedValue);

            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //query the students table using EF and LINQ
                var Games = (from allGames in db.Games
                                where allGames.tracker_fk == tracker_id
                                select allGames).ToList();

                //bind the result to the GridView
                GameList.DataValueField = "GameID";
                GameList.DataTextField = "GameName";
                GameList.DataSource = Games;
                GameList.DataBind();
            }
        }

    }
}