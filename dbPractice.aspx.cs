using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TailShopping
{
    public partial class dbPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Load logic here if needed
        }

      
        // DoB validation for 18+ age
        protected void cvDoB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dob;
            if (DateTime.TryParse(args.Value, out dob))
            {
                int age = DateTime.Now.Year - dob.Year;
                if (dob > DateTime.Now.AddYears(-age)) age--; // adjust if birthday hasn't occurred yet
                args.IsValid = age >= 18; // Must be 18 or older
            }
            else
            {
                args.IsValid = false; // Invalid date format
            }
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            // Example: get the selected row index
            int rowIndex = GridView1.SelectedIndex;
            // Example: get value from the first cell
            string fName = GridView1.SelectedRow.Cells[1].Text;
            // Do something with it
        }

        // Interest (CheckBoxList) must have at least one selected
        protected void cvInterest_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CheckBoxList cbl = (CheckBoxList)((GridViewRow)((Control)source).NamingContainer).FindControl("cblInterest");
            args.IsValid = cbl != null && cbl.Items.Cast<ListItem>().Any(li => li.Selected);
        }

        protected void cvInterestF_ServerValidate(object source, ServerValidateEventArgs args)
        {
            CheckBoxList cbl = (CheckBoxList)((GridViewRow)((Control)source).NamingContainer).FindControl("cblInterestF");
            args.IsValid = cbl != null && cbl.Items.Cast<ListItem>().Any(li => li.Selected);
        }

    }
}
