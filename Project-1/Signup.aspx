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
    
   <%-- <div class="col-sm-6 col-sm-offset-3">
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

    </div> --%>

    <div class="container">
        <div class="row">
            <div class="col-md-offset-4 col-md-4">
                 <div class="alert alert-danger" id="AlertFlash" runat="server" visible="false">
                    <asp:Label runat="server" ID="StatusLabel" />
                </div>
                <h1>Register Page</h1>
                <h5>All Fields are Required</h5>
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h1 class="panel-title"><i class="fa fa-user-plus fa-lg"></i> Register</h1>
                    </div>

                    <div class="panel-body">
                        <div class="form-group">
                            <label class="control-label" for="UserNameTextBox">Username:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="UserNameTextBox" placeholder="Username" required="true" TabIndex="0"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="EmailTextBox">Email:</label>
                            <asp:TextBox runat="server" TextMode="Email" CssClass="form-control" ID="EmailTextBox" placeholder="Email" required="true" TabIndex="0"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="PasswordTextBox">Password:</label>
                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="PasswordTextBox" placeholder="Password" required="true" TabIndex="0"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="ConfirmPasswordTextBox">Confirm Password:</label>
                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="ConfirmPasswordTextBox" placeholder="Confirm Password" required="true" TabIndex="0"></asp:TextBox>
                            <asp:CompareValidator ErrorMessage="Your Passwords Must Match" Type="String" Operator="Equal"  ControlToValidate="ConfirmPasswordTextBox" runat="server"
                                ControlToCompare="PasswordTextBox" CssClass="label label-danger" />
                        </div>

                        <%-- 
                        <div class="form-group">
                            <label class="control-label" for="SecurityQuestionTextBox">Security Question:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="SecurityQuestionTextBox" placeholder="Security Question" required="true" TabIndex="0"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="SecurityAnswerTextBox">Security Question:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="SecurityAnswerTextBox" placeholder="Security Answer" required="true" TabIndex="0"></asp:TextBox>
                        </div>--%>

                        <div class="text-right">
                            <asp:Button Text="Cancel" ID="CancelButton" runat="server" CssClass="btn btn-warning" OnClick="CancelButton_Click" UseSubmitBehavior="false" CausesValidation="false" TabIndex="0" />
                            <asp:Button Text="Register" ID="RegisterButton" runat="server" CssClass="btn btn-primary" OnClick="RegisterButton_Click" TabIndex="0" />
                        </div>

                    </div>
                </div>  
            </div>
        </div>
    </div>

</asp:Content>
