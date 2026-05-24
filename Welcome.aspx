<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="TailShopping.Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
    <style>
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            width: 100%;
        }

        .fieldset {
            width: 600px;
            height: 400px;
            background-color: pink;
            border: 3px dotted white;
            padding: 30px;
            box-sizing: border-box;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .welcome-text {
            font-family: 'Times New Roman';
            color: purple;
            font-size: 36px;
            text-align: center;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 35px;
            margin-top: 10px;
        }

        .styled-button {
            background-color: purple;
            color: white;
            border: 2px dotted white;
            padding: 12px 30px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: 'Times New Roman';
        }

        .styled-button:hover {
            background-color: #45a049;
        }

        /* NEW SMALL LINK STYLE */
        .guide-link {
            margin-top: 25px;
            font-size: 14px;
            font-family: 'Times New Roman';
        }

        .guide-link a {
            color: purple;
            text-decoration: none;
        }

        .guide-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <form id="welcome" runat="server">
        <div class="container">
            <fieldset class="fieldset">

                <div class="welcome-text">
                    Welcome to TailShopping!<br />
                    Let's shop together 😉
                </div>

                <div class="button-container">
                    <asp:Button runat="server" ID="Btn_SignIn" Text="Sign In" CssClass="styled-button" OnClick="Btn_SignIn_Click" />
                    <asp:Button runat="server" ID="Btn_LogIn" Text="Log In" CssClass="styled-button" OnClick="Btn_LogIn_Click" />
                </div>

                <!-- ✅ Guidelines Link Added -->
                <div class="guide-link">
                    <a href="Guidlines.aspx">Click here for User Guidelines</a>
                </div>

            </fieldset>
        </div>
    </form>
</body>
</html>