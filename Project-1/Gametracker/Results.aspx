<%--
    Author's Name: Sukhmanbir Kaur
    Student Number: 200303856
    Date Modified: June 08, 2016
    Description: shows the results of the games
    Version History: Initial Commit
        -- implemented wireframe
        -- added validators
        -- hide controls when there are no results to show
--%>

<%@ Page Title="Enter Game Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Project_1.Results" %>

<asp:Content ID="Results" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-table"></span> Enter Game Results</h1>
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <label>Tracker</label>
            <asp:DropDownList ID="TrackerList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle"
                OnSelectedIndexChanged="TrackerList_SelectedIndexChanged" />
        </div>
        <div class="col-xs-12 col-sm-6">
            <label>Game</label>
            <asp:DropDownList ID="GameList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle"
                OnSelectedIndexChanged="GameList_SelectedIndexChanged" />
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <h2><asp:Label ID="headerLabel" runat="server"></asp:Label></h2>
            <div class="form-group">
                <asp:Label runat="server" ID="TeamALabel" Text="Team A"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TeamAScoreTextBox"
                placeholder="Team A Score" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="teamAScoreValidator" runat="server" 
                    ErrorMessage="Please enter a score for team A" 
                    ControlToValidate="TeamAScoreTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label runat="server" ID="TeamBLabel" Text="Team B"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TeamBScoreTextBox"
                placeholder="Team B Score" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="teamBScoreValidator" runat="server" 
                    ErrorMessage="Please enter a score for team B" 
                    ControlToValidate="TeamBScoreTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="winnerLabel" runat="server">Winning Team</asp:Label>
                <asp:DropDownList ID="WinnerDropDown" runat="server" CssClass="form-control dropdown-toggle" />
            </div>
            <div class="form-group">
                <asp:Label ID="spectatorLabel" runat="server">Spectators</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="SpectatorTextbox"
                placeholder="Total Spectators Present" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="spectatorValidator" runat="server" 
                    ErrorMessage="Please enter a total spectators present" 
                    ControlToValidate="SpectatorTextbox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="dateLabel" runat="server">Game Date</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="GameDateTextBox"
                    placeholder="yyyy-mm-dd" required="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="dateValidator" runat="server" 
                    ErrorMessage="Please enter the date of the game" 
                    ControlToValidate="SpectatorTextbox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <asp:Button Text="Record Results" ID="RecordButton" runat="server" CssClass="btn btn-primary btn-lg" CausesValidation="true" OnClick="RecordButton_Click" />
            <asp:Button Text="Cancel" runat="server" CausesValidation="false" OnClick="Unnamed_Click" CssClass="btn btn-warning btn-lg" />
        </div>
    </div>
</asp:Content>
