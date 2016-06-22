<%-- 
    Author's Name: Sukhmanbir Kaur
    Student Number: 200303856
    Date Modified: June 08, 2016
    Description: shows the details of the trackers
    Version History: Initial Commit
        - implemented wireframe
--%>

<%@ Page Title="Trackers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Trackers.aspx.cs" Inherits="Project_1.Tracker" %>

<asp:Content ID="Trackers" ContentPlaceHolderID="MainContent" runat="server">
    <h1><span class="fa fa-location-arrow"></span> Trackers <a href="CreateTracker.aspx" class="btn btn-primary pull-right">Create</a></h1>

     <asp:GridView runat="server" ID="TrackersGridView" AutoGenerateColumns="false"
                                CssClass="table table-striped table-bordered table-hover"
                                DataKeyNames="tracker_id" OnRowDeleting="TrackersGridView_RowDeleting"
                                AllowSorting="true" OnSorting="TrackersGridView_Sorting" OnRowDataBound="TrackersGridView_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="tracker_id" HeaderText="Tracker ID" Visible="true" SortExpression="tracker_id" />
                        <asp:BoundField DataField="name" ID="nameTextBox" HeaderText="Name" Visible="true" SortExpression="name" />
                        <asp:BoundField DataField="description" HeaderText="Description" Visible="true" SortExpression="description" />
                        
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/CreateTracker.aspx"
                            DataNavigateUrlFields="tracker_id" DataNavigateUrlFormatString="CreateTracker.aspx?tracker_id={0}" 
                            ItemStyle-CssClass="btn btn-primary btn-sm" ControlStyle-ForeColor="White" />

                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true" 
                            ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>

</asp:Content>
