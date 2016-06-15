<%--

    File: Default.aspx

    Homepage for the game tracker.

    Author: Douglas Brunner (020087918)
    History: Initial commit
    Modified: 2016-06-13
        - Implemented wireframe

--%>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_1.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="dash-header" class="row">
        <div class="col-xs-12 col-md-6">
            <h1>Game Results</h1>
        </div>
        <div class="col-xs-12 col-md-6 trackers">
            <label for="trackers">Tracker:</label>
            <select id="trackers" class="form-control">
                <option>NHL Hockey</option>
                <option>Indian Cricket</option>
            </select>
        </div>
    </div>
    <div id="gameList" class="row">
        <div class="col-xs-12 text-center">
            <ul class="list-inline slimList">
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li class="today">
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
                <li>
                    <p><strong>2016.09.23</strong></p>
                    <a class="game btn btn-primary">&nbsp;</a>
                </li>
            </ul>
        </div>
    </div>
    <div id="gameResults" class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <h4>Toronto Maple Leafs vs Ottawa Senators</h4>
                    <p class="desc">Lorem ipsum dolor sit amet, per intellegam conclusionemque id, facilisi conceptam voluptatibus cu has.</p>
                    <ul class="list-inline slimList">
                        <li><strong>Score:</strong> (7) 4 to 3 for Toronto Maple Leafs</li>
                        <li><strong>Spectators:</strong> 13,754</li>
                        <li><strong>Date: 2016.09.27</strong></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-6">
                    <h4>Calgary Flames vs Boston Bruins</h4>
                    <p class="desc">Sit ea congue rationibus dissentiunt. An sea autem dolores voluptatum. Minim omnes adipisci ei nec, augue sapientem reprehendunt nam eu. Ei elit utinam has, eos nemore detracto assueverit ad.</p>
                    <ul class="list-inline slimList">
                        <li><strong>Score:</strong> (7) 4 to 3 for Toronto Maple Leafs</li>
                        <li><strong>Spectators:</strong> 13,754</li>
                        <li><strong>Date: 2016.09.24</strong></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <h4>Las Angles Kings vs New York Rangers</h4>
                    <p class="desc">Ne accusamus dignissim scripserit vix.</p>
                    <ul class="list-inline slimList">
                        <li><strong>Score:</strong> (7) 4 to 3 for Toronto Maple Leafs</li>
                        <li><strong>Spectators:</strong> 13,754</li>
                        <li><strong>Date: 2016.09.22</strong></li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-6">
                    <h4>Vancouver Canuks vs Montreal Canadians</h4>
                    <p class="desc">
Sed utamur nonumes facilis ne. Ut duo ludus graece. Pri mucius maluisset expetendis an, ex nec audire invenire intellegat, nonumy quaerendum usu ea. Omnium aliquando appellantur eos ut, duo no reprimique scripserit, ad utinam electram intellegat pro</p>
                    <ul class="list-inline slimList">
                        <li><strong>Score:</strong> (7) 4 to 3 for Toronto Maple Leafs</li>
                        <li><strong>Spectators:</strong> 13,754</li>
                        <li><strong>Date: 2016.09.21</strong></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
