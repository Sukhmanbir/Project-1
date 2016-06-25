﻿/*
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 20, 2016
    Description: controls for Default.aspx
    Version History: Initial Commit
        - Display games according to selected tracker
        - Display games according to date
        - Update game list according to selected tracker
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
        }

        /**
         * Gets the list of games for selected tracker
         */
        protected void GetGames2()
        {
            
            //connect to EF DB
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                /*
                // get control values
                int tracker_id = Convert.ToInt32(TrackerList.SelectedValue);

                // holds the selected date
                DateTime selectedDate;

                // set the selected date to today if it hasn't already been set
                if (gameDateText.Text.Equals(""))
                {
                    selectedDate = DateTime.Today;
                    gameDateText.Text = selectedDate.ToString("yyyy-MM-dd");
                } else
                {
                    selectedDate = Convert.ToDateTime(gameDateText.Text.ToString());
                }

                // set the dates
                dateMinus3.InnerText    = selectedDate.AddDays(-3).ToString("yyyy-MM-dd");
                dateMinus2.InnerText    = selectedDate.AddDays(-2).ToString("yyyy-MM-dd");
                dateMinus1.InnerText    = selectedDate.AddDays(-1).ToString("yyyy-MM-dd");
                
                datePlus1.InnerText     = selectedDate.AddDays(1).ToString("yyyy-MM-dd");
                datePlus2.InnerText     = selectedDate.AddDays(2).ToString("yyyy-MM-dd");
                datePlus3.InnerText     = selectedDate.AddDays(3).ToString("yyyy-MM-dd");

                // set the range of dates to pull games from
                DateTime weekBegin = selectedDate.AddDays(-3);
                DateTime weekEnd = selectedDate.AddDays(3);

                //query the students table using EF and LINQ
                var Games = (from allGames in db.Games
                             where allGames.tracker_fk == tracker_id
                             select allGames);
                  */  
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