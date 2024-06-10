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
    public partial class login : System.Web.UI.Page
    {
        public string connectionstring = connectionString.connection();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_submit_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_login_user = new SqlCommand("sp_login_user", connect);
                sp_login_user.CommandType = CommandType.StoredProcedure;
                SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
                sp_login_user.Parameters.Add(Email).Value = email_login.Text.Trim();
                SqlParameter password = new SqlParameter("@password", SqlDbType.VarChar);
                sp_login_user.Parameters.Add(password).Value = pwd_login.Text.Trim();

                SqlDataAdapter sda = new SqlDataAdapter(sp_login_user);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["user_id"] = dt.Rows[0]["user_id"].ToString();
                    Session["first_name"] = dt.Rows[0]["first_name"].ToString();
                    Session["last_name"] = dt.Rows[0]["last_name"].ToString();
                    string user_type = dt.Rows[0]["user_type"].ToString();
                    if (user_type == "Admin")
                    {
                        Response.Redirect("index_admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("index_user.aspx");
                    }
                }
                else
                {
                    lbl_txt.Text = "Please Enter Valid Credentials";
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
