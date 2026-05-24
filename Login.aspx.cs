using System;
using System.Data.SqlClient;
using System.Configuration;

namespace TailShopping
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Btn_Log_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = eamiltxt.Text.Trim();
                string password = passtxt.Text.Trim();
                if (email=="admin@gmail.com" && password=="Admin@12")
                {
                    Response.Redirect("ProductDb.aspx");
                }
                else
                {
                    string connStr = ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(connStr))
                    {
                        string query = "SELECT COUNT(*) FROM Registration WHERE Email=@Email AND Password=@Password";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        con.Open();
                        int count = (int)cmd.ExecuteScalar();
                        con.Close();

                        if (count > 0)
                        {
                            Response.Redirect("~/ShopSelection.aspx");
                        }
                        else
                        {
                            lblMsg.ForeColor = System.Drawing.Color.Red;
                            lblMsg.Text = "Invalid Email or Password!";
                        }
                    }
                }
            }
        }
    }
}
