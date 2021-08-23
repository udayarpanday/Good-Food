<%@ Page Title="Customer Details" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Customer.aspx.cs" Inherits="GoodFood.Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


   
        <div class="detail-header-css">
            <asp:Label ID="lblheading"  runat="server" Text="Customer Details"></asp:Label>
        </div>
         <div class="common-label">
            <asp:Label ID="lblName" CssClass="common-box" runat="server" Text="Name"></asp:Label>            
            <asp:TextBox ID="txtName" runat="server" Height="30px" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup='valGroup1'  runat="server" ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtName"></asp:RequiredFieldValidator>
        </div>
         <div  class="common-label">
            <asp:Label ID="lblPhoneNumber"  CssClass="common-box" runat="server" Text="Phone Number"></asp:Label>
             <asp:TextBox ID="txtPhoneNumber" runat="server" Height="30px" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup='valGroup1'  runat="server" ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator runat="server" ErrorMessage="Please check the phone number entered" ControlToValidate="txtPhoneNumber" ForeColor="Red" ValidationExpression="^(\+?[0-9]{2,}[- ]?[0-9]{2,})$"></asp:RegularExpressionValidator>
            </div>
    
         <div class="common-label">
            <asp:Label ID="lblEmail" CssClass="common-box" runat="server" Text="Email"></asp:Label>
             <asp:TextBox ID="txtEmail" runat="server" Height="30px" Width="180px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ValidationGroup='valGroup1'  runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="validateEmail" runat="server" ErrorMessage="Invalid email." ControlToValidate="txtEmail" ValidationExpression="^([\w.-]+)@([\w-]+)((.(\w){2,3})+)$" />
          </div>
          <div class="common-label">
            <asp:Label ID="lblLoyalty" CssClass="common-box" runat="server" Text="Point Earned"></asp:Label>
             <asp:TextBox ID="txtPointEarned" runat="server" Height="30px" Width="180px"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup='valGroup1'  runat="server" ErrorMessage="Please enter customer loyalty points" ForeColor="Red" ControlToValidate="txtPointEarned"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator runat="server" ErrorMessage="Enter points earned" ControlToValidate="txtPointEarned" ForeColor="Red" ValidationExpression="[0-9].?[0-9]"></asp:RegularExpressionValidator>
          </div>
           <div class="buttons-css">
               <asp:Button ID="Insert" runat="server"  ValidationGroup='valGroup1' Text="Save" OnClick="Insert_Click" Width="116px" />
             <asp:Button ID="Clear" runat="server" ValidationGroup='valGroup1' causesvalidation="false" Text="Clear" OnClick="Clear_Click"  Width="116px" />
           </div>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CUSTOMER_ID" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
                OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-condensed table-hover" Class="table table-bordered table-condensed table-responsive table-hover">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="CUSTOMER_ID" HeaderText="ID" ReadOnly="True" SortExpression="CUSTOMER_ID" />
                     <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                     <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE NUMBER" SortExpression="PHONE_NUMBER" />
                     <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL ADDRESS" SortExpression="EMAIL_ADDRESS" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;CUSTOMER&quot; WHERE &quot;CUSTOMER_ID&quot; = ?" InsertCommand="INSERT INTO &quot;CUSTOMER&quot; (&quot;CUSTOMER_ID&quot;, &quot;NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL_ADDRESS&quot;) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMER&quot;" UpdateCommand="UPDATE &quot;CUSTOMER&quot; SET &quot;NAME&quot; = ?, &quot;PHONE_NUMBER&quot; = ?, &quot;EMAIL_ADDRESS&quot; = ? WHERE &quot;CUSTOMER_ID&quot; = ?">
                 <DeleteParameters>
                     <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
                     <asp:Parameter Name="NAME" Type="String" />
                     <asp:Parameter Name="PHONE_NUMBER" Type="Decimal" />
                     <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="NAME" Type="String" />
                     <asp:Parameter Name="PHONE_NUMBER" Type="Decimal" />
                     <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                     <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        
</asp:Content>
