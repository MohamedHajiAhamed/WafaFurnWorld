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
    public partial class index_user : System.Web.UI.Page
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
                    bindproduct();
                }
            }

        }
        private void bindproduct()
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_new_product = new SqlCommand("sp_fetch_new_product", connect);
                sp_fetch_new_product.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_new_product);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
    }
}