<%--

    File: Teams.aspx

    Manage the teams registered in the system.

    Author: Douglas Brunner (020087918)
    Modified: 2016-06-08
    History: Initial commit

--%>
<%@ Page Title="Teams" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" Inherits="Project_1.Teams" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-users"></span> Teams <a href="/Gametracker/CreateTeam.aspx" class="btn btn-primary pull-right">Create</a></h1>

    <%--<table class="table table-striped">
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
    </table>--%>

    <asp:GridView runat="server" ID="TeamsGridView" AutoGenerateColumns="false"
                                CssClass="table table-striped table-bordered table-hover"
                                DataKeyNames="TeamID" OnRowDeleting="TeamsGridView_RowDeleting"
                                AllowSorting="true" OnSorting="TeamsGridView_Sorting" OnRowDataBound="TeamsGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="TeamID" HeaderText="Team ID" Visible="true" SortExpression="TeamID" />
                        <asp:BoundField DataField="TeamName" HeaderText="Name" Visible="true" SortExpression="TeamName" />
                        <asp:BoundField DataField="TeamDesc" HeaderText="Description" Visible="true" SortExpression="TeamDesc" />
                        
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/Gametracker/CreateTeam.aspx"
                            DataNavigateUrlFields="TeamID" DataNavigateUrlFormatString="CreateTeam.aspx?TeamID={0}" 
                            ItemStyle-CssClass="btn btn-primary btn-sm" ControlStyle-ForeColor="White" />

                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true" 
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
</asp:Content>
