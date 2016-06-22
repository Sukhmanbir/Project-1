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
    public partial class CreateGame : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetTrackers();
                this.GetTeams();
                this.GetGame();
            }
        }

        /**
         * Gets a game to be played
         */
        protected void GetGame()
        {
            //populate the form with existing department data from the db
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //populate a game instance with the GameID from the URL parameter
                Models.Game updatedGame = (from game in db.Games
                                                 where game.GameID == GameID
                                                 select game).FirstOrDefault();


                //map the department properties to the form controls
                if (updatedGame != null)
                {
                    TrackerList.SelectedValue = updatedGame.tracker_fk.ToString();
                    GameNameTextBox.Text = updatedGame.GameName;
                    DescriptionTextBox.Text = updatedGame.GameDesc;
                    DateTextBox.Text = updatedGame.GameDate.ToString();
                    TeamAList.SelectedValue = updatedGame.TeamA.ToString();
                    TeamBList.SelectedValue = updatedGame.TeamB.ToString();
                }
            }
        }

        /**
         * Populates the team drop down lists
         */
        protected void GetTeams()
        {

            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //populate a game instance with the GameID from the URL parameter
                var teamList = (from allTeams in db.Teams
                                select allTeams).ToList();

                //bind the result to the team lists
                TeamAList.DataValueField = "TeamID";
                TeamAList.DataTextField = "TeamName";
                TeamAList.DataSource = teamList;
                TeamAList.DataBind();

                TeamBList.DataValueField = "TeamID";
                TeamBList.DataTextField = "TeamName";
                TeamBList.DataSource = teamList;
                TeamBList.DataBind();

            }

        }

        /**
         * Gets a list of trackers
         */
        protected void GetTrackers()
        {
            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //populate a game instance with the GameID from the URL parameter
                var trackers = (from allTrackers in db.Trackers
                                select allTrackers).ToList();

                //bind the result to the team lists
                TrackerList.DataValueField = "tracker_id";
                TrackerList.DataTextField = "name";
                TrackerList.DataSource = trackers;
                TrackerList.DataBind();
            }
         }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Games.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //connect to the EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                //use game model to save the object
                Models.Game newGame = new Models.Game();

                int GameID = 0;
                if (Request.QueryString.Count > 0)
                {
                    //get the id from the URL
                    GameID = Convert.ToInt32(Request.QueryString["GameID"]);

                    //get the current game from the EF DB
                    newGame = (from game in db.Games
                               where game.GameID == GameID
                               select game).FirstOrDefault();

                }

                newGame.tracker_fk = Convert.ToInt32(TrackerList.SelectedValue);
                newGame.GameName = GameNameTextBox.Text;
                newGame.GameDesc = DescriptionTextBox.Text;
                newGame.TeamA = Convert.ToInt32(TeamAList.SelectedValue);
                newGame.TeamB = Convert.ToInt32(TeamBList.SelectedValue);
                newGame.GameDate = Convert.ToDateTime(DateTextBox.Text);

                //adds new game to the Game Table collection

                //check to see if new game is being added
                if (GameID == 0)
                {
                    db.Games.Add(newGame);
                }

                //save changes - run an update
                db.SaveChanges();

                //redirect to the updated game table
                Response.Redirect("~/Games.aspx");
                
            }
        }
    }
}