<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs"  MasterPageFile="~/Site.Master" Inherits="GoodFood.OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form>
        <div class="detail-header-css">
            <asp:Label ID="Label1" runat="server" Text="Customer Order History"></asp:Label>
        </div>
        <div class="common-label">
            <asp:Label ID="Label2" runat="server" CssClass="common-box" Text="Customer ID"></asp:Label>
            <asp:DropDownList ID="CustomerID" runat="server" DataSourceID="SqlDataSource1" DataTextField="CUSTOMER_ID" DataValueField="CUSTOMER_ID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;CUSTOMER_ID&quot; FROM &quot;CUSTOMER&quot;"></asp:SqlDataSource>
        </div>
        <div class="buttons-css">
             <asp:Button ID="Search" runat="server" Text="Search" OnClick="Search_Click" />
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        </form>
    </asp:Content>