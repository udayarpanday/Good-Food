using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GoodFood
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"select cus.name as customer_name, dh.dish_code,dh.dish_name,od.line_total,od.unit_total,
                                res.resturant_name as restaurant, ad.longitude as Longitude, ad.latitude as Latitude 
                                from order_details od inner join dish dh 
                                on od.dish_code=dh.dish_code
                                inner join orders os
                                on od.order_number=os.order_number
                                INNER JOIN CUSTOMER cus
                                ON os.customer_id = cus.customer_id
                                INNER JOIN address ad
                                ON os.address_id = ad.address_id
                                INNER JOIN RESTAURANT res
                                ON res.resturant_code = od.resturant_code";

            cmd.CommandType = CommandType.Text;

            DataTable dt = new DataTable();

            using (OracleDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }

            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string Cus_ID = CustomerID.SelectedValue.ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"select cus.name as customer_name, dh.dish_code,dh.dish_name,od.line_total,od.unit_total,
                                res.resturant_name as restaurant, ad.longitude as Longitude, ad.latitude as Latitude 
                                from order_details od inner join dish dh 
                                on od.dish_code=dh.dish_code
                                inner join orders os
                                on od.order_number=os.order_number
                                INNER JOIN CUSTOMER cus
                                ON os.customer_id = cus.customer_id
                                INNER JOIN address ad
                                ON os.address_id = ad.address_id
                                INNER JOIN RESTAURANT res
                                ON res.resturant_code = od.resturant_code
                                WHERE cus.customer_id = " + Cus_ID + " ";

            cmd.CommandType = CommandType.Text;

            DataTable dt = new DataTable();

            using (OracleDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }

            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}