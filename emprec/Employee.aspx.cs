using System;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Script.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace emprec
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod(EnableSession = true), System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string InsertEmployeeDetails(string name, string gender, string salary)
        {
            string r = string.Empty;
            try
            {
                Connection con = new Connection();
                SqlCommand cmd = new SqlCommand("Employeedetails", con.ActivateConn());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@FullName",
                    Value = name
                });

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Gender",
                    Value = gender
                });

                cmd.Parameters.Add(new SqlParameter()
                {
                    ParameterName = "@Salary",
                    Value = salary
                });

                cmd.ExecuteNonQuery();
                con.ActivateConn().Close();
                return "1";
            }

            catch (Exception ex)
            {
                r = "Category Code or Name already exist !!!";
                return r;
            }

        }
    }
}