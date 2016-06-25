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
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <label for="trackers">Tracker:</label>
            <asp:DropDownList ID="TrackerList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle"
                OnSelectedIndexChanged="TrackerList_SelectedIndexChanged" />
        </div>
        <div class="col-xs-12 col-md-6">
            <label for="trackers">Game:</label>
            <asp:DropDownList ID="GameList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle" />
        </div>
    </div>
    <div id="gameResults" class="row">
        <div class="col-xs-12">

        </div>
    </div>
</asp:Content>
