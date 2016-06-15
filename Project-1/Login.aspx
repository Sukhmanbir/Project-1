<%--

    File: Login.aspx

    Creates a new session for registered users.

    Author: Douglas Brunner (020087918)
    Modified: 2016-06-08
    History: Initial commit

--%>
<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_1.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-sign-in"></span> Login</h1>
        <form action="/Login.aspx" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="text" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <button type="submit" class="btn btn-warning btn-lg">Login</button>
        </form>

        <hr>

        <p>Need an account? <a href="/Signup.aspx">Signup</a></p>
        <p>Forgot your password? <a href="/ResetPassword.aspx">Reset Password</a></p>

    </div>
</asp:Content>
