<%--

    File: ResetPassword.aspx

    Resets the users password.

    Author: Douglas Brunner (020087918)
    Modified: 2016-06-08
    History: Initial commit

--%>
<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Project_1.ResetPassword" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-user-secret"></span> Reset Password</h1>
        <form action="/ResetPassword.aspx" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="text" required>
            </div>
            <div class="form-group">
                <label>Security Question</label>
                <select class="form-control">
                    <option>What is your mother's maiden name?</option>
                </select>
            </div>
            <div class="form-group">
                <label>Security Answer</label>
                <input type="text" class="form-control" name="answer" required>
            </div>
            <button type="submit" class="btn btn-primary btn-lg">Reset</button>
            <a href="Login.aspx" class="btn btn-warning btn-lg">Cancel</a>
        </form>

    </div>
</asp:Content>
