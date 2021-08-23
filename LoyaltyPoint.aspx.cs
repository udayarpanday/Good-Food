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
    public partial class LoyaltyPoint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                this.BindGrid();
            }

        }

        protected void Insert_Click1(object sender, EventArgs e)
        {
            int l_point = Convert.ToInt32(txtLoyaltyPoints.Text.ToString());
            string l_sdate = txtStartDate.Text.ToString();
            string l_endate = txtEndDate.Text.ToString();
          

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand($"INSERT INTO LOYALTY VALUES(loyalty_code.nextval,{l_point},TO_DATE('{l_sdate}','dd/MM/yyyy HH24:MI:SS'),TO_DATE('{l_endate}','dd/MM/yyyy HH24:MI:SS'))"))
                {

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();



                }

            }


            this.BindGrid();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtLoyaltyPoints.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";

        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OracleCommand cmd = new OracleCommand();
            OracleConnection con = new OracleConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM loyalty";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("loyalty");

            using (OracleDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }

            con.Close();

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }



        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int l_id = Int32.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
            int l_point = Int32.Parse((row.Cells[2].Controls[0] as TextBox).Text.ToString());
            string l_start_date = (row.Cells[3].Controls[0] as TextBox).Text.ToString();
            string l_end_date = (row.Cells[4].Controls[0] as TextBox).Text.ToString();
            
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand($"update loyalty set loyalty_points ={l_point},start_date = TO_DATE('{l_start_date}','dd/MM/yyyy HH24:MI:SS'),end_date = TO_DATE('{l_end_date}','dd/MM/yyyy HH24:MI:SS') where loyalty_code = {l_id}"))
                {

                    cmd.Connection = con;
                    con.Open();

                    cmd.ExecuteNonQuery();
                    con.Close();


                }
            }

            GridView1.EditIndex = -1;
            this.BindGrid();
        }


        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.BindGrid();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int l_id = Int32.Parse(GridView1.DataKeys[e.RowIndex].Values[0].ToString());
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OracleConnection con = new OracleConnection(constr))
            {
                using (OracleCommand cmd = new OracleCommand($"DELETE FROM LOYALTY WHERE LOYALTY_Code ='{l_id}'"))
                {

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }

        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }

        protected void CalendarImage_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
            //Calendar1.Attributes.Add("style", "position:absolute");

        }
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            Calendar1.Visible = false;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Brown;
            }
        }



        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
            Calendar2.Visible = false;
        }

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Brown;
            }
        }

        protected void CalendarImage2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
            {
                Calendar2.Visible = true;
            }
        }
    }

}