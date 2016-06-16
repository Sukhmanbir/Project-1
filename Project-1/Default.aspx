﻿<%--

    File: Default.aspx

    Homepage for the game tracker.

    Author: Douglas Brunner (020087918)
    History: Initial commit
    Modified: 2016-06-13
        - Implemented wireframe

--%>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dash-header" class="row">
        <div class="col-xs-12 col-md-6">
            <h1>Game Results</h1>
        </div>
        <div class="col-xs-12 col-md-6 trackers">
            <label for="trackers">Tracker:</label>
            <asp:DropDownList ID="TrackerList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle"
                OnSelectedIndexChanged="Trackers_SelectedIndexChanged" />
        </div>
    </div>
    <div id="gameList" class="row">
        <div class="col-xs-12 text-center">            
            <ul class="list-inline slimList">
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li class="today">
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="gameResults" class="row">
        <div class="col-xs-12">

            <asp:GridView runat="server" ID="GameDeatilsGridView" AutoGenerateColumns="false"
                CssClass="table table-striped table-bordered table-hover">
                <Columns>
                    <asp:BoundField DataField="GameName" HeaderText="Name" Visible="true" />
                    <asp:BoundField DataField="GameDesc" HeaderText="Description" Visible="true" />
                    <asp:BoundField DataField="TeamA" HeaderText="Team A" Visible="true" />
                    <asp:BoundField DataField="TeamAScore" HeaderText="(Score)" Visible="true" />
                    <asp:BoundField DataField="TeamB" HeaderText="Team B" Visible="true" />
                    <asp:BoundField DataField="TeamBScore" HeaderText="(Score)" Visible="true" />
                    <asp:BoundField DataField="Total_scores" HeaderText="Total Score" Visible="true" />
                    <asp:BoundField DataField="Winning_team" HeaderText="Winner" Visible="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
