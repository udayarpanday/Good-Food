<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="Dish.aspx.cs" Inherits="GoodFood.Dish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form>
        <div class="detail-header-css">
            <asp:Label ID="lbl" runat="server" Text="Dish Details"></asp:Label> 
        </div>
         
         <div class="common-label">
            <asp:Label ID="lblDish" CssClass="common-box" runat="server" Text="Dish Name"></asp:Label>
            <asp:TextBox ID="txtDish" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtDish"></asp:RequiredFieldValidator>
        </div>
         <div class="common-label">
            <asp:Label ID="lblLocalName" CssClass="common-box" runat="server" Text="Local Name"></asp:Label>
            <asp:TextBox ID="txtLocalName" runat="server"></asp:TextBox>
        </div>
         <div class="buttons-css">
             <asp:Button ID="Insert" ValidationGroup='valGroup1'   runat="server" Text="Insert" OnClick="Insert_Click" />
             <asp:Button ID="Clear" ValidationGroup='valGroup1' causesvalidation="false"  runat="server" Text="Clear" OnClick="Clear_Click1" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DISH_CODE" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
                OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-condensed table-hover" Class="table table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="DISH_CODE" HeaderText="DISH CODE" ReadOnly="True" SortExpression="DISH_CODE" />
                <asp:BoundField DataField="DISH_NAME" HeaderText="DISH NAME" SortExpression="DISH_NAME" />
                <asp:BoundField DataField="LOCAL_NAME" HeaderText="LOCAL NAME" SortExpression="LOCAL_NAME" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DISH&quot; WHERE &quot;DISH_CODE&quot; = ?" InsertCommand="INSERT INTO &quot;DISH&quot; (&quot;DISH_CODE&quot;, &quot;DISH_NAME&quot;, &quot;LOCAL_NAME&quot;) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DISH&quot;" UpdateCommand="UPDATE &quot;DISH&quot; SET &quot;DISH_NAME&quot; = ?, &quot;LOCAL_NAME&quot; = ? WHERE &quot;DISH_CODE&quot; = ?">
            <DeleteParameters>
                <asp:Parameter Name="DISH_CODE" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DISH_CODE" Type="Decimal" />
                <asp:Parameter Name="DISH_NAME" Type="String" />
                <asp:Parameter Name="LOCAL_NAME" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DISH_NAME" Type="String" />
                <asp:Parameter Name="LOCAL_NAME" Type="String" />
                <asp:Parameter Name="DISH_CODE" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </asp:Content>