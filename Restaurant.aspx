<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Restaurant.aspx.cs" Inherits="GoodFood.Restaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form >
        <div class="detail-header-css">
            <asp:Label ID="Label1" runat="server" Text="Resturant Details"></asp:Label>
        </div>
        <div class="common-label">
            <asp:Label ID="Label2" CssClass="common-box" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtRestaurantName" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtRestaurantName"></asp:RequiredFieldValidator>
        </div>
        <div  class="common-label">
            <asp:Label ID="Label3" CssClass="common-box" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="txtRestaurantAddress" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtRestaurantAddress"></asp:RequiredFieldValidator>

        </div>
        <div class="common-label">
            <asp:Label ID="Label4" CssClass="common-box"  runat="server" Text="Contact Number"></asp:Label>
            <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup='valGroup1' runat="server" ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtContactNumber"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator runat="server" ErrorMessage="Please check the phone number entered" ControlToValidate="txtContactNumber" ForeColor="Red" ValidationExpression="^(\+?[0-9]{2,}[- ]?[0-9]{2,})$"></asp:RegularExpressionValidator>
       </div>
        <div  class="buttons-css">
            <asp:Button ID="Insert" ValidationGroup='valGroup1' runat="server" Text="Insert" OnClick="Insert_Click1" />
            <asp:Button ID="Clear" ValidationGroup='valGroup1' causesvalidation="false"  runat="server" Text="Clear" />
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RESTURANT_CODE" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
                OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-condensed table-hover" Class="table table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="RESTURANT_CODE" HeaderText="RESTURANT_CODE" ReadOnly="True" SortExpression="RESTURANT_CODE" />
                <asp:BoundField DataField="RESTURANT_NAME" HeaderText="RESTURANT_NAME" SortExpression="RESTURANT_NAME" />
                <asp:BoundField DataField="RESTURANT_ADDRESS" HeaderText="RESTURANT_ADDRESS" SortExpression="RESTURANT_ADDRESS" />
                <asp:BoundField DataField="CONTACT_NUMBER" HeaderText="CONTACT_NUMBER" SortExpression="CONTACT_NUMBER" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;RESTAURANT&quot; WHERE &quot;RESTURANT_CODE&quot; = ?" InsertCommand="INSERT INTO &quot;RESTAURANT&quot; (&quot;RESTURANT_CODE&quot;, &quot;RESTURANT_NAME&quot;, &quot;RESTURANT_ADDRESS&quot;, &quot;CONTACT_NUMBER&quot;) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;RESTAURANT&quot;" UpdateCommand="UPDATE &quot;RESTAURANT&quot; SET &quot;RESTURANT_NAME&quot; = ?, &quot;RESTURANT_ADDRESS&quot; = ?, &quot;CONTACT_NUMBER&quot; = ? WHERE &quot;RESTURANT_CODE&quot; = ?">
            <DeleteParameters>
                <asp:Parameter Name="RESTURANT_CODE" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RESTURANT_CODE" Type="Decimal" />
                <asp:Parameter Name="RESTURANT_NAME" Type="String" />
                <asp:Parameter Name="RESTURANT_ADDRESS" Type="String" />
                <asp:Parameter Name="CONTACT_NUMBER" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RESTURANT_NAME" Type="String" />
                <asp:Parameter Name="RESTURANT_ADDRESS" Type="String" />
                <asp:Parameter Name="CONTACT_NUMBER" Type="Decimal" />
                <asp:Parameter Name="RESTURANT_CODE" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

    </asp:Content>