using Electronic_Kingdom.general;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Electronic_Kingdom
{
    public partial class customer : System.Web.UI.Page
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
                    Refresh();
                }
            }
            
        }
        
        private void Refresh()
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product = new SqlCommand("sp_fetch_product", connect);
                sp_fetch_product.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
        protected void LinkButton_select_Click(object sender, EventArgs e)
        {
            int rowind = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

            string product_id = GridView1.Rows[rowind].Cells[1].Text;
            Response.Redirect("edit_product.aspx?id=" + product_id);
            
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_search_product = new SqlCommand("sp_search_product", connect);
                sp_search_product.CommandType = CommandType.StoredProcedure;

                SqlParameter product_name = new SqlParameter("@product_name", SqlDbType.VarChar);
                sp_search_product.Parameters.Add(product_name).Value = txtbox_product_name.Text.Trim();

                SqlParameter product_id = new SqlParameter("@product_id", SqlDbType.VarChar);
                sp_search_product.Parameters.Add(product_id).Value = txtbox_product_name.Text.Trim();

                SqlDataAdapter sda = new SqlDataAdapter(sp_search_product);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                GridView1.DataSource = null;

                GridView1.DataSource = dt;
                GridView1.DataBind();
                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
    }
}