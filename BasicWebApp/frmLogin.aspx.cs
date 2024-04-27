using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasicWebApp
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        private static string connectionString = "Server=MLEGION\\SQLEXPRESS; Database=SampleDB;User Id=csharp;Password=password;";

        private static SqlConnection dbConnection = new SqlConnection(connectionString);

        private static string tblName = "login";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // If you exist, check pwd, else register you

            if (getUsers(edtUsername.Value) > 0)
            {
                if (isPasswordValid(edtUsername.Value, edtPassword.Value))
                {
                    divMessage.InnerHtml = "<div class=\"alert alert-success\" role=\"alert\">\r\n  Login Success!\r\n</div>";
                }
                else
                {
                    divMessage.InnerHtml = "<div class=\"alert alert-danger\" role=\"alert\">\r\n  Login Failed!\r\n</div>";
                }
            }
            else
            {
                if (RegisterUser(edtUsername.Value, edtPassword.Value))
                {
                    divMessage.InnerHtml = "<div class=\"alert alert-success\" role=\"alert\">\r\n  Register Success!\r\n</div>";
                }
                else
                {
                    divMessage.InnerHtml = "<div class=\"alert alert-danger\" role=\"alert\">\r\n  Register Failed!\r\n</div>";
                }
            }
        }

        private bool isPasswordValid(string username, string rawPassword)
        {


            int rowsRead = 0;
            dbConnection.Open();

            string id;
            string dbUsername;
            string dbPasswordHash = "";
            int dbIsAdmin;

            string query = $"select * from {tblName} WHERE \"username\" like @username;";


            using (SqlCommand cmd = new SqlCommand(query, dbConnection))
            {

                cmd.Parameters.AddWithValue("username",username);

                using (SqlDataReader select = cmd.ExecuteReader())
                {

                    // Repeats for every row returned by the select
                    while (select.Read())
                    {
                        id = select["ID"].ToString();
                        dbUsername = select["username"].ToString();
                        dbPasswordHash = select["password"].ToString();
                        dbIsAdmin = Convert.ToInt32(select["isAdmin"]);

                        rowsRead++;
                    }

                }
            }

            if (rowsRead == 1)
            {
                string rawPasswordAsHash = getPasswordHash(rawPassword);
                if (rawPasswordAsHash == dbPasswordHash)
                {
                    dbConnection.Close();
                    return true;
                }
            }

            dbConnection.Close();
            return false;

            

        }

        private bool RegisterUser(string username, string rawPassword)
        {
            int rowsAffected = 0;

            dbConnection.Open();

            string sqlQuery = $"INSERT INTO {tblName} (\"username\",\"password\",\"isAdmin\")\r\nVALUES (@username,@password,@isAdmin);";

            using (SqlCommand cmd = new SqlCommand(sqlQuery, dbConnection))
            {
                Debug.WriteLine(sqlQuery);

                cmd.Parameters.AddWithValue("username", username);
                cmd.Parameters.AddWithValue("password",getPasswordHash(rawPassword));
                cmd.Parameters.AddWithValue("isAdmin", 0);

                rowsAffected = cmd.ExecuteNonQuery();

            }

            dbConnection.Close();


            if (rowsAffected > 0)
            {
               return true ;
            }
            else
            {
               return false ;
            }
        }

        private int getUsers(string username)
        {
            int rowsRead = 0;
            dbConnection.Open();

            string query = $"select * from {tblName} where \"username\" like @username;";


            using (SqlCommand cmd = new SqlCommand(query, dbConnection))
            {

                cmd.Parameters.AddWithValue("username", username);

                using (SqlDataReader select = cmd.ExecuteReader())
                {

                    // Repeats for every row returned by the select
                    while (select.Read())
                    {
                        rowsRead++;
                    }

                }
            }

            dbConnection.Close();

            return rowsRead;

        }

        private string getPasswordHash(string rawPassword)
        {

            string hashedPassword = null;


            string salt = "D3FF9F2E1BCC497F19D8403E93FC0E3DF245B461261248C181B8012BB4415E25";

            using (SHA256 shaEngine = SHA256.Create())
            {
                byte[] rawPasswordasBytes = Encoding.Default.GetBytes(rawPassword + salt);
                byte[] hashedPasswordBytes = shaEngine.ComputeHash(rawPasswordasBytes);

                foreach (byte b in hashedPasswordBytes)
                {
                    hashedPassword += b.ToString("X2");
                }
            }

            return hashedPassword;

        }
    }
}