using Electronic_Kingdom.general;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Electronic_Kingdom
{
    public partial class cart_user : System.Web.UI.Page
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
                    bindData();

                }
        }
    }

        private void bindData()
        {
            try
            {

                gridview1.DataSource = Session["CartItems"];
            gridview1.DataBind();


            DataTable allProductDetails = new DataTable();

            for (int i = 0; i < gridview1.Rows.Count; i++)
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                try
                {
                    SqlCommand sp_fetch_product_id = new SqlCommand("sp_fetch_product_id", connect);
                    sp_fetch_product_id.CommandType = CommandType.StoredProcedure;

                    string productId = gridview1.Rows[i].Cells[0].Text;

                    SqlParameter product_id = new SqlParameter("@product_id", SqlDbType.VarChar);
                    sp_fetch_product_id.Parameters.Add(product_id).Value = productId;

                    SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_id);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    allProductDetails.Merge(dt);

                }
                finally
                {
                    connect.Close();
                    connect.Dispose();
                }
            }
            repeater_product.DataSource = allProductDetails;
            repeater_product.DataBind();

            GridView2.DataSource = allProductDetails;
            GridView2.DataBind();

            decimal totalCost = 0;
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (row.Cells[4].Text != "&nbsp;")
                    {
                        totalCost += Convert.ToDecimal(row.Cells[4].Text);
                    }
                }
            }
            lbl_cart_total.Text = totalCost.ToString();
            decimal total = totalCost + 53;
            lbl_total.Text = total.ToString();
            if (gridview1.Rows.Count <= 0)
            {
                lbl_msg.Visible = true;
            }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void txtbox_quantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                decimal totalCost = 0;

                foreach (RepeaterItem item in repeater_product.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        Label lbl_product_cost = (Label)item.FindControl("lbl_product_cost");
                        DropDownList txtbox_quantity = (DropDownList)item.FindControl("txtbox_quantity");

                        decimal productPrice = Convert.ToDecimal(lbl_product_cost.Text);
                        int quantity = Convert.ToInt32(txtbox_quantity.SelectedValue);

                        decimal productTotal = productPrice * quantity;

                        totalCost += productTotal;
                    }
                }

                lbl_cart_total.Text = totalCost.ToString();

                decimal finalTotal = totalCost + 53;
                lbl_total.Text = finalTotal.ToString();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            try
            {

                LinkButton btn_delete = (LinkButton)sender;
            RepeaterItem item = (RepeaterItem)btn_delete.NamingContainer;
            Label lbl_product_id = (Label)item.FindControl("lbl_id");
            string productId = lbl_product_id.Text;

            DataTable cartItems = (DataTable)Session["CartItems"];
            if (cartItems != null)
            {
                DataRow[] rowsToDelete = cartItems.Select($"product_id = '{productId}'");
                foreach (DataRow row in rowsToDelete)
                {
                    cartItems.Rows.Remove(row);
                }
                Session["CartItems"] = cartItems;
            }
            bindData();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_place_order_Click(object sender, EventArgs e)
        {
            try
            {
                string orderDate = DateTime.Now.ToString("dd-MM-yyyy");


                List<RepeaterItem> itemsCopy = new List<RepeaterItem>();
                foreach (RepeaterItem item in repeater_product.Items)
                {
                    itemsCopy.Add(item);
                }

                foreach (RepeaterItem item in itemsCopy)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        Label lbl_product_id = (Label)item.FindControl("lbl_id");
                        DropDownList txtbox_quantity = (DropDownList)item.FindControl("txtbox_quantity");

                        int productId = Convert.ToInt32(lbl_product_id.Text);
                        int quantity = Convert.ToInt32(txtbox_quantity.SelectedValue);
                        int userId = Convert.ToInt32(Session["user_id"]);

                        SqlConnection connect = new SqlConnection(connectionstring);
                        connect.Open();
                        SqlCommand sp_insert_user = new SqlCommand("sp_insert_order", connect);
                        sp_insert_user.CommandType = CommandType.StoredProcedure;

                        SqlParameter product_id = new SqlParameter("@product_id", SqlDbType.Int);
                        sp_insert_user.Parameters.Add(product_id).Value = productId;
                        SqlParameter quantitypara = new SqlParameter("@quantity", SqlDbType.Int);
                        sp_insert_user.Parameters.Add(quantitypara).Value = quantity;
                        SqlParameter user_id = new SqlParameter("@user_id", SqlDbType.Int);
                        sp_insert_user.Parameters.Add(user_id).Value = userId;
                        SqlParameter order_date = new SqlParameter("@order_date", SqlDbType.Date);
                        sp_insert_user.Parameters.Add(order_date).Value = orderDate;

                        int i = sp_insert_user.ExecuteNonQuery();
                        if (i > 0)
                        {
                            lbl_text.Text = "Order Placed Successfully";
                            string myScriptValue = "<script>document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show');</script>";
                            ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);

                            Session["CartItems"] = null;
                            bindData();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
    }
}