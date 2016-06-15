<%--

    File: Signup.aspx

    Registers a new site user.

    Author: Douglas Brunner (020087918)
    Modified: 2016-06-13
    History: Initial commit
        -- Added signup form

--%>
<%@ Page Title="Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Project_1.Signup" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-sm-6 col-sm-offset-3">
        <h1><span class="fa fa-user-plus"></span> Login</h1>
    
        <form action="/Signup.aspx" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="text" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password1" required>
            </div>
            <div class="form-group">
                <label>Password (again)</label>
                <input type="password" class="form-control" name="password2" required>
            </div>
            <div class="form-group">
                <label>Security Question</label>
                <input type="text" class="form-control" name="securityQuestion" required>
            </div>
            <div class="form-group">
                <label>Security Answer</label>
                <input type="password" class="form-control" name="answer" required>
            </div>

            <button type="submit" class="btn btn-warning btn-lg">Signup</button>
        </form>

        <hr>

        <p>Already have an account? <a href="/Login.aspx">Login</a></p>

    </div>

</asp:Content>
