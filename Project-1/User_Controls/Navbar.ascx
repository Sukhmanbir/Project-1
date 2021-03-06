﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="Project_1.Navbar" %>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><img src="../Assets/Images/siteLogo1.png" /></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="home" runat="server"><a href="/Default.aspx"><i class="fa fa-home fa-lg"></i> Home</a></li>

                <asp:PlaceHolder ID="PublicPlaceHolder" runat="server">
                    <li id="signup" runat="server"><a href="/Signup.aspx"><i class="fa fa-user-plus fa-lg"></i> Signup</a></li>
                    <li id="login" runat="server"><a href="/Login.aspx"><i class="fa fa-sign-in fa-lg"></i> Login</a></li>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="GametrackerPlaceHolder" runat="server">
                    <li id="trackers" runat="server"><a href="/Gametracker/Trackers.aspx"><i class="fa fa-location-arrow fa-lg"></i> Trackers</a></li>
                    <li id="teams" runat="server"><a href="/Gametracker/Teams.aspx"><i class="fa fa-users fa-lg"></i> Teams</a></li>
                    <li id="games" runat="server"><a href="/Gametracker/Games.aspx"><i class="fa fa-soccer-ball-o fa-lg"></i> Games</a></li>
                    <li id="results" runat="server"><a href="/Gametracker/Results.aspx"><i class="fa fa-table fa-lg"></i> Results</a></li>
                    <li id="logout" runat="server"><a href="/Logout.aspx"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
                </asp:PlaceHolder>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
