<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DishSearch.aspx.cs"  MasterPageFile="~/Site.Master"  Inherits="GoodFood.DishSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form>
        <div class="detail-header-css">
            <asp:Label ID="Label1" runat="server" Text="Dish Search"></asp:Label>
        </div>
        <div class="common-label">
            <asp:Label ID="Label2" runat="server" CssClass="common-box" Text="Dish Code"></asp:Label>
            <asp:DropDownList ID="Dish" runat="server" DataSourceID="SqlDataSource1" DataTextField="DISH_CODE" DataValueField="DISH_CODE"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DISH_CODE&quot; FROM &quot;DISH&quot;"></asp:SqlDataSource>
        </div>
        <div class="buttons-css">
             <asp:Button ID="Search" runat="server" Text="Search" OnClick="Search_Click" />
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        </form>
    </asp:Content>