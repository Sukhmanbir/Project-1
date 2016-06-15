<%-- 
    Author's Name: Sukhmanbir Kaur
    Student Number: 200303856
    Date Modified: June 08, 2016
    Description: shows the details of the trackers
    Version History: Initial Commit
        - implemented wireframe
--%>

<%@ Page Title="Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tracker.aspx.cs" Inherits="Project_1.Tracker" %>

<asp:Content ID="Trackers" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-location-arrow"></span> Trackers <a href="CreateTracker.aspx" class="btn btn-primary pull-right">Create</a></h1>

    <table class="table table-striped">
        <thead>
            <th>Name</th>
            <th>Description</th>
            <th>Action</th>
        </thead>
        <tr>
            <td>2016 NHL Hockey</td>
            <td>Only tracks the games broadcast on TSN.</td>
            <td>
                <a class="btn btn-primary">Edit</a>
                <a class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <tr>
            <td>2016 Indian Cricket</td>
            <td>The best cricket in Asia, bar none.</td>
            <td>

                <a class="btn btn-primary">Edit</a>
                <a class="btn btn-danger">Delete</a>
            </td>
        </tr>
    </table>
</asp:Content>
