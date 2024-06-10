using Electronic_Kingdom.general;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;

namespace Electronic_Kingdom
{
    public partial class add_products : System.Web.UI.Page
    {
        public string connectionstring = connectionString.connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
            connect.Open();
            SqlCommand sp_insert_product = new SqlCommand("sp_insert_product", connect);
            sp_insert_product.CommandType = CommandType.StoredProcedure;

            SqlParameter product_name = new SqlParameter("@product_name", SqlDbType.VarChar);
            sp_insert_product.Parameters.Add(product_name).Value = txtbox_product_name.Text.Trim();

            SqlParameter product_categories = new SqlParameter("@product_categories", SqlDbType.VarChar);
            sp_insert_product.Parameters.Add(product_categories).Value = txtbox_product_categories.Text;


            SqlParameter price = new SqlParameter("@price", SqlDbType.VarChar);
            sp_insert_product.Parameters.Add(price).Value = txtbox_price.Text.Trim();

            SqlParameter quantity = new SqlParameter("@quantity", SqlDbType.VarChar);
            sp_insert_product.Parameters.Add(quantity).Value = txtbox_quantity.Text.Trim();

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
               sp_insert_product.Parameters.Add(product_image1).Value = txtbox_product_name.Text.Trim() + "1" + extension;
            }
                else
                {
                    SqlParameter product_image1 = new SqlParameter("@product_image1", SqlDbType.VarChar);
                    sp_insert_product.Parameters.Add(product_image1).Value = "";
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
                sp_insert_product.Parameters.Add(product_image2).Value = txtbox_product_name.Text.Trim() + "2" + extension;
            }
                else
                {
                    SqlParameter product_image1 = new SqlParameter("@product_image2", SqlDbType.VarChar);
                    sp_insert_product.Parameters.Add(product_image1).Value = "";
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
                sp_insert_product.Parameters.Add(product_image3).Value = txtbox_product_name.Text.Trim() + "3" + extension;
            }
                else
                {
                    SqlParameter product_image1 = new SqlParameter("@product_image3", SqlDbType.VarChar);
                    sp_insert_product.Parameters.Add(product_image1).Value = "";
                }



                SqlParameter product_description = new SqlParameter("@product_description", SqlDbType.VarChar);
            sp_insert_product.Parameters.Add(product_description).Value = txtbox_product_description.Text.Trim();

            int i = sp_insert_product.ExecuteNonQuery();
            if (i > 0)
            {
                lbl_txt.Text = "Product Added Successfully";
                string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
            }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
            
        }

        
    }
}