﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GameTrackerConnection : DbContext
    {
        public GameTrackerConnection()
            : base("name=GameTrackerConnection")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<GameResult> GameResults { get; set; }
        public virtual DbSet<Game> Games { get; set; }
        public virtual DbSet<Sport> Sports { get; set; }
        public virtual DbSet<Table> Tables { get; set; }
        public virtual DbSet<Team> Teams { get; set; }
        public virtual DbSet<Tracker> Trackers { get; set; }
    }
}
