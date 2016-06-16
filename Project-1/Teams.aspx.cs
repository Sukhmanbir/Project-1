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
    public partial class Teams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate the grid from the EF DB
            if (!IsPostBack)
            {
                Session["SortColumn"] = "TeamID";
                Session["SortDirection"] = "ASC";

                //Get Data
                this.GetTeams();
            }
        }

        protected void GetTeams()
        {

            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            //connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //query the teams table using EF and LINQ
                var Teams = (from allTeams in db.Teams
                                select allTeams);

                //bind the result to the GridView
                TeamsGridView.DataSource = Teams.AsQueryable().OrderBy(sortString).ToList();
                TeamsGridView.DataBind();
            }
        }

        protected void TeamsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            int selectedRow = e.RowIndex;

            //get the selected TeamID using the Grid's Datakey Collection
            int TeamID = Convert.ToInt32(TeamsGridView.DataKeys[selectedRow].Values["TeamID"]);

            //use EF to find the selected team from DB and remove it
            using (DefaultConnection db = new DefaultConnection())
            {
                Team deletedTeam = (from teamRecords in db.Teams
                                                 where teamRecords.TeamID == TeamID
                                                 select teamRecords).FirstOrDefault();

                //perform the removal in the db
                db.Teams.Remove(deletedTeam);

                //save the changes
                db.SaveChanges();

                //refresh the grid
                this.GetTeams();
            }
        }

        protected void TeamsGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetTeams();

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void TeamsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)//check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < TeamsGridView.Columns.Count; index++)
                    {
                        if (TeamsGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
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