<%-- 
    Author's Name: Sukhmanbir Kaur
    Student Number: 200303856
    Date Modified: June 08, 2016
    Description: shows the details of the games
    Version History: Initial Commit
        -- Implemented wireframe
    --%>

<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="Project_1.Games" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-trophy"></span> Games <a href="CreateGame.aspx" class="btn btn-primary pull-right">Create</a></h1>

    <asp:GridView runat="server" ID="GamesGridView" AutoGenerateColumns="false"
                        CssClass="table table-striped table-bordered table-hover"
                        DataKeyNames="GameID" OnRowDeleting="GamesGridView_RowDeleting"
                        AllowSorting="true" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound">
            <Columns>
                <asp:BoundField DataField="GameID" HeaderText="Game ID" Visible="true" SortExpression="GameID" />
                <asp:BoundField DataField="GameName" HeaderText="Name" Visible="true" SortExpression="GameName" />
                <asp:BoundField DataField="GameDesc" HeaderText="Description" Visible="true" SortExpression="GameDesc" />
                <asp:BoundField DataField="sport_fk" HeaderText="Sport" Visible="true" SortExpression="sport_fk" />
                <asp:BoundField DataField="Num_of_spectators" HeaderText="Spectators" Visible="true" SortExpression="Num_of_spectators" />
                <asp:BoundField DataField="Total_scores" HeaderText="Score" Visible="true" SortExpression="Total_scores" />
                <asp:BoundField DataField="Winning_team" HeaderText="Winner" Visible="true" SortExpression="Winning_team" />
                <asp:BoundField DataField="GameDate" HeaderText="Date" Visible="true" SortExpression="GameDate" />
                        
                <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/CreateGame.aspx"
                    DataNavigateUrlFields="GameID" DataNavigateUrlFormatString="CreateGame.aspx?GameID={0}" 
                    ItemStyle-CssClass="btn btn-primary btn-sm" ControlStyle-ForeColor="White" />

                <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true" 
                    ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
            </Columns>
        </asp:GridView>
</asp:Content>
