<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="BasicWebApp.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="row">
        <h1>Please login</h1>
    </div>

    <div class="row" id="divMessage" runat="server">

    </div>

    <div class="row">

        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="row">
                <label class="col-form-label" itemid="edtUsername">Username</label>
                <br />
                <input class="form-control" type="text" id="edtUsername" runat="server" />
            </div>
            <div class="row">
                <label class="col-form-label" itemid="edtPassword">Password</label>
                <br />
                <input type="password" class="form-control" id="edtPassword" runat="server" />
            </div>
            <div class="row">
                <br />
                <asp:Button CssClass="btn btn-primary" ID="btnLogin" OnClick="btnLogin_Click" runat="server" Text="Login Now" />
            </div>
        </div>
        <div class="col-md-4"></div>

    </div>


</asp:Content>
