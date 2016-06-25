/*
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 20, 2016
    Description: controls for Default.aspx
    Version History: Initial Commit
        - Display games according to selected tracker
        - Display games according to date
        - Update game list according to selected tracker
        - Hide controls if there are no results to show
        - Show message if no game results have been entered
    */
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
        /**
         * Loads the game details for the selected week
         */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GetTrackers();
                this.GetGames();
            }
        }

        /**
         * Loads the games for this tracker
         */
        protected void GetGames()
        {
            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                // get control values
                int tracker_id = Convert.ToInt32(TrackerList.SelectedValue);

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

            // load the game results
            this.GetResults();

        }

        /**
         * Loads the game results
         */
        protected void GetResults()
        {
            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {

                // do nothing if there are no trackers
                if (TrackerList.Items.Count == 0 || GameList.Items.Count == 0)
                {
                    // hide main page display elements
                    ResultsGridView.Visible = false;
                    TrackerList.Visible = false;
                    GameList.Visible = false;
                    trackerLabel.Visible = false;
                    gameLabel.Visible = false;

                    // show no game message
                    noGameLabel.Visible = true;

                    return;

                }

                // get control values
                int tracker_id = Convert.ToInt32(TrackerList.SelectedValue);

                int game_id = Convert.ToInt32(GameList.SelectedValue);

                //query the students table using EF and LINQ
                var results = (from gameResult in db.ResultsViews
                               where gameResult.GameID == game_id
                                select gameResult);

                if (results.AsQueryable().ToList().Count == 0)
                {
                    noGameLabel.Visible = true;
                }

                //bind the result to the GridView
                ResultsGridView.DataSource = results.AsQueryable().ToList();
                ResultsGridView.DataBind();

            }
            
        }
        
        /**
         * Gets the list of trackers from the database
         */
        protected void GetTrackers()
        {

            if (!IsPostBack) { 

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

        /**
         * Updates the games when tracker changes
         */
        protected void TrackerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetGames();
        }
    }
}