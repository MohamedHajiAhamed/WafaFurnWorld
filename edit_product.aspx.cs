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
    public partial class edit_product : System.Web.UI.Page
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
                    string[] Mobile = { "Redmi", "Samsung", "Apple", "IQOO", "Realme", "OnePlus" };
                    txtbox_product_sub_categories.DataSource = Mobile;
                    txtbox_product_sub_categories.DataBind();
                }
            }
            
        }

        private void BindData()
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_product_id = new SqlCommand("sp_fetch_product_id", connect);
                sp_fetch_product_id.CommandType = CommandType.StoredProcedure;

                lbl_id.Text = Request.QueryString["id"];

                SqlParameter product_id = new SqlParameter("@product_id", SqlDbType.VarChar);
                sp_fetch_product_id.Parameters.Add(product_id).Value = lbl_id.Text;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_id);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                txtbox_product_name.Text = dt.Rows[0]["product_name"].ToString();
                txtbox_product_categories.Text = dt.Rows[0]["product_categories"].ToString();
                txtbox_product_sub_categories.Text = dt.Rows[0]["product_sub_categories"].ToString();
                txtbox_price.Text = dt.Rows[0]["price"].ToString();
                txtbox_quantity.Text = dt.Rows[0]["quantity"].ToString();
                txtbox_product_description.Text = dt.Rows[0]["product_description"].ToString();

                string folder = dt.Rows[0]["product_name"].ToString();
                string image1 = dt.Rows[0]["product_image1"].ToString();
                string image2 = dt.Rows[0]["product_image2"].ToString();
                string image3 = dt.Rows[0]["product_image3"].ToString();

                // Set the src attribute of the Image control
                product_image1.ImageUrl = "~/images/Product_image/" + folder + "/" + image1;
                product_image2.ImageUrl = "~/images/Product_image/" + folder + "/" + image2;
                product_image3.ImageUrl = "~/images/Product_image/" + folder + "/" + image3;



                connect.Close();
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

                SqlConnection connect = new SqlConnection(connectionstring);
            connect.Open();
            SqlCommand sp_delete_product = new SqlCommand("sp_delete_product", connect);
            sp_delete_product.CommandType = CommandType.StoredProcedure;


            SqlParameter product_id = new SqlParameter("@product_id", SqlDbType.VarChar);
            sp_delete_product.Parameters.Add(product_id).Value = lbl_id.Text;



            int i = sp_delete_product.ExecuteNonQuery();
            if (i > 0)
            {
                lbl_txt.Text = "Product Deleted Successfully";
                string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
               
            }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
            connect.Open();
            SqlCommand sp_update_product = new SqlCommand("sp_update_product", connect);
            sp_update_product.CommandType = CommandType.StoredProcedure;

            SqlParameter product_name = new SqlParameter("@product_name", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(product_name).Value = txtbox_product_name.Text.Trim();

            SqlParameter product_categories = new SqlParameter("@product_categories", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(product_categories).Value = txtbox_product_categories.Text;

            SqlParameter product_sub_categories = new SqlParameter("@product_sub_categories", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(product_sub_categories).Value = txtbox_product_sub_categories.Text;

            SqlParameter price = new SqlParameter("@price", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(price).Value = txtbox_price.Text.Trim();

            SqlParameter quantity = new SqlParameter("@quantity", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(quantity).Value = txtbox_quantity.Text;

          
                SqlCommand sp_fetch_product_id = new SqlCommand("sp_fetch_product_id", connect);
                sp_fetch_product_id.CommandType = CommandType.StoredProcedure;

                

                SqlParameter product_id1 = new SqlParameter("@product_id", SqlDbType.VarChar);
                sp_fetch_product_id.Parameters.Add(product_id1).Value = lbl_id.Text;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_product_id);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                string image1 = dt.Rows[0]["product_image1"].ToString();
                string image2 = dt.Rows[0]["product_image2"].ToString();
                string image3 = dt.Rows[0]["product_image3"].ToString();


            string savepath = Server.MapPath("~/images/product_image/") + txtbox_product_name.Text.Trim();
            if (txtbox_pic1.HasFile)

            {
                string extension = Path.GetExtension(txtbox_pic1.PostedFile.FileName);


                if (!Directory.Exists(savepath))
                {
                    Directory.CreateDirectory(savepath);
                }

                txtbox_pic1.SaveAs(savepath + "\\" + txtbox_product_name.Text.ToString().Trim() + "1" + extension);

                SqlParameter product_image1 = new SqlParameter("@product_image1", SqlDbType.VarChar);
                sp_update_product.Parameters.Add(product_image1).Value = txtbox_product_name.Text.Trim() + "1" + extension;
            }

            else
            {
               
                    SqlParameter product_image1 = new SqlParameter("@product_image1", SqlDbType.VarChar);
                    sp_update_product.Parameters.Add(product_image1).Value = image1;

                
            }

            if (txtbox_pic2.HasFile)
            {
                string extension = Path.GetExtension(txtbox_pic2.PostedFile.FileName);

                if (!Directory.Exists(savepath))
                {
                    Directory.CreateDirectory(savepath);
                }

                txtbox_pic2.SaveAs(savepath + "\\" + txtbox_product_name.Text.ToString().Trim() + "2" + extension);

                SqlParameter product_image2 = new SqlParameter("@product_image2", SqlDbType.VarChar);
                sp_update_product.Parameters.Add(product_image2).Value = txtbox_product_name.Text.Trim() + "2" + extension;
            }
            else
            {
                SqlParameter product_image2 = new SqlParameter("@product_image2", SqlDbType.VarChar);
                sp_update_product.Parameters.Add(product_image2).Value = image2;
            }

            if (txtbox_pic3.HasFile)
            {
                string extension = Path.GetExtension(txtbox_pic3.PostedFile.FileName);
                if (!Directory.Exists(savepath))
                {
                    Directory.CreateDirectory(savepath);
                }

                txtbox_pic3.SaveAs(savepath + "\\" + txtbox_product_name.Text.ToString().Trim() + "3" + extension);

                SqlParameter product_image3 = new SqlParameter("@product_image3", SqlDbType.VarChar);
                sp_update_product.Parameters.Add(product_image3).Value = txtbox_product_name.Text.Trim() + "3" + extension;
            }
            else
            {
                SqlParameter product_image3 = new SqlParameter("@product_image3", SqlDbType.VarChar);
                sp_update_product.Parameters.Add(product_image3).Value = image3;
            }

            SqlParameter product_description = new SqlParameter("@product_description", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(product_description).Value = txtbox_product_description.Text.Trim();

            string id = Request.QueryString["id"];

            SqlParameter product_id = new SqlParameter("@product_id", SqlDbType.VarChar);
            sp_update_product.Parameters.Add(product_id).Value = id;

            int i = sp_update_product.ExecuteNonQuery();
            if (i > 0)
            {
                lbl_txt.Text = "Product Updated Successfully";
                string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
            }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void txtbox_product_categories1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (txtbox_product_categories.SelectedItem.Text == "Mobile")
            {
                string[] Mobile = { "Redmi", "Samsung", "Apple", "IQOO", "Realme", "OnePlus" };
                txtbox_product_sub_categories.DataSource = Mobile;
            }
            else if (txtbox_product_categories.SelectedItem.Text == "HeadPhone")
            {
                string[] HeadPhone = { "BoAt", "Redmi", "Realme", "JBL", "Sony", "OnePlus" };
                txtbox_product_sub_categories.DataSource = HeadPhone;
            }
            else if (txtbox_product_categories.SelectedItem.Text == "TV")
            {
                string[] TV = { "LG", "Sony", "Samsung", "OnePlus", "Redmi", "Realme" };
                txtbox_product_sub_categories.DataSource = TV;
            }
            else if (txtbox_product_categories.SelectedItem.Text == "Laptop")
            {
                string[] Laptop = { "Dell", "Lenovo", "Toshiba", "HP", "Acer", "Asus" };
                txtbox_product_sub_categories.DataSource = Laptop;
            }
            else if (txtbox_product_categories.SelectedItem.Text == "Camera")
            {
                string[] Camera = { "Sony", "Nikon", "Blackmagic", "Canon", "Panasonic", "Fujifilm" };
                txtbox_product_sub_categories.DataSource = Camera;
            }
            else if (txtbox_product_categories.SelectedItem.Text == "Speaker")
            {
                string[] Speaker = { "BoAt", "Zebronics", "Sony", "JBL", "Bose", "Marshall" };
                txtbox_product_sub_categories.DataSource = Speaker;
            }

            txtbox_product_sub_categories.DataBind();
        }
    }
}