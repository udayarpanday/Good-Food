<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="LoyaltyPoint.aspx.cs" Inherits="GoodFood.LoyaltyPoint" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <form>
        <div  class="detail-header-css">
            <asp:Label ID="Label1" runat="server" Text="Loyalty Points Details"></asp:Label>
        </div>
         <div  class="common-label">
            <asp:Label ID="Label2" runat="server" CssClass="common-box" Text="Dish Code"></asp:Label>
             <asp:DropDownList ID="DishCode" runat="server" DataSourceID="SqlDataSource2" DataTextField="DISH_CODE" DataValueField="DISH_CODE">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DISH_CODE&quot; FROM &quot;DISH&quot;"></asp:SqlDataSource>
        </div>
         <div class="common-label">
            <asp:Label ID="Label3" runat="server" CssClass="common-box" Text="Loyalty Points"></asp:Label>
             <asp:TextBox ID="txtLoyaltyPoints" runat="server"></asp:TextBox>
             
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtLoyaltyPoints"></asp:RequiredFieldValidator>
        
             </div>
        <div class="common-label">
            <asp:Label ID="Label4" CssClass="common-box" runat="server" Text="Loyalty Start Date:"></asp:Label>
               <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
              
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/calendar.png" Height="43px" Width="43px" ImageAlign="AbsBottom" OnClick="CalendarImage2_Click" />
                  
                    <asp:Calendar ID="Calendar2" runat="server" Height="190px" Width="350px" BackColor="White" OnSelectionChanged="Calendar2_SelectionChanged" OnDayRender="Calendar2_DayRender" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                    </div>
               <div class="common-label">   
                    <asp:Label ID="Label5" CssClass="common-box" runat="server" Text="Loyalty End Date :"></asp:Label>
                    <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="CalendarImage" runat="server" ImageUrl="~/calendar.png" Height="43px" Width="43px" ImageAlign="AbsBottom" OnClick="CalendarImage_Click" />
                
                   
                    <asp:Calendar ID="Calendar1" runat="server" Height="190px" Width="350px" BackColor="White" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup='valGroup1' runat="server"  ErrorMessage="Please enter complete details" ForeColor="Red" ControlToValidate="txtEndDate"></asp:RequiredFieldValidator>
                    
        </div>
                   
                <div  class="buttons-css">
                     <asp:Button ID="Insert" ValidationGroup='valGroup1'  runat="server" Text="Insert" OnClick="Insert_Click1"  Width="116px" />
                    <asp:Button ID="Clear" ValidationGroup='valGroup1' causesvalidation="false" runat="server" Text="Clear"  Width="116px" />
                </div>
           
       

        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LOYALTY_CODE" OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" 
                OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." CssClass="table table-condensed table-hover" Class="table table-bordered table-condensed table-responsive table-hover">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="LOYALTY_CODE" HeaderText="LOYALTY_CODE" ReadOnly="True" SortExpression="LOYALTY_CODE" />
                <asp:BoundField DataField="LOYALTY_POINTS" HeaderText="LOYALTY_POINTS" SortExpression="LOYALTY_POINTS" />
                <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
                <asp:BoundField DataField="END_DATE" HeaderText="END_DATE" SortExpression="END_DATE" />
                <asp:BoundField DataField="DISH_CODE" HeaderText="DISH_CODE" SortExpression="DISH_CODE" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LOYALTY&quot; WHERE &quot;LOYALTY_CODE&quot; = ?" InsertCommand="INSERT INTO &quot;LOYALTY&quot; (&quot;LOYALTY_CODE&quot;, &quot;LOYALTY_POINTS&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;DISH_CODE&quot;) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LOYALTY&quot;" UpdateCommand="UPDATE &quot;LOYALTY&quot; SET &quot;LOYALTY_POINTS&quot; = ?, &quot;START_DATE&quot; = ?, &quot;END_DATE&quot; = ?, &quot;DISH_CODE&quot; = ? WHERE &quot;LOYALTY_CODE&quot; = ?">
            <DeleteParameters>
                <asp:Parameter Name="LOYALTY_CODE" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LOYALTY_CODE" Type="Decimal" />
                <asp:Parameter Name="LOYALTY_POINTS" Type="Decimal" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="END_DATE" Type="DateTime" />
                <asp:Parameter Name="DISH_CODE" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LOYALTY_POINTS" Type="Decimal" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="END_DATE" Type="DateTime" />
                <asp:Parameter Name="DISH_CODE" Type="Decimal" />
                <asp:Parameter Name="LOYALTY_CODE" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </asp:Content>