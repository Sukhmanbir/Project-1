/*
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 22, 2016
    Description: Codebehind for Results.aspx
    Version History: Initial Commit
        - Display correct team information when tracker/games are changed
    */
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

        protected void RecordButton_Click(object sender, EventArgs e)
        {

            // get the game id
            int gameID = Convert.ToInt32(GameList.SelectedValue);

            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //use tracker model to save the object
                Models.Game game = new Models.Game();

                game = (from storedGame in db.Games
                              where storedGame.GameID == gameID
                        select storedGame).FirstOrDefault();

                // obtain/calculate information
                int TeamAScore = Convert.ToInt32(TeamAScoreTextBox.Text);
                int TeamBScore = Convert.ToInt32(TeamBScoreTextBox.Text);

                // add the new information
                game.Num_of_spectators = Convert.ToInt32(SpectatorTextbox.Text);
                game.TeamAScore = TeamAScore;
                game.TeamBScore = TeamBScore;
                game.Total_scores = TeamAScore + TeamBScore;
                
                //save changes - run an update
                db.SaveChanges();

                //redirect to the updated tracker table
                Response.Redirect("~/Games.aspx");
            }
        }
    }
}