﻿<%-- 
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 15, 2016
    Description: form to create a team
    Version History: Initial Commit
    --%>
<%@ Page Title="Create Team" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTeam.aspx.cs" Inherits="Project_1.CreateTeams" %>
<asp:Content ID="CreateTeam" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-users"></span> CreateTeam</h1>
        <form action="/CreateTeam.aspx" method="post">
            <div class="form-group">
                <label>Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="form-group">
                <label>Desription</label>
                <input type="text" class="form-control" name="description" required>
            </div>
            <div class="form-group">
                <label>Sport</label>
                <select class="form-control">
                    <option>Hockey</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-lg">Create</button>
            <a href="Teams.aspx" type="submit" class="btn btn-warning btn-lg">Cancel</a>
        </form>

    </div>
</asp:Content>
