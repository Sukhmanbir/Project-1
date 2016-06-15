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
    public partial class Tracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if loading the page for the first time, populate the grid from the EF DB
            if (!IsPostBack)
            {
                Session["SortColumn"] = "tracker_id";
                Session["SortDirection"] = "ASC";

                //Get Data
                this.GetTrackers();
            } 
        }

        protected void GetTrackers()
        {

            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            //connect to EF DB
            using (DefaultConnection db = new DefaultConnection())
            {
                //query the students table using EF and LINQ
                var Trackers = (from allTrackers in db.Trackers
                                   select allTrackers);

                //bind the result to the GridView
                TrackersGridView.DataSource = Trackers.AsQueryable().OrderBy(sortString).ToList();
                TrackersGridView.DataBind();
            }
        }

        protected void TrackersGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            //get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            //refresh the grid
            this.GetTrackers();

            //toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }

        protected void TrackersGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header)//check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < TrackersGridView.Columns.Count; index++)
                    {
                        if (TrackersGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
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

        protected void TrackersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was clicked
            int selectedRow = e.RowIndex;

            //get the selected tracker_id using the Grid's Datakey Collection
            int tracker_id = Convert.ToInt32(TrackersGridView.DataKeys[selectedRow].Values["tracker_id"]);

            //use EF to find the selected student from DB and remove it
            using (DefaultConnection db = new DefaultConnection())
            {
                Models.Tracker deletedTracker = (from trackerRecords in db.Trackers
                                                where trackerRecords.tracker_id == tracker_id
                                          select trackerRecords).FirstOrDefault();

                //perform the removal in the db
                db.Trackers.Remove(deletedTracker);

                //save the changes
                db.SaveChanges();

                //refresh the grid
                this.GetTrackers();
            }
        }
    }
}