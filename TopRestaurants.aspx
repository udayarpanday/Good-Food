<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="TopRestaurants.aspx.cs" Inherits="GoodFood.TopRestaurants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h2>Top Restaurants</h2>
    <br />
    <asp:Label CssClass="form-label" ID="monthLabel" runat="server" Text="Label"></asp:Label>
    <asp:TextBox CssClass="form-control" ID="monthTextArea" runat="server"></asp:TextBox>
    <br />
    <asp:GridView ID="searchGrid" runat="server" AutoGenerateColumns="True"  OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-condensed table-hover" Class="table table-bordered table-condensed table-responsive table-hover">
        </asp:GridView>

</div>
</asp:Content>