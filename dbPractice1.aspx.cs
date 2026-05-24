using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TailShopping
{
    public partial class dbPractice1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Load logic here if needed
        }

        // DoB validation for 18+ age
        protected void cvDoB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrWhiteSpace(args.Value))
            {
                args.IsValid = false;
                return;
            }

            DateTime dob;
            bool isValidDate = DateTime.TryParseExact(args.Value, "dd/MM/yyyy",
                                                      System.Globalization.CultureInfo.InvariantCulture,
                                                      System.Globalization.DateTimeStyles.None,
                                                      out dob);

            if (!isValidDate)
            {
                args.IsValid = false; // Invalid date format
                return;
            }

            int age = DateTime.Today.Year - dob.Year;
            if (dob.Date > DateTime.Today.AddYears(-age))
                age--;

            args.IsValid = age >= 18;
        }


        protected void GridView11_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;
            int rowIndex = gv.SelectedIndex;

            // Example: get value from the first cell
            string fName = gv.SelectedRow.Cells[1].Text;

            // Optional: do something with fName
            Response.Write("Selected Name: " + fName);
        }

        // Interest (CheckBoxList) must have at least one selected
        protected void cvInterest_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CustomValidator validator = (CustomValidator)source;
            GridViewRow row = (GridViewRow)validator.NamingContainer;
            CheckBoxList cbl = (CheckBoxList)row.FindControl("cblInterest");

            args.IsValid = cbl != null && cbl.Items.Cast<ListItem>().Any(li => li.Selected);
        }
        //  protected void Page_PreRender(object sender, EventArgs e)
        //  {
        //    if (!Page.IsValid)
        //    {
        //return; // Stop execution if validation failed
        //  }
        //  }
        protected void GridView11_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Only run validation for update or insert operations
            if (e.CommandName == "Update" || e.CommandName == "Insert")
            {
                // Force ASP.NET to validate all controls on the page
                Page.Validate();

                // Now check the result — safely!
                if (!Page.IsValid)
                {
                    e.Handled = true; // Stop further processing
                    return;
                }
            }
        }



        protected void cvInterestF_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CustomValidator validator = (CustomValidator)source;
            GridViewRow row = (GridViewRow)validator.NamingContainer;
            CheckBoxList cbl = (CheckBoxList)row.FindControl("cblInterestF");

            args.IsValid = cbl != null && cbl.Items.Cast<ListItem>().Any(li => li.Selected);
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

            //Find all the footer controls

            TextBox txtFname = (TextBox)GridView11.FooterRow.FindControl("TxtFnameF");
            TextBox txtLname = (TextBox)GridView11.FooterRow.FindControl("TxtLnameF");
            DropDownList ddlProvince = (DropDownList)GridView11.FooterRow.FindControl("ddlProvinceF");
            TextBox txtAddress = (TextBox)GridView11.FooterRow.FindControl("txtAddressF");
            TextBox txtPostalCode = (TextBox)GridView11.FooterRow.FindControl("txtPostalCodeF");
            TextBox txtNumber = (TextBox)GridView11.FooterRow.FindControl("txtNumberF");
            TextBox txtCNIC = (TextBox)GridView11.FooterRow.FindControl("txtCNICF");
            RadioButtonList rblGender = (RadioButtonList)GridView11.FooterRow.FindControl("rblGenderF");
            TextBox txtDoB = (TextBox)GridView11.FooterRow.FindControl("txtDoBF");
            TextBox txtEmail = (TextBox)GridView11.FooterRow.FindControl("txtEmailF");
            TextBox txtPassword = (TextBox)GridView11.FooterRow.FindControl("txtPasswordF");
            TextBox txtConfirmPassword = (TextBox)GridView11.FooterRow.FindControl("txtConfirmPasswordF");
            CheckBoxList cblInterest = (CheckBoxList)GridView11.FooterRow.FindControl("cblInterestF");

            //Combining Selected Interest Items into a single String

            string interests = string.Join(",", cblInterest.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Text));

            // Assign Values to insert Parameter
            SqlDataSource1.InsertParameters["F_Name"].DefaultValue = txtFname.Text;
            SqlDataSource1.InsertParameters["L_Name"].DefaultValue = txtLname.Text;
            SqlDataSource1.InsertParameters["Province"].DefaultValue = ddlProvince.SelectedValue;
            SqlDataSource1.InsertParameters["Address"].DefaultValue = txtAddress.Text;
            SqlDataSource1.InsertParameters["Postal_Code"].DefaultValue = txtPostalCode.Text;
            SqlDataSource1.InsertParameters["Number"].DefaultValue = txtNumber.Text;
            SqlDataSource1.InsertParameters["CNIC"].DefaultValue = txtCNIC.Text;
            SqlDataSource1.InsertParameters["DoB"].DefaultValue=txtDoB.Text;
            SqlDataSource1.InsertParameters["Gender"].DefaultValue = rblGender.SelectedValue; SqlDataSource1.InsertParameters["Gender"].DefaultValue = rblGender.SelectedValue;
            SqlDataSource1.InsertParameters["Email"].DefaultValue = txtEmail.Text;
            SqlDataSource1.InsertParameters["Password"].DefaultValue = txtPassword.Text;
            SqlDataSource1.InsertParameters["Confirm_Password"].DefaultValue = txtConfirmPassword.Text;
            SqlDataSource1.InsertParameters["Interest"].DefaultValue = interests;

            //Run the isnert 
            //SqlDataSource1.Insert();

            //refresh the grid view
            // GridView11.DataBind();

            //lblMessage.Text = "✅ Record added successfully!";
            SqlDataSource1.Insert();
            GridView11.DataBind();
            lblMessage.Text = "✅ Data inserted successfully!";


        }

    }
}