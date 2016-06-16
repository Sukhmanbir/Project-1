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
    public partial class Games : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate the grid from the EF DB
            if (!IsPostBack)
            {
                Session["SortColumn"] = "GameID";
                Session["SortDirection"] = "ASC";

                //Get Data
                this.GetGames();
            }
        }

        protected void GetGames()
        {

            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            //connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //query the games table using EF and LINQ
                var Games = (from allGames in db.Games
                                select allGames);

                //bind the result to the GridView
                GamesGridView.DataSource = Games.AsQueryable().OrderBy(sortString).ToList();
                GamesGridView.DataBind();
            }
        }

        protected void GamesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            int selectedRow = e.RowIndex;

            //get the selected GameID using the Grid's Datakey Collection
            int GameID = Convert.ToInt32(GamesGridView.DataKeys[selectedRow].Values["GameID"]);

            //use EF to find the selected game from DB and remove it
            using (DefaultConnection db = new DefaultConnection())
            {
                Models.Game deletedGame = (from gameRecords in db.Games
                                                 where gameRecords.GameID == GameID
                                                 select gameRecords).FirstOrDefault();

                //perform the removal in the db
                db.Games.Remove(deletedGame);

                //save the changes
                db.SaveChanges();

                //refresh the grid
                this.GetGames();
            }
        }

        protected void GamesGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetGames();

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void GamesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)//check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < GamesGridView.Columns.Count; index++)
                    {
                        if (GamesGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "ASC")
                            {
                                linkbutton.Text = " <i class='fa fa-caret-up fa-lg'></i>";
                            }
                            else
                            {
                                linkbutton.Text = " <i class='fa fa-caret-down fa-lg'></i>";
                            }
                            e.Row.Cells[index].Controls.Add(linkbutton);
                        }
                    }
                }
            }
        }
    }
}