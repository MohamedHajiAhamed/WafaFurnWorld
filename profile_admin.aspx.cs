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
    public partial class profile_admin : System.Web.UI.Page
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
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_fetch_single_user = new SqlCommand("sp_fetch_single_user", connect);
                sp_fetch_single_user.CommandType = CommandType.StoredProcedure;

                int parsedUser_id = Convert.ToInt32(Session["user_id"]);

                SqlParameter user_id = new SqlParameter("@user_id", SqlDbType.VarChar);
                sp_fetch_single_user.Parameters.Add(user_id).Value = parsedUser_id;

                SqlDataAdapter sda = new SqlDataAdapter(sp_fetch_single_user);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                fname.Text = dt.Rows[0]["first_name"].ToString();
                lname.Text = dt.Rows[0]["last_name"].ToString();
                dob.Text = dt.Rows[0]["date_of_birth"].ToString();
                mobno.Text = dt.Rows[0]["mobile_number"].ToString();
                email.Text = dt.Rows[0]["Email"].ToString();
                pwd.Text = dt.Rows[0]["password"].ToString();
                cpwd.Text = dt.Rows[0]["confirm_password"].ToString();

                string gender = dt.Rows[0]["gender"].ToString();
                if(gender == "Male")
                {
                    male.Checked = true;
                }
                else if(gender == "Female")
                {
                    female.Checked = true;
                }
                else
                {
                    others.Checked = true;
                }
                }
                connect.Close();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }

        protected void update_submit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(connectionstring);
                connect.Open();
                SqlCommand sp_update_single_user = new SqlCommand("sp_update_single_user", connect);
                sp_update_single_user.CommandType = CommandType.StoredProcedure;

                SqlParameter first_name = new SqlParameter("@first_name", SqlDbType.VarChar);
                sp_update_single_user.Parameters.Add(first_name).Value = fname.Text.Trim();
                SqlParameter last_name = new SqlParameter("@last_name", SqlDbType.VarChar);
                sp_update_single_user.Parameters.Add(last_name).Value = lname.Text.Trim();
                SqlParameter date_of_birth = new SqlParameter("@date_of_birth", SqlDbType.Date);
                sp_update_single_user.Parameters.Add(date_of_birth).Value = dob.Text.Trim();
                SqlParameter mobile_number = new SqlParameter("@mobile_number", SqlDbType.BigInt);
                sp_update_single_user.Parameters.Add(mobile_number).Value = mobno.Text.Trim();
                SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
                sp_update_single_user.Parameters.Add(Email).Value = email.Text.Trim();
                SqlParameter password = new SqlParameter("@password", SqlDbType.VarChar);
                sp_update_single_user.Parameters.Add(password).Value = pwd.Text.Trim();
                SqlParameter confirm_password = new SqlParameter("@confirm_password", SqlDbType.VarChar);
                sp_update_single_user.Parameters.Add(confirm_password).Value = pwd.Text.Trim();

               
                string gender = radiogender();

                SqlParameter Gender = new SqlParameter("@gender", SqlDbType.VarChar);
                sp_update_single_user.Parameters.Add(Gender).Value = gender;

                int parsedUser_id = Convert.ToInt32(Session["user_id"]);

                SqlParameter user_id = new SqlParameter("@user_id", SqlDbType.Int);
                sp_update_single_user.Parameters.Add(user_id).Value = parsedUser_id;

                int i = sp_update_single_user.ExecuteNonQuery();
                if (i > 0)
                {
                    string myScriptValue = "<script>window.onload = function() { document.querySelector('#model').style.display = 'block'; }</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", myScriptValue);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Error:');" + ex.Message, true);
            }
        }
        public string radiogender()
        {

            if (male.Checked == true)
            {
                return "Male";
            }
            else if (female.Checked == true)
            {
                return "Female";
            }
            else if (others.Checked == true)
            {
                return "Others";
            }
            else
            {
                return "";
            }


        }
    }
   
}