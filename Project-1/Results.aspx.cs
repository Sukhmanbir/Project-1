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
            if (!IsPostBack)
            {
                // load the trackers
                this.GetTrackers();
                this.GetGames();
                this.updateNames();
            }
        }

        protected void GetTrackers()
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

            updateNames();

        }

        protected void GameList_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateNames();
        }

        private void updateNames()
        {
            // get the ID of the selected game
            int gameID = Convert.ToInt32(GameList.SelectedValue);

            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {

                // get teamA name
                var teamA_Name = (from team in db.Teams
                                  where team.TeamID == (from games in db.Games where games.GameID == gameID select games.TeamA).FirstOrDefault()
                                  select team.TeamName).FirstOrDefault();

                // get teamA name
                var teamB_Name = (from team in db.Teams
                                  where team.TeamID == (from games in db.Games where games.GameID == gameID select games.TeamB).FirstOrDefault()
                                  select team.TeamName).FirstOrDefault();

                // change the team names
                TeamALabel.Text = teamA_Name.ToString();
                TeamBLabel.Text = teamB_Name.ToString();
            }
        }

        protected void TrackerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.GetGames();
        }
    }
}