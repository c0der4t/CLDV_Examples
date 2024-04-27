<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SQL.aspx.cs" Inherits="BasicWebApp.SQL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4 col-sm-0"></div>
        <div class="col-md-4 col-sm-12">
            <label itemid="edtDBName">Table Name</label>
            <asp:TextBox runat="server" ID="edtDBName" />
            <asp:Button runat="server" ID="btnCreateTable" Text="CreateTable" OnClick="btnCreateTable_Click"/>
        </div>
        <div class="col-md-4 col-sm-0"></div>
    </div>

    <div class="row">

        <div class="col-md-6 col-sm-12 align-content-center">
            <div class="col-md-12">
                <label class="col-form-label" itemid="edtRowName">Row Name</label>
                <input type="text" class="form-control" id="edtRowName" runat="server" />
                <br />
                <asp:Button runat="server" class="btn btn-dark col-md-12" Text="Add Row" ID="btnAddRow" OnClick="btnAddRow_Click"></asp:Button>
            </div>
        </div>

        <div class="col-md-6 col-sm-12 align-content-center">
            <label class="col-form-label" itemid="edtRowName">Row Name to Retrieve</label>
            <input type="text" class="form-control" id="edtRowToGet" runat="server"/>
            <br />
            <asp:Button runat="server" class="btn btn-dark col-md-12" Text="Get Row" ID="btnGetRow" OnClick="btnGetRow_Click"></asp:Button>
        </div>
    </div>

    <br />

    <div class="row">
         <textarea class="col-md-12" id="redtOutput" runat="server"></textarea>
    </div>

</asp:Content>
