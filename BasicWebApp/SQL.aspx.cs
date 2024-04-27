using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasicWebApp
{
    public partial class SQL : System.Web.UI.Page
    {

        // Connection string
        // Connection
        // Command to run

        // Server=myServerName\myInstanceName;Database=myDataBase;User Id=myUsername;Password=myPassword;
        private static string connectionString = "Server=MLEGION\\SQLEXPRESS; Database=SampleDB;User Id=csharp;Password=password;";

        private static SqlConnection dbConnection = new SqlConnection(connectionString);

        private static string tblName = "Test2";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateTable_Click(object sender, EventArgs e)
        {
            try
            {
                dbConnection.Open();

                tblName = edtDBName.Text.Replace(";", "").Replace("*", "").Replace("\\", "");

                string sqlQuery = $"Create table {tblName} (\r\n\"ID\" int IDENTITY(0,1) not null,\r\n\"RowName\" varchar(255) not null,\r\n\"RowInfo\" varchar(255)\r\nPRIMARY KEY(\"ID\")\r\n);\r\n";

                using (SqlCommand cmd = new SqlCommand(sqlQuery, dbConnection))
                {
                    Debug.WriteLine(sqlQuery);
                    cmd.ExecuteNonQuery();
                }

                dbConnection.Close();
                redtOutput.InnerText += $"Created table {tblName}";
            }
            catch (ArgumentOutOfRangeException argEx)
            {
                // Not enough items in array...
            }
            catch  (Exception createTableEx)
            {
                redtOutput.InnerText += $"Error during table creation :\n{createTableEx.Message}";
            }
        }

        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            string rowName = edtRowName.Value;
            int rowsAffected = 0;

            dbConnection.Open();

            string sqlQuery = $"INSERT INTO {tblName} (\"RowName\",\"RowInfo\")\r\nVALUES (@rowname,@rowinfo);";

            using (SqlCommand cmd = new SqlCommand(sqlQuery,dbConnection))
            {
                Debug.WriteLine(sqlQuery);

                cmd.Parameters.AddWithValue("rowname",rowName);
                cmd.Parameters.AddWithValue("rowinfo","This is some default info");

                rowsAffected =  cmd.ExecuteNonQuery();

            }

            dbConnection.Close() ;


            if (rowsAffected > 0)
            {
                redtOutput.InnerText += $"\n{rowsAffected} rows inserted into {tblName}";
            }
            else
            {
                redtOutput.InnerText += $"Failed to insert row {rowName}";
            }

        }

        protected void btnGetRow_Click(object sender, EventArgs e)
        {
            int rowsRead = 0;
            dbConnection.Open();

            string query = $"select * from {tblName}\r\nwhere \"RowName\" = @rowToFind;";

            using (SqlCommand cmd = new SqlCommand(query,dbConnection))
            {
                cmd.Parameters.AddWithValue("rowToFind",edtRowToGet.Value);

                using (SqlDataReader select = cmd.ExecuteReader())
                {

                    // Repeats for every row returned by the select
                    while (select.Read())
                    {
                        string id = select["ID"].ToString();
                        string rowname = select["RowName"].ToString();
                        string rowinfo = select["RowInfo"].ToString();

                        redtOutput.InnerText += $"\n{id} - {rowname} - {rowinfo}";
                        rowsRead++;
                    }

                }
            }

            dbConnection.Close();

            redtOutput.InnerText += $"\n{rowsRead} rows returned";

        }
    }
}