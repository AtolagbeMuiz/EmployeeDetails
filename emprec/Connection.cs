using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace emprec
{
    public class Connection
    {
        SqlConnection sqlConn = new SqlConnection("Server=.;Database=EmployeeRecord;User Id=muiz;Password=oluwadamilare;");

        public SqlConnection ActivateConn()
        {
            if (sqlConn.State == ConnectionState.Closed)
            {
                sqlConn.Open();
            }

            return sqlConn;
        }

    }
}