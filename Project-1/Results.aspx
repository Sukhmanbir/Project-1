<%--
    Author's Name: Sukhmanbir Kaur
    Student Number: 200303856
    Date Modified: June 08, 2016
    Description: shows the results of the games
    Version History: Initial Commit
        -- implemented wireframe
--%>

<%@ Page Title="Enter Game Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Project_1.Results" %>

<asp:Content ID="Results" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-table"></span> Enter Game Results</h1>
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <label>Tracker</label>
            <asp:DropDownList ID="TrackerList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle" />
        </div>
        <div class="col-xs-12 col-sm-6">
            <label>Game</label>
            <asp:DropDownList ID="GameList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle" />
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <h2>Game Details</h2>
            <div class="form-group">
                <label>Score for Toronto Maple Leafs</label>
                <input type="text" class="form-control" name="teama" required>
            </div>
            <div class="form-group">
                <label>Score for Ottawa Senators</label>
                <input type="text" class="form-control" name="teamb" required>
            </div>
            <div class="form-group">
                <label>Spectators</label>
                <input type="text" class="form-control" name="spectators" required>
            </div>
            <button type="submit" class="btn btn-primary btn-lg">Record Results</button>
            <a href="Default.aspx" type="submit" class="btn btn-warning btn-lg">Cancel</a>
        </div>
    </div>
</asp:Content>
