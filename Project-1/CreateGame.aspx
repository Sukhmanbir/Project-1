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
            <div class="form-group">
                <label class="control-label" for="DateTextBox">Tracker</label>
                <asp:DropDownList ID="TrackerList" runat="server" CssClass="form-control dropdown-toggle" />
            </div>
            <div class="form-group">
                <label class="control-label" for="GameNameTextBox">Name</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="GameNameTextBox"
                    placeholder="Game Name" required="true" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="nameValidator" runat="server" 
                    ErrorMessage="Please enter a game name" 
                    ControlToValidate="GameNameTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="DescriptionTextBox">Description</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionTextBox"
                    placeholder="Description" required="true" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="descValidator" runat="server" 
                    ErrorMessage="Please enter a game description" 
                    ControlToValidate="DescriptionTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="control-label" for="DateTextBox">Date of Game</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="DateTextBox"
                    placeholder="Date of Game" required="false" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="dateValidator" runat="server" 
                    ErrorMessage="Please enter a date" 
                    ControlToValidate="DateTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator runat="server" 
                     ControlToValidate="DateTextBox" 
                     ValidationExpression="\d{4}-\d{2}-\d{2}"
                     ErrorMessage="Enter date as yyyy-mm-dd" />
            </div>
            <div class="form-group">
                <label class="control-label" for="DateTextBox">Team A</label>
                <asp:DropDownList ID="TeamAList" runat="server" CssClass="form-control dropdown-toggle" />
            </div>
            <div class="form-group">
                <label class="control-label" for="DateTextBox">Team B</label>
                <asp:DropDownList ID="TeamBList" runat="server"  CssClass="form-control dropdown-toggle" />
                <asp:CompareValidator ID="cv" runat="server" ValidationGroup="teams" InitialValue="-1" 
                    ControlToValidate="TeamAList" 
                    ControlToCompare="TeamBList" 
                    Operator="NotEqual" Text="The teams cannot be the same" 
                    Type="String"
                    Display="Dynamic" />
            </div>
            <div class="text-right">
                <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-warning" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                <asp:Button Text="Save" ID="SaveButton" runat="server" CssClass="btn btn-primary" OnClick="SaveButton_Click" />
            </div>

    </div>
</asp:Content>
