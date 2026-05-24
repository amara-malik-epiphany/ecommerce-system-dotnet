<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopSelection.aspx.cs" Inherits="TailShopping.ShopSelection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shop Selection</title>
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
            width: 50%;
            margin: 30px auto;
            background-color: pink;
            border: 3px dotted white;
            padding: 30px;
            box-sizing: border-box;
            border-radius: 8px;
        }

        .shop-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            margin: 20px auto;
            width: 80%;
        }

        .shop-item img {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            border: 2px solid white;
            margin-left: 20px;
        }

        .shop-link {
            background-color: purple;
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 25px;
            border-radius: 8px;
            border: 2px dotted white;
            transition: background-color 0.3s ease;
        }

        .shop-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>What do you want to shop?</h2>

        <fieldset class="fieldset">
            <div class="shop-item">
                <a class="shop-link" href="Clothes.aspx">Clothes</a>
                <img src="coat.jpeg" alt="Clothes" />
            </div>

            <div class="shop-item">
                <a class="shop-link" href="Shoes.aspx">Shoes</a>
                <img src="joggers.jpeg" alt="Shoes" />
            </div>

            <div class="shop-item">
                <a class="shop-link" href="Accessories.aspx">Accessories</a>
                <img src="bag.jpeg" alt="Accessories" />
            </div>
        </fieldset>
    </form>
</body>
</html>
