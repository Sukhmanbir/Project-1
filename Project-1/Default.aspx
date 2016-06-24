<%--

    File: Default.aspx

    Homepage for the game tracker.

    Author: Douglas Brunner (020087918)
    History: Initial commit
    Modified: 2016-06-13
        - Implemented wireframe
        - Showed weekly dates as selected by user
        - Added validation to date textbox
--%>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dash-header" class="row">
        <div class="col-xs-12 col-md-6">
            <h1>Game Results</h1>
        </div>
        <div class="col-xs-12 col-md-6 trackers">
            <label for="trackers">Tracker:</label>
            <asp:DropDownList ID="TrackerList" runat="server" AutoPostBack="true" CssClass="form-control dropdown-toggle" />
        </div>
    </div>
    <div id="gameList" class="row">
        <div class="col-xs-12 text-center">            
            <ul class="list-inline slimList">
                <li>
                    <p id="dateMinus3" runat="server"></p>
                </li>
                <li>
                    <p id="dateMinus2" runat="server"></p>
                </li>
                <li>
                    <p id="dateMinus1" runat="server"></p>
                </li>
                <li class="today">
                    <p>Selected Date</p>
                    <asp:TextBox runat="server" CssClass="form-control" id="gameDateText" placeholder="yyyy-mm-dd" required="true" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="dateValidator" runat="server" 
                        ErrorMessage="Please enter a date" 
                        ControlToValidate="gameDateText"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator runat="server" 
                         ControlToValidate="gameDateText" 
                         ValidationExpression="\d{4}-\d{2}-\d{2}"
                         ErrorMessage="Enter date as yyyy-mm-dd" />
                    <asp:Button runat="server" CssClass="btn btn-primary" Text="GO" CausesValidation="true" ></asp:Button>
                </li>
                <li>
                    <p id="datePlus1" runat="server"></p>
                </li>
                <li>
                    <p id="datePlus2" runat="server"></p>
                </li>
                <li>
                    <p id="datePlus3" runat="server"></p>
                </li>
            </ul>
        </div>
    </div>
    <div id="gameResults" class="row">
        <div class="col-xs-12">

        </div>
    </div>
</asp:Content>
