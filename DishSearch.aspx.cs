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
    public partial class DishSearch : System.Web.UI.Page
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
            cmd.CommandText = @"SELECT res.resturant_name, res.resturant_address, 
                                res.contact_number as restaurant_contact, rd.dish_rate as Price
                                FROM DISH dh
                                INNER JOIN RESTAURANT_DISH rd
                                on dh.dish_code = rd.dish_code
                                INNER JOIN RESTAURANT res
                                on rd.resturant_code = res.resturant_code";

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
            string dish = Dish.SelectedValue.ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT res.resturant_name, res.resturant_address, 
                                res.contact_number as restaurant_contact, rd.dish_rate as Price
                                FROM DISH dh
                                INNER JOIN RESTAURANT_DISH rd
                                on dh.dish_code = rd.dish_code
                                INNER JOIN RESTAURANT res
                                on rd.resturant_code = res.resturant_code
                                WHERE dh.dish_code = " + dish + " ";

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