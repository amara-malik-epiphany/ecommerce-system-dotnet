using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TailShopping
{
    public partial class ProductDb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            GridView12.DataBind();

            // If GridView is empty, add a dummy row to show the footer
            if (GridView12.Rows.Count == 0)
            {
                SqlDataSource2.SelectCommand = @"
                    SELECT 
                        CAST(NULL AS INT) AS ProductID, 
                        CAST(NULL AS NVARCHAR(50)) AS Product_Name, 
                        CAST(NULL AS NVARCHAR(50)) AS Category, 
                        CAST(NULL AS DECIMAL(18,2)) AS Price, 
                        CAST(NULL AS NVARCHAR(10)) AS Stock, 
                        CAST(NULL AS NVARCHAR(200)) AS Description, 
                        CAST(NULL AS NVARCHAR(100)) AS ImagePath";
                GridView12.DataBind();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            GridViewRow footer = GridView12.FooterRow;
            if (footer != null)
            {
                TextBox txtProductNameF = (TextBox)footer.FindControl("txtProductNameF");
                DropDownList ddlCategoryF = (DropDownList)footer.FindControl("ddlCategoryF");
                TextBox txtPriceF = (TextBox)footer.FindControl("txtPriceF");
                RadioButtonList rblStockF = (RadioButtonList)footer.FindControl("rblStockF");
                TextBox txtDescriptionF = (TextBox)footer.FindControl("txtDescriptionF");
                TextBox txtImagePathF = (TextBox)footer.FindControl("txtImagePathF");

                // Validate price
                decimal price = 0;
                if (!decimal.TryParse(txtPriceF.Text.Trim(), out price))
                {
                    lblMessage.Text = "⚠ Please enter a valid price!";
                    return; // stop inserting
                }

                // Set insert parameters
                SqlDataSource2.InsertParameters["Product_Name"].DefaultValue = txtProductNameF.Text.Trim();
                SqlDataSource2.InsertParameters["Category"].DefaultValue = ddlCategoryF.SelectedValue;
                SqlDataSource2.InsertParameters["Price"].DefaultValue = price.ToString();

                // Stock
                if (rblStockF.SelectedItem != null)
                    SqlDataSource2.InsertParameters["Stock"].DefaultValue = rblStockF.SelectedValue;
                else
                    SqlDataSource2.InsertParameters["Stock"].DefaultValue = "No";

                SqlDataSource2.InsertParameters["Description"].DefaultValue = txtDescriptionF.Text.Trim();
                SqlDataSource2.InsertParameters["ImagePath"].DefaultValue = txtImagePathF.Text.Trim();

                // Insert and bind
                SqlDataSource2.Insert();
                GridView12.DataBind();

                lblMessage.Text = "✅ Product added successfully!";
            }
            else
            {
                lblMessage.Text = "⚠ Footer row not found!";
            }
        }
        protected string GetImagePath(object imagePathObj)
        {
            string imageFile = imagePathObj == DBNull.Value || imagePathObj == null
                                ? ""
                                : imagePathObj.ToString().Trim();

            if (string.IsNullOrEmpty(imageFile))
                return "Images/noimage.jpg"; // fallback if empty

            return "Images/" + imageFile; // use relative pathhttps://localhost:44352/ProductDb.aspx.cs

        }
        protected void btnLoginInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("dBPractice1.aspx");
        }

    }
}
