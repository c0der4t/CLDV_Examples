<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BootstrapExample.aspx.cs" Inherits="BasicWebApp.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <div class="col-md-4 col-sm-12" style="background-color: red; min-height: 30vh;">
            <p>Column 1</p>
            <div class="row">
                <div class="col-md-6 col-sm-3 col-xs-6" style="background-color: white; ">
                    <p>Sub-Column 1</p>
                </div>
                <div class="col-md-6 col-sm-3 col-xs-6" style="background-color: gray;">
                    <p>Sub-Column 2</p>
                </div>
            </div>
        </div>

        <div class="col-md-4" style="background-color: green">
            <p>Column 2</p>
            <div class="row">
                <div class="col-md-6" style="background-color: white; margin: 5px;">
                    <p>Sub-Column 1</p>
                </div>
                <div class="col-md-6" style="background-color: gray;">
                    <p>Sub-Column 2</p>
                </div>
            </div>
        </div>
        <div class="col-md-4" style="background-color: blue">
            <p>Column 3</p>
            <div class="row">
                <div class="col-md-4" style="background-color: white; margin: 5px;">
                    <p>Sub-Column 1</p>
                </div>
                <div class="col-md-4" style="background-color: gray; margin: 5px;">
                    <p>Sub-Column 2</p>
                </div>
            </div>
        </div>

    </div>


</asp:Content>
