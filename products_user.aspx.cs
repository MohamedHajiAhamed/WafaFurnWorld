using Electronic_Kingdom.general;
using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Kingdom
{
    public partial class products_admin : System.Web.UI.Page
    {
        public string connectionstring = connectionString.connection();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            bindproduct();
        }

        private void bindproduct()
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();

                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }


        protected void Page_Init(object sender, EventArgs e)
        {
                foreach (RepeaterItem item in repeater_product.Items)
            {
                Button btn = (Button)item.FindControl("btnAddToCart");
                if (btn != null)
                {
                    string productId = btn.CommandArgument;
                    ClientScript.RegisterForEventValidation(btn.UniqueID, productId);
                }
            }
            
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {

            try
            {
                if(txtbox_search.Text.Trim() != "")
                {
                    SqlConnection connect = new SqlConnection(connectionstring);
                    connect.Open();
                    SqlCommand sp_fetch_product_search = new SqlCommand("sp_fetch_product_search", connect);
                    sp_fetch_product_search.CommandType = CommandType.StoredProcedure;

                    SqlParameter search_text = new SqlParameter("@search_text", SqlDbType.VarChar);
                    sp_fetch_product_search.Parameters.Add(search_text).Value = txtbox_search.Text.Trim();

                    SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count <= 0)
                    {
                        lbl_msg.Visible = true;
                        repeater_product.DataSource = dt;
                        repeater_product.DataBind();
                    }
                    else
                    {
                        lbl_msg.Visible = false;
                        repeater_product.DataSource = dt;
                        repeater_product.DataBind();
                    }


                    connect.Close();
                }
                
                
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_mobile_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "Mobile";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_headphone_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "Headphone";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_laptop_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "Laptop";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_tv_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "TV";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_camera_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "Camera";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_all_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_search_category = new SqlCommand("sp_fetch_product_search_category", connect);
                sp_fetch_product_search_category.CommandType = CommandType.StoredProcedure;

                SqlParameter category = new SqlParameter("@category", SqlDbType.VarChar);
                sp_fetch_product_search_category.Parameters.Add(category).Value = "";

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_search_category);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count <= 0)
                {
                    lbl_msg.Visible = true;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();

                }
                else
                {
                    lbl_msg.Visible = false;
                    repeater_product.DataSource = dt;
                    repeater_product.DataBind();
                }

                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string productId = btn.CommandArgument;

           
            DataTable dt;
            if (Session["CartItems"] != null && Session["CartItems"] is DataTable)
            {

                dt = (DataTable)Session["CartItems"];
            }
            else
            {
                dt = new DataTable();
                dt.Columns.Add("product_id", typeof(string));
            }


            bool productExists = false;
            foreach (DataRow row in dt.Rows)
            {
                if (row["product_id"].ToString() == productId)
                {
                    productExists = true;
                    break;
                }
            }


            if (!productExists)
            {
                DataRow newRow = dt.NewRow();
                newRow["product_id"] = productId;
                dt.Rows.Add(newRow);
            }

            Session["CartItems"] = dt;

            if (!productExists)
            {
                lbl_text.Text = "Product Added to Cart";
                string myScriptValue = "<script>document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
            }
            else
            {
                lbl_text.Text = "Product already exists in the cart";
                string myScriptValue = "<script>document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);

            }


        }
    }
}