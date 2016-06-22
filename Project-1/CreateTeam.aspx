<%-- 
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 15, 2016
    Description: form to create a team
    Version History: Initial Commit
    --%>
<%@ Page Title="Create Team" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTeam.aspx.cs" Inherits="Project_1.CreateTeams" %>
<asp:Content ID="CreateTeam" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-users"></span> Create Team</h1>
        <div class="form-group">

            <label class="control-label" for="TeamNameTextBox">Name</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="TeamNameTextBox"
                placeholder="Team Name" required="true" MaxLength="20"></asp:TextBox>
            <asp:RequiredFieldValidator ID="nameValidator" runat="server" 
                    ErrorMessage="Please enter a team name" 
                    ControlToValidate="TeamNameTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label class="control-label" for="DescriptionTextBox">Description</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionTextBox"
                placeholder="Description" required="true" MaxLength="200"></asp:TextBox>
            <asp:RequiredFieldValidator ID="descValidator" runat="server" 
                    ErrorMessage="Please enter a team description" 
                    ControlToValidate="DescriptionTextBox"
                    Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="text-right form-group">
            <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-warning" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
            <asp:Button Text="Save" ID="SaveButton" runat="server" CssClass="btn btn-primary" OnClick="SaveButton_Click" />
        </div>

    </div>
</asp:Content>
