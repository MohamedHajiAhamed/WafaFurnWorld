using Electronic_Kingdom.general;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Electronic_Kingdom
{
    public partial class user_details : System.Web.UI.Page
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
                SqlCommand sp_fetch_user_list = new SqlCommand("sp_fetch_user_list", connect);
                sp_fetch_user_list.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_user_list);
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

            txtbox_user_id.Text = GridView1.Rows[rowind].Cells[1].Text;
            txtbox_user_type.SelectedValue = GridView1.Rows[rowind].Cells[6].Text;
        }

        public void refresh()
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_user_list = new SqlCommand("sp_fetch_user_list", connect);
                sp_fetch_user_list.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_user_list);
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

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_update_user = new SqlCommand("sp_update_user", connect);
                sp_update_user.CommandType = CommandType.StoredProcedure;

                SqlParameter user_type = new SqlParameter("@user_type", SqlDbType.VarChar);
                sp_update_user.Parameters.Add(user_type).Value = txtbox_user_type.Text;

                SqlParameter user_id = new SqlParameter("@user_id", SqlDbType.Int);
                sp_update_user.Parameters.Add(user_id).Value = txtbox_user_id.Text.Trim();

                int i = sp_update_user.ExecuteNonQuery();

                if (i > 0)
                {
                    lbl_txt.Text = "Successfully updated";
                    string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);

                    refresh();
                }
                else
                {
                    lbl_txt.Text = "Try Again";
                    string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
                }
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
                SqlCommand sp_delete_user = new SqlCommand("sp_delete_user", connect);
                sp_delete_user.CommandType = CommandType.StoredProcedure;

                SqlParameter user_id = new SqlParameter("@user_id", SqlDbType.Int);
                sp_delete_user.Parameters.Add(user_id).Value = txtbox_user_id.Text.Trim();


                int i = sp_delete_user.ExecuteNonQuery();

                if (i > 0)
                {
                    lbl_txt.Text = "Successfully deleted";
                    string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
                    
                    refresh();

                }
                else
                {
                    lbl_txt.Text = "Try Again";
                    string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block';document.querySelector('#model').classList.add('show'); }</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);

                }
                connect.Close();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
    }
}