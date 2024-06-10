using Electronic_Kingdom.general;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Kingdom
{
    public partial class dashboard_admin : System.Web.UI.Page
    {
        public string connectionstring = connectionString.connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    BindData();
                }
            }
            
        }

        private void BindData()
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_quantity = new SqlCommand("sp_fetch_product_quantity", connect);
                sp_fetch_product_quantity.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_quantity);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                lbl_total_product.Text = dt.Rows[0]["total_product"].ToString();

                SqlCommand sp_count_order_admin = new SqlCommand("sp_count_order_admin", connect);
                sp_count_order_admin.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda1 = new SqlDataAdapter(sp_count_order_admin);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                lbl_total_order.Text = dt1.Rows[0]["total_order"].ToString();
                lbl_processed_order.Text = dt1.Rows[0]["total_order"].ToString();

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
    }
}