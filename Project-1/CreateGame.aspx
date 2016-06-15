<%-- 
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 15, 2016
    Description: form to create a game
    Version History: Initial Commit
    --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateGame.aspx.cs" Inherits="Project_1.CreateGame" %>
<asp:Content ID="CreateGame" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-trophy"></span> Create Game</h1>
        <form action="/CreateGame.aspx" method="post">
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
            <button type="submit" class="btn btn-warning btn-lg">Cancel</button>
        </form>

        <hr>

        <p>Need an account? <a href="/Signup.aspx">Signup</a></p>

    </div>
</asp:Content>
