using Electronic_Kingdom.general;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Kingdom
{
    public partial class registration : System.Web.UI.Page
    {
        public string connectionstring = connectionString.connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_submit_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection connect = new SqlConnection(connectionstring);
            connect.Open();
            SqlCommand sp_insert_user = new SqlCommand("sp_insert_user",connect);
            sp_insert_user.CommandType = CommandType.StoredProcedure;

            SqlParameter first_name = new SqlParameter("@first_name", SqlDbType.VarChar);
            sp_insert_user.Parameters.Add(first_name).Value = fname.Text.Trim();
            SqlParameter last_name = new SqlParameter("@last_name", SqlDbType.VarChar);
            sp_insert_user.Parameters.Add(last_name).Value = lname.Text.Trim();
            SqlParameter date_of_birth = new SqlParameter("@date_of_birth", SqlDbType.Date);
            sp_insert_user.Parameters.Add(date_of_birth).Value = dob.Text.Trim();
            SqlParameter mobile_number = new SqlParameter("@mobile_number", SqlDbType.BigInt);
            sp_insert_user.Parameters.Add(mobile_number).Value = mobno.Text.Trim();
            SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
            sp_insert_user.Parameters.Add(Email).Value = email.Text.Trim();
            SqlParameter password = new SqlParameter("@password", SqlDbType.VarChar);
            sp_insert_user.Parameters.Add(password).Value = pwd.Text.Trim();
            SqlParameter confirm_password = new SqlParameter("@confirm_password", SqlDbType.VarChar);
            sp_insert_user.Parameters.Add(confirm_password).Value = pwd.Text.Trim();

            string gender = radiogender();

            SqlParameter Gender = new SqlParameter("@gender", SqlDbType.VarChar);
            sp_insert_user.Parameters.Add(Gender).Value = gender;

            int i = sp_insert_user.ExecuteNonQuery();
            if (i > 0){
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
                return  "Others";
            }
            else
            {
                return "";
            }
        }
    }
}