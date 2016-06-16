<%-- 
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 15, 2016
    Description: form to create a game
    Version History: Initial Commit
    --%>
<%@ Page Title="Create Game" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateGame.aspx.cs" Inherits="Project_1.CreateGame" %>
<asp:Content ID="CreateGame" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-trophy"></span> Create Game</h1>
        <%--<form action="/CreateGame.aspx" method="post">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="form-group">
                <label>Description</label>
                <input type="text" class="form-control" name="description" required>
            </div>
            <div class="form-group">
                <label>Sport</label>
                <select class="form-control">
                    <option>Hockey</option>
                </select>
            </div>
            <div class="form-group">
                <label>Team A</label>
                <select class="form-control">
                    <option>Toronto Maple Leafs</option>
                </select>
            </div>
            <div class="form-group">
                <label>Team B</label>
                <select class="form-control">
                    <option>Ottawa Senators</option>
                </select>
            </div>
            <div class="form-group">
                <label>Date</label>
                <input type="text" class="form-control" name="date" placeholder="yyyy-mm-dd" required>
            </div>
            <button type="submit" class="btn btn-primary btn-lg">Create</button>
            <a href="Games.aspx" type="submit" class="btn btn-warning btn-lg">Cancel</a>
        </form>--%>

                <br />
                <div class="form-group">

                    <label class="control-label" for="GameNameTextBox">Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="GameNameTextBox"
                        placeholder="Game Name" required="true" MaxLength="20"></asp:TextBox>

                    <label class="control-label" for="DescriptionTextBox">Description</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionTextBox"
                        placeholder="Description" required="true" MaxLength="200"></asp:TextBox>

                    <label class="control-label" for="TotalScoresTextBox">Total Scores of both teams</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="TotalScoresTextBox"
                        placeholder="Total scores of both teams" required="false" TextMode="Number"></asp:TextBox>

                    <label class="control-label" for="NumOfSpectatorsTextBox">Number of Spectators</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="NumOfSpectatorsTextBox"
                        placeholder="Number of Spectators" required="false" TextMode="Number"></asp:TextBox>

                    <label class="control-label" for="WinningTeamTextBox">Winning Team</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="WinningTeamTextBox"
                        placeholder="Winning Team" required="true" MaxLength="20"></asp:TextBox>

                     <label class="control-label" for="TeamAScoreTextBox">Team A Score</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="TeamAScoreTextBox"
                        placeholder="Team A Score" required="false" TextMode="Number"></asp:TextBox>

                     <label class="control-label" for="TeamBScoreTextBox">Team B Score</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="TeamBScoreTextBox"
                        placeholder="Team B Score" required="false" TextMode="Number"></asp:TextBox>

                    <label class="control-label" for="DateTextBox">Date of Game</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="DateTextBox"
                        placeholder="Date of Game" required="false" TextMode="Date"></asp:TextBox>

                </div>
                <div class="text-right">
                    <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-warning" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                    <asp:Button Text="Save" ID="SaveButton" runat="server" CssClass="btn btn-primary" OnClick="SaveButton_Click" />
                </div>

    </div>
</asp:Content>
