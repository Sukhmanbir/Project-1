/*
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 24, 2016
    Description: Codebehind for Results.aspx
    Version History: Initial Commit
        - Display correct team information when tracker/games are changed
        - Display correct information in results form
        - Add game results to database
        - Fix bug where old game results were being overwritten
        - hide controls when there are no results to show
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

        int teamAID;
        int teamBID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // load the trackers
                this.GetTrackers();
                this.GetGames();
                this.updateNames();
                this.setTeamsOnWinner();
            }
        }

        /**
         * Populates the winner drop down list
         */
        protected void setTeamsOnWinner()
        {
            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //query the students table using EF and LINQ
                var Teams = (from allTeams in db.Teams
                             where allTeams.TeamID == teamAID || allTeams.TeamID == teamBID
                                select allTeams).ToList();

                //bind the result to the GridView
                WinnerDropDown.DataValueField = "TeamID";
                WinnerDropDown.DataTextField = "TeamName";
                WinnerDropDown.DataSource = Teams;
                WinnerDropDown.DataBind();
            }
        }

        /**
         * Populates the tracker field
         */
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

        /**
         * Gets a list of available games
         */
        protected void GetGames()
        {
            // do nothing if there are no trackers
            if (TrackerList.Items.Count == 0)
            {
                string errMsg = "Please create a game before you enter results.";
                Response.Redirect("~/ErrorPage.aspx?error=" + errMsg);
            }

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

        /**
         * Updates the display names of the input form
         */
        private void updateNames()
        {

            // hide elements if there are no games
            if (GameList.Items.Count == 0)
            {
                TeamALabel.Visible = false;
                TeamBLabel.Visible = false;
                TeamAScoreTextBox.Visible = false;
                TeamBScoreTextBox.Visible = false;
                winnerLabel.Visible = false;
                WinnerDropDown.Visible = false;
                spectatorLabel.Visible = false;
                SpectatorTextbox.Visible = false;
                dateLabel.Visible = false;
                GameDateTextBox.Visible = false;
                RecordButton.Visible = false;
                return;
            }

            int gameID = Convert.ToInt32(GameList.SelectedValue);

            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {

                // get teamA name
                var teamA = (from team in db.Teams
                                  where team.TeamID == (from games in db.Games where games.GameID == gameID select games.TeamA).FirstOrDefault()
                                  select team).FirstOrDefault();

                // get teamA name
                var teamB = (from team in db.Teams
                                  where team.TeamID == (from games in db.Games where games.GameID == gameID select games.TeamB).FirstOrDefault()
                                  select team).FirstOrDefault();

                // Set Team ID's, used for populating the winner dropdown
                this.teamAID = teamA.TeamID;
                this.teamBID = teamB.TeamID;

                // change the team names
                TeamALabel.Text = teamA.TeamName.ToString();
                TeamBLabel.Text = teamB.TeamName.ToString();
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
                // flag to track if we are adding a new game
                bool newGame = false;

                // see if game result already exists
                Models.GameResult result = (from storedGame in db.GameResults
                              where storedGame.GameFK == gameID
                        select storedGame).FirstOrDefault();

                // create a new result if no game result exists
                if (result == null)
                {
                    result = new GameResult();
                    newGame = true;
                }

                // obtain/calculate information
                int teamAScore = Convert.ToInt32(TeamAScoreTextBox.Text);
                int teamBScore = Convert.ToInt32(TeamBScoreTextBox.Text);
                int totalScore = teamAScore + teamBScore;
                int pointsAgainst = Math.Abs(teamAScore - teamBScore);

                result.TeamAScore = teamAScore;
                result.TeamBScore = teamBScore;
                result.Winner = Convert.ToInt32(WinnerDropDown.SelectedValue);
                result.GameFK = gameID;
                result.TotalScore = totalScore;
                result.PointsAgainst = pointsAgainst;
                result.Spectators = Convert.ToInt32(SpectatorTextbox.Text);
                result.GameDate = Convert.ToDateTime(GameDateTextBox.Text);

                // add the new information
                db.GameResults.Add(result);

                //save changes - run an update
                db.SaveChanges();

                //redirect to the updated tracker table
                Response.Redirect("~/Gametracker/Games.aspx");
            }
        }

        /**
         * Redirects users back to the homepage
         */
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}