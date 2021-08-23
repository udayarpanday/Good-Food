<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GoodFood._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>GoodFood- Admin Panel</h1>
        <p class="lead">GoodFood, a virtual company, available in web and mobile platforms is opened to provide online food ordering and delivery system.</p>
      
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Choices from various resturants</h2>
             <p>
               <img src="resturant.jpg" style="width:100%" />
            </p>
            <p>
                GoodFood has many restaurants registered into its system. Customers can browse through restaurants or their favourite dishes to check price.
            </p>
        </div>
        <div class="col-md-4">
            <h2>Loyalty Points</h2>
             <p>
               <img src="loyalty.jpg" style="width:100%" />
               
            </p>
            <p>
                There is provision of Loyalty Points associated with selective dishes for selected day or duration. The Loyalty Points gets accommodated over course of time and can be used to get Free Dishes.
            </p>
            
        </div>
        <div class="col-md-4">
            <h2>Deliver at your door step</h2>
             <p>
               <img src="delivery.jpg" style="width:100%" />
            </p>
            <p>
               You can easily order your food using our mobile or web application which uses map to identify delivery address of the customer. 
            </p>
           
           </div>
        </div>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Width="806px" Height="322px" Palette="Chocolate">
                    <series>
                        <asp:Series ChartType="FastPoint" Name="Series1" XValueMember="DISH_NAME" YValueMembers="LOYALTY_POINTS" YValuesPerPoint="2">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT lp.LOYALTY_POINTS, dh.DISH_NAME FROM GOODFOOD.DISH dh INNER JOIN GOODFOOD.LOYALTY lp ON lp.DISH_CODE = dh.DISH_CODE"></asp:SqlDataSource>
                

</asp:Content>
