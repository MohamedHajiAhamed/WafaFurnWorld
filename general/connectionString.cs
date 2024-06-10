using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Electronic_Kingdom.general
{
    public class connectionString
    {
        public static string connection()
        {
           return ConfigurationManager.ConnectionStrings["Electronic_kingdom_connection"].ConnectionString;
        }

    }

}