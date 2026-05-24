<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDb.aspx.cs" Inherits="TailShopping.ProductDb" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Management</title>
    <style>
        body {
            font-family: 'Times New Roman';
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }

        h2 {
            color: purple;
            margin-top: 30px;
            font-size: 28px;
        }

        .grid-container {
            width: 90%;
            margin: 20px auto;
            background-color: #ffe6f0;
            padding: 20px;
            border-radius: 10px;
            border: 3px dotted purple;
        }

        .gridview-style {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview-style th, .gridview-style td {
            border: 2px dotted purple;
            padding: 10px;
            text-align: center;
            font-size: 15px;
            color: purple;
        }

        .gridview-style th {
            background-color: purple;
            color: white;
        }

        .gridview-style tr:nth-child(even) {
            background-color: #ffe6f0;
        }

        .product-img {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            border: 2px solid purple;
        }

        .styled-button {
            background-color: purple;
            color: white;
            border: 2px dotted white;
            padding: 8px 20px;
            font-size: 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .styled-button:hover {
            background-color: #45a049;
        }

        .footer-textbox {
            width: 90%;
            padding: 5px;
            font-size: 14px;
        }

        .footer-radiobuttonlist {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Product Management</h2>

        <div class="grid-container">
            <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False"
                DataKeyNames="ProductID" DataSourceID="SqlDataSource2"
                ShowFooter="True" AllowPaging="True" AllowSorting="True" CellPadding="4"
                CssClass="gridview-style">

                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />

                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" InsertVisible="False" />

                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate>
                            <%# Eval("Product_Name") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtProductNameF" runat="server" CssClass="footer-textbox"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <%# Eval("Category") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCategory" runat="server" SelectedValue='<%# Bind("Category") %>'>
                                <asp:ListItem Text="Clothes" />
                                <asp:ListItem Text="Shoes" />
                                <asp:ListItem Text="Accessories" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlCategoryF" runat="server">
                                <asp:ListItem Text="Clothes" />
                                <asp:ListItem Text="Shoes" />
                                <asp:ListItem Text="Accessories" />
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price (Rs)">
                        <ItemTemplate>
                            <%# Eval("Price") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtPriceF" runat="server" CssClass="footer-textbox"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

<asp:TemplateField HeaderText="Stock">
    <ItemTemplate>
        <%# Eval("Stock") %>
    </ItemTemplate>
    <EditItemTemplate>
        <asp:RadioButtonList ID="rblStock" runat="server" SelectedValue='<%# Bind("Stock") %>' CssClass="footer-radiobuttonlist">
            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
            <asp:ListItem Text="No" Value="No"></asp:ListItem>
        </asp:RadioButtonList>
    </EditItemTemplate>
    <FooterTemplate>
        <asp:RadioButtonList ID="rblStockF" runat="server" CssClass="footer-radiobuttonlist">
            <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
            <asp:ListItem Text="No" Value="No"></asp:ListItem>
        </asp:RadioButtonList>
    </FooterTemplate>
</asp:TemplateField>

                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <%# Eval("Description") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDescriptionF" runat="server" CssClass="footer-textbox" TextMode="MultiLine"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

              <asp:TemplateField HeaderText="Image">
    <ItemTemplate>
        <asp:Image ID="imgProduct" runat="server"
            ImageUrl='<%# "Images/" + Eval("ImagePath") %>'
            CssClass="product-img" />
    </ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtImageEdit" runat="server" Text='<%# Bind("ImagePath") %>' CssClass="footer-textbox" />
        <br />
       
    </EditItemTemplate>
    <FooterTemplate>
        <asp:TextBox ID="txtImagePathF" runat="server" CssClass="footer-textbox" Placeholder="e.g., scarf.jpg"></asp:TextBox>
    </FooterTemplate>
</asp:TemplateField>


                </Columns>
            </asp:GridView>

            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="styled-button" OnClick="btnAddProduct_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:MyDBConnectionString1 %>"
                SelectCommand="SELECT [ProductID], [Product_Name], [Category], [Price], [Stock], [Description], [ImagePath] FROM [Products]"
                InsertCommand="INSERT INTO [Products] ([Product_Name], [Category], [Price], [Stock], [Description], [ImagePath]) VALUES (@Product_Name, @Category, @Price, @Stock, @Description, @ImagePath)"
                UpdateCommand="UPDATE [Products] SET [Product_Name]=@Product_Name, [Category]=@Category, [Price]=@Price, [Stock]=@Stock, [Description]=@Description, [ImagePath]=@ImagePath WHERE [ProductID]=@ProductID"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductID]=@ProductID">

                <InsertParameters>
                    <asp:Parameter Name="Product_Name" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Stock" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                </InsertParameters>

                <UpdateParameters>
                    <asp:Parameter Name="Product_Name" Type="String" />
                    <asp:Parameter Name="Category" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="Stock" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </UpdateParameters>

                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnLogicInfo" runat="server" Text="LogIn Info" CssClass="styled-button" OnClick="btnLoginInfo_Click" />
        </div>
    </form>
</body>
</html>
