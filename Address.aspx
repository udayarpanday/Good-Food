<%@ Page Title="Address Details" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="GoodFood.Address" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form>
        <div class="detail-header-css">
            <asp:Label ID="Label1" runat="server" Text="Address Detail"></asp:Label>
        </div>
         <div class="common-label">
            <asp:Label ID="Label2" CssClass="common-box" runat="server" Text="Customer ID"></asp:Label>
             <asp:DropDownList ID="CustomerID" runat="server" DataSourceID="SqlDataSource1" DataTextField="CUSTOMER_ID" DataValueField="CUSTOMER_ID">
             </asp:DropDownList>
        </div>
         <div class="common-label">
            <asp:Label ID="Label3" CssClass="common-box" runat="server" Text="Longitude"></asp:Label>
            <asp:TextBox ID="txtLongitude" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtLongitude"></asp:RequiredFieldValidator>
        </div>
         <div class="common-label">
            <asp:Label ID="Label4" CssClass="common-box" runat="server" Text="Latitude"></asp:Label>
            <asp:TextBox ID="txtLatitude" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtLatitude"></asp:RequiredFieldValidator>
             <br />
        </div>
         <div class="buttons-css">
                 <asp:Button ID="Insert" ValidationGroup='valGroup1'  runat="server" OnClick="Insert_Click" Text="Insert"  Width="116px" />
                 <asp:Button ID="Clear" ValidationGroup='valGroup1' causesvalidation="false" runat="server" Text="Clear" OnClick="Clear_Click1" Width="116px" />
             </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ADDRESS_ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
                OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."  CssClass="table table-condensed table-hover" Class="table table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                <asp:BoundField DataField="LONGITUDE" HeaderText="LONGITUDE" SortExpression="LONGITUDE" />
                <asp:BoundField DataField="LATITUDE" HeaderText="LATITUDE" SortExpression="LATITUDE" />
                <asp:BoundField DataField="CUSTOMER_ID" HeaderText="CUSTOMER_ID" SortExpression="CUSTOMER_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;CUSTOMER_ID&quot; FROM &quot;CUSTOMER&quot;">
        </asp:SqlDataSource>
    </form>
    </asp:Content>
