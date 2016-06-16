<%-- 
    Author's Name: Douglas Brunner
    Student Number: 020087918
    Date Modified: June 15, 2016
    Description: form to create a tracker
    Version History: Initial Commit
    --%>
<%@ Page Title="Create Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTracker.aspx.cs" Inherits="Project_1.CreateTracker" %>
<asp:Content ID="CreateTracker" ContentPlaceHolderID="MainContent" runat="server">
<div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-location-arrow"></span> Create Tracker</h1>
        <h5>All Fields are required</h5>
            <br />
            <div class="form-group">

                <label class="control-label" for="TrackerNameTextBox">Name</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TrackerNameTextBox"
                    placeholder="Tracker Name" required="true" MaxLength="100"></asp:TextBox>

                <label class="control-label" for="DescriptionTextBox">Description</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionTextBox"
                    placeholder="Description" required="true" MaxLength="250"></asp:TextBox>

                <label class="control-label" for="SportsList">Sport</label>
                <asp:DropDownList ID="SportsList" runat="server" CssClass="form-control dropdown-toggle" />

            </div>
            <div class="text-right">
                <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-warning" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                <asp:Button Text="Save" ID="SaveButton" runat="server" CssClass="btn btn-primary" OnClick="SaveButton_Click" />
            </div>
    
    </div>
</asp:Content>
