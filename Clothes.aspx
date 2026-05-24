<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clothes.aspx.cs" Inherits="TailShopping.Clothes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clothes Collection</title>
    <style>
        body {
            background-color: white;
            font-family: 'Times New Roman';
            text-align: center;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: purple;
            margin-top: 30px;
            font-size: 28px;
        }

        .fieldset {
            width: 80%;
            margin: 30px auto;
            background-color: pink;
            border: 3px dotted white;
            padding: 20px;
            border-radius: 10px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th, .grid td {
            border: 2px dotted white;
            padding: 10px;
            text-align: center;
            color: purple;
            font-size: 16px;
        }

        .grid th {
            background-color: purple;
            color: white;
        }

        .grid tr:nth-child(even) {
            background-color: #ffe6f0;
        }

        .product-img {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            border: 2px solid white;
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
            font-family: 'Times New Roman';
        }

        .styled-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Clothes Collection</h2>

        <fieldset class="fieldset">
            <asp:GridView 
                ID="GridViewClothes" 
                runat="server" 
                CssClass="grid"
                AutoGenerateColumns="False"
                DataKeyNames="ProductID"
                DataSourceID="SqlDataSourceClothes">

                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" ReadOnly="True" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# Eval("ImagePath") ?? "~/Images/noimage.jpg" %>' class="product-img" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

          <asp:SqlDataSource 
    ID="SqlDataSourceClothes" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:MyDBConnectionString1 %>" 
    SelectCommand="SELECT * FROM Products WHERE Category = 'Clothes'">
</asp:SqlDataSource>

            <br />
            <asp:Button ID="btnBack" runat="server" CssClass="styled-button" Text="⬅ Back to Shop" PostBackUrl="~/ShopSelection.aspx" />
        </fieldset>
    </form>
</body>
</html>
