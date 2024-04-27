using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasicWebApp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private static string connectionString = "Server=MLEGION\\SQLEXPRESS; Database=SampleDB;User Id=csharp;Password=password;";

        private static SqlConnection dbConnection = new SqlConnection(connectionString);

        private static string tblName = "TestImg";


        protected void Page_Load(object sender, EventArgs e)
        {
            int rowsRead = 0;
            dbConnection.Open();

            string query = $"select * from {tblName};";


            using (SqlCommand cmd = new SqlCommand(query, dbConnection))
            {

                using (SqlDataReader select = cmd.ExecuteReader())
                {

                    // Repeats for every row returned by the select
                    while (select.Read())
                    {
                        string bookCard = " <div class=\"card\" style=\"width: 18rem; margin: 2rem;\">\r\n             <img class=\"card-img-top\" src=\"data:image/png;base64,BookImage\" alt=\"Card image cap\">\r\n            <div class=\"card-body\">\r\n                <h5 class=\"card-title\">BookTitle</h5>\r\n                <p class=\"card-text\">BookSummary</p>\r\n            </div>\r\n        </div>";

                        string id = select["ID"].ToString();
                        string rowname = select["RowName"].ToString();
                        string rowinfo = select["RowInfo"].ToString();
                        string rowImg = select["Image"].ToString();

                        bookCard = bookCard.Replace("BookTitle", rowname);
                        bookCard = bookCard.Replace("BookSummary", rowinfo);
                        bookCard = bookCard.Replace("BookImage", rowImg);

                        lstBooks.InnerHtml += bookCard;

                        rowsRead++;
                    }

                }
            }

            dbConnection.Close();
        }
    }
}