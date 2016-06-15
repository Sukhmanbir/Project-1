<%-- 
    Author's Name: Sukhmanbir Kaur
    Student Number: 200303856
    Date Modified: June 08, 2016
    Description: shows the details of the games
    Version History: Initial Commit
        -- Implemented wireframe
    --%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="Project_1.Games" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-trophy"></span> Games</h1>

    <table class="table table-striped table-responsive">
        <thead>
            <th>Name</th>
            <th>Description</th>
            <th>Sport</th>
            <th>Spectators</th>
            <th>Score</th>
            <th>Winner</th>
            <th>Date</th>
            <th>Action</th>
        </thead>
        <tr>
            <td>New York Rangers vs Los Angles Kings</td>
            <td>Opening game for the Los Angles Kings</td>
            <td>Hockey</td>
            <td>14,8743</td>
            <td>5 : 3 - 2</td>
            <td>Los Angles Kings</td>
            <td>2016.09.15</td>
            <td>
                <a class="btn btn-primary">Edit</a>
                <a class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <tr>
            <td>Toronto Maple Leafs vs Ottawa Senators</td>
            <td>First time teams have played this season.</td>
            <td>Hockey</td>
            <td>TBA</td>
            <td>TBA</td>
            <td>TBA</td>
            <td>2016.10.28</td>
            <td>
                <a class="btn btn-primary">Edit</a>
                <a class="btn btn-danger">Delete</a>
            </td>
        </tr>
    </table>
</asp:Content>
