<%--

    File: Teams.aspx

    Manage the teams registered in the system.

    Author: Douglas Brunner (020087918)
    Modified: 2016-06-08
    History: Initial commit

--%>
<%@ Page Title="Teams" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="Project_1.Teams" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-users"></span> Teams <a href="CreateTeam.aspx" class="btn btn-primary pull-right">Create</a></h1>

    <table class="table table-striped">
        <thead>
            <th>Name</th>
            <th>Description</th>
            <th>Sport</th>
            <th>Action</th>
        </thead>
        <tr>
            <td>Toronto Maple Leafs</td>
            <td>Famous team with high ticket sales and low win rate.</td>
            <td>Hockey</td>
            <td>
                <a class="btn btn-primary">Edit</a>
                <a class="btn btn-danger">Delete</a>
            </td>
        </tr>
    </table>
</asp:Content>
