<%--

    File: Login.aspx

    Creates a new session for registered users.

    Author: Douglas Brunner (020087918)
    Modified: 2016-06-08
    History: Initial commit

--%>
<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_1.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div class="col-sm-6 col-sm-offset-3">
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

    </div>--%>

    <div class="container">    

        <div class="row">

            <div class="col-md-offset-4 col-md-4">
                <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">
                    <asp:Label runat="server" ID="StatusLabel" />
                </div>

                <h1>Login Page</h1>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title"><i class="fa fa-sign-in fa-lg"></i> Login</h1>
                    </div> 

                    <br />

                    <div class="panel-body">

                        <div class="form-group">
                            <label class="control-label" for="UserNameTextBox">Username:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="PasswordTextBox">Password:</label>
                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                        </div>

                        <div class="text-right">
                            <asp:Button Text="Login" ID="LoginButton" runat="server" CssClass="btn btn-primary" OnClick="LoginButton_Click" TabIndex="0" />
                        </div>

                    </div>                
                </div>
            </div>
        </div>
    </div>

</asp:Content>
