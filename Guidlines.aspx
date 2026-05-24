<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Guidlines.aspx.cs" Inherits="TailShopping.Guidlines" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Guidelines</title>

    <style>
        body {
            background-color: #ffc0cb;
            font-family: 'Times New Roman';
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            background-color: #ffe4ec;
            border: 3px dotted white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        }

        h1 {
            text-align: center;
            color: purple;
            margin-bottom: 20px;
        }

        .note {
            background-color: white;
            padding: 15px;
            border-left: 5px solid purple;
            margin-bottom: 20px;
            border-radius: 6px;
            font-size: 17px;
        }

        ul {
            font-size: 18px;
            line-height: 1.8;
            color: #4b004b;
        }

        .btnHome {
            background-color: purple;
            color: white;
            border: none;
            padding: 12px 28px;
            font-size: 17px;
            border-radius: 8px;
            cursor: pointer;
            display: block;
            margin: 30px auto;
            font-family: 'Times New Roman';
        }

        .btnHome:hover {
            background-color: #45a049;
        }
    </style>

</head>
<body>

<form id="form1" runat="server">

    <div class="container">

        <h1>Application Guidelines</h1>

        <div class="note">
            <b>User Manual:</b> Please follow the instructions below to properly use the shopping application.
        </div>

        <ul>
            <li>First, the user enters the <b>Welcome Page</b> of the application.</li>

            <li>If the user is new, click on the <b>Sign Up</b> button.  
                If already registered, click <b>Login</b>.</li>

            <li>During registration, fill the form carefully with validations:
                <ul>
                    <li>Name must be entered in <b>UPPERCASE letters</b>.</li>
                    <li>CNIC format should be: <b>xxxxx-xxxxxxx-x</b>.</li>
                    <li>CNIC must not be duplicated.</li>
                    <li>Select gender and personal details correctly.</li>
                    <li>Choose your area of interest.</li>
                </ul>
            </li>

            <li>After successful registration or login, the user moves to the <b>Shop Selection Page</b>.</li>

            <li>The user can choose a shopping category such as:
                <ul>
                    <li>Shoes</li>
                    <li>Bags</li>
                    <li>Clothes</li>
                    <li>Accessories</li>
                </ul>
            </li>

            <li>After selecting a shop, the user can view products, explore details, and check prices.</li>

            <li>The user can return and explore other categories anytime.</li>
        </ul>

        <asp:Button ID="btnHome" runat="server"
            Text="Home Page"
            CssClass="btnHome"
            PostBackUrl="~/Welcome.aspx" />

    </div>

</form>

</body>
</html>