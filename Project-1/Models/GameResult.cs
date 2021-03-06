//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class GameResult
    {
        public int GameResultsID { get; set; }
        public int TeamA { get; set; }
        public int TeamAScore { get; set; }
        public int TeamB { get; set; }
        public int TeamBScore { get; set; }
        public System.DateTime GameDate { get; set; }
        public int Spectators { get; set; }
        public int Winner { get; set; }
        public int PointsAgainst { get; set; }
        public int GameFK { get; set; }
        public int TotalScore { get; set; }
    
        public virtual Game Game { get; set; }
        public virtual Team Team { get; set; }
        public virtual Team Team1 { get; set; }
        public virtual Team Team2 { get; set; }
    }
}
