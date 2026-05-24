using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TailShopping
{
    public partial class Registeration : System.Web.UI.Page
    {
        //for crosspageposting, publically placing teh fname n enmail as protected mode is not allowing to send data to another page 

        public string name
        {
            get { return txtFname.Text; }
        }

        public string email
        {
            get { return txtEmail.Text; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["SignUpInfo"];
                if (cookie != null)
                {
                    txtFname.Text = cookie["name"];
                    txtEmail.Text= cookie["email"];
                }
            }

        }

        // protected void Button_Click(object sender, EventArgs e)
        //{
        //  lblMessage.Text = "Welcome!";
        //Response.Redirect("Login.aspx");
        // Server.Transfer("Login.aspx");
        //Server.Execute("Login.aspx");
        //}
       

        protected void cvInterest_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void CV_CblInterest(object source, ServerValidateEventArgs args)
        {
            // Check if at least one checkbox is selected
            args.IsValid = cblInterest.Items.Cast<ListItem>().Any(item => item.Selected);
        }


        protected void cvDoB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dob;
            bool isValidDate = DateTime.TryParseExact(
                txtDoB.Text,
                "dd/MM/yyyy",
                System.Globalization.CultureInfo.InvariantCulture,
                System.Globalization.DateTimeStyles.None,
                out dob
            );

           // if (!isValidDate)
           // {
             //   args.IsValid = false;
               // cvDoB.ErrorMessage = "*Please use dd/MM/yyyy format.";
                //return;
            //}

            int age = DateTime.Now.Year - dob.Year;
            if (dob > DateTime.Now.AddYears(-age))
            {
                age--;
            }

            if (age < 18)
            {
                args.IsValid = false;
                cvDoB.ErrorMessage = "*You must be 18 years or older";
            }
            else
            {
                args.IsValid = true;
            }
        }
        protected void Button_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // 1️⃣ Get values from your form
                string fname = txtFname.Text.Trim();
                string lname = txtLname.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();
                string confirm = txtConfirmPassword.Text.Trim();
                string province = ddlProvince.SelectedValue;
                string dob = txtDoB.Text.Trim();
                string gender = rblGender.SelectedValue;
                string address = addressTxt.Text.Trim();
                string postcode = txtPostCode.Text.Trim();
                string number = txtNumber.Text.Trim();
                string cnic = txtCNIC.Text.Trim();

                // Combine selected interests into a string
                string interests = string.Join(",", cblInterest.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));

                // 2️⃣ Ensure passwords match
                if (password != confirm)
                {
                    lblMessage.Text = "❌ Passwords do not match!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                try
                {
                    // 3️⃣ Create connection using your web.config connection string
                    string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDBConnectionString1"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        // 4️⃣ SQL command to insert form data into your Registration table
                        string query = @"INSERT INTO Registration 
                                (F_Name, L_Name, Province, Address, Postal_Code, Number, CNIC, Gender, DoB, Email, Password, Confirm_Password, Interest) 
                                VALUES 
                                (@F_Name, @L_Name,  @Province, @Address, @Postal_Code, @Number, @CNIC, @Gender, @DoB, @Email, @Password, @Confirm_Password, @Interest)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            // 5️⃣ Add parameters
                            cmd.Parameters.AddWithValue("@F_Name", fname);
                            cmd.Parameters.AddWithValue("@L_Name", lname);
                            cmd.Parameters.AddWithValue("@Province", province);
                            cmd.Parameters.AddWithValue("@Address", address);
                            cmd.Parameters.AddWithValue("@Postal_Code", postcode);
                            cmd.Parameters.AddWithValue("@Number", number);
                            cmd.Parameters.AddWithValue("@CNIC", cnic);
                            cmd.Parameters.AddWithValue("@Gender", gender);
                            cmd.Parameters.AddWithValue("@DoB", dob);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", password);
                            cmd.Parameters.AddWithValue("@Confirm_Password", confirm);
                            cmd.Parameters.AddWithValue("@Interest", interests);

                            // 6️⃣ Open connection and execute
                            conn.Open();
                            int rows = cmd.ExecuteNonQuery();

                            if (rows > 0)
                            {
                                lblMessage.Text = "✅ Registration Successful!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Optionally clear fields
                                ClearFields();

                                // ✅ Redirect to login page
                                Response.Redirect("Login.aspx");// ✅ correct form

                            }

                            else
                            {
                                lblMessage.Text = "❌ Registration failed!";
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "⚠️ Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        private void ClearFields()
        {
            txtFname.Text = "";
            txtLname.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtDoB.Text = "";
            ddlProvince.SelectedIndex = 0;
            rblGender.ClearSelection();
            foreach (ListItem item in cblInterest.Items)
                item.Selected = false;
        }



        //protected void Button_Click(object sender, EventArgs e)
        // {
        //  if (Page.IsValid)
        // {
        // All validations passed

        //QueryString

        //string name = txtFname.Text;
        //string email = txtEmail.Text;
        //string url=$"Login.aspx?name={ Server.UrlEncode(name)}&email={ Server.UrlEncode(email)}";
        //Response.Redirect(url);

        //Session

        // string name = txtFname.Text;
        //string email= txtEmail.Text;


        //cookie

        //  string name = txtFname.Text;
        // string email= txtEmail.Text;
        // string password = txtPassword.Text;
        //  HandleCookies(name, email, chkRemembr.Checked);

        //optional=clear all fields after sign up


        //  txtFname.Text = "";
        //  txtEmail.Text = "";
        // session adding +cookie
        //  Session["name"] = name;
        //  Session["password"] =password;
        //Response.Redirect("Login.aspx");


        //Server.Transfer

        //Server.Transfer("Login.aspx", true);


        //crosspagepooling


        // }
        //   else
        //  {
        // Stay on the page so error messages can appear
        //    }
        // }

        private void HandleCookies(string name, string email, bool remember)
        {

            HttpCookie cookie = new HttpCookie("SignUpInfo");
            if (remember)
            {
                cookie["name"] = name;
                cookie["email"] = email;
                cookie.Expires = DateTime.Now.AddDays(7);

            }
            else
            {

                cookie.Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies.Add(cookie);


        }





    }
}
    

      