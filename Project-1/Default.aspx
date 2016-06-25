<%--

    File: Default.aspx

    Homepage for the game tracker.

    Author: Douglas Brunner (020087918)
    History: Initial commit
    Modified: 2016-06-13
        - Implemented wireframe
        - Showed weekly dates as selected by user
        - Added validation to date textbox
        - Modify display to focus on individual game series
--%>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dash-header" class="row">
        <div class="col-xs-12 col-md-6">
            <h1>Game Results</h1>
            <p class="text-center"><asp:Label ID="noGameLabel" runat="server">There are currently no game results to display.</asp:Label></p>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <asp:Label ID="trackerLabel" runat="server">Tracker:</asp:Label>
            <asp:DropDownList ID="TrackerList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle"
                OnSelectedIndexChanged="TrackerList_SelectedIndexChanged" />
        </div>
        <div class="col-xs-12 col-md-6">
            <label id="gameLabel" runat="server">Game:</label>
            <asp:DropDownList ID="GameList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle" />
        </div>
    </div>
    <div id="gameResults" class="row">
        <div class="col-xs-12">
            <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="ResultsGridView" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="TeamA" HeaderText="Team A" Visible="true" />
                    <asp:BoundField DataField="TeamAScore" HeaderText="Team A Score" Visible="true" />
                    <asp:BoundField DataField="TeamB" HeaderText="Team B" Visible="true" />
                    <asp:BoundField DataField="TeamBScore" HeaderText="Team B Score" Visible="true" />
                    <asp:BoundField DataField="TotalScore" HeaderText="TotalScore" Visible="true" />
                    <asp:BoundField DataField="Winner" HeaderText="Winner" Visible="true" />
                    <asp:BoundField DataField="PointsAgainst" HeaderText="Points Against" Visible="true" />
                    <asp:BoundField DataField="GameDate" HeaderText="Game Date" Visible="true" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
