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
                this.GetGame();
            }
        }

        protected void GetGame()
        {
            //populate the form with existing department data from the db
            int GameID = Convert.ToInt32(Request.QueryString["GameID"]);

            //connect to the EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //populate a game instance with the GameID from the URL parameter
                Models.Game updatedGame = (from game in db.Games
                                                 where game.GameID == GameID
                                                 select game).FirstOrDefault();


                //map the department properties to the form controls
                if (updatedGame != null)
                {
                    GameNameTextBox.Text = updatedGame.GameName;
                    DescriptionTextBox.Text = updatedGame.GameDesc;
                    TotalScoresTextBox.Text = Convert.ToString(updatedGame.Total_scores);
                    NumOfSpectatorsTextBox.Text = Convert.ToString(updatedGame.Num_of_spectators);
                    WinningTeamTextBox.Text = updatedGame.Winning_team;
                    TeamAScoreTextBox.Text = Convert.ToString(updatedGame.TeamAScore);
                    TeamBScoreTextBox.Text = Convert.ToString(updatedGame.TeamBScore);
                    DateTextBox.Text = updatedGame.GameDate.ToString();
                }
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Games.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //connect to the EF DB
            using (DefaultConnection db = new DefaultConnection())
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

                    newGame.GameName = GameNameTextBox.Text;
                    newGame.GameDesc = DescriptionTextBox.Text;
                    newGame.Total_scores = Convert.ToInt32(TotalScoresTextBox.Text);
                    newGame.Num_of_spectators = Convert.ToInt32(NumOfSpectatorsTextBox.Text);
                    newGame.Winning_team = WinningTeamTextBox.Text;
                    newGame.TeamAScore = Convert.ToInt32(TeamAScoreTextBox.Text);
                    newGame.TeamBScore = Convert.ToInt32(TeamBScoreTextBox.Text);
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
}