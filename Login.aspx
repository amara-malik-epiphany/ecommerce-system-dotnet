<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TailShopping.Login" %>
<%@ PreviousPageType VirtualPath="~/Registeration.aspx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            width: 25%;
        }
        .fieldset {
            width: 420px;
            height: 420px;
            background-color: pink;
            border: 3px dotted white;
            padding: 30px;
            box-sizing: border-box;
            margin: 0 auto;
        }
        h2 {
            font-family: 'Times New Roman';
            color: purple;
            text-align: center;
            margin-bottom: 15px;
        }
        .styled-button {
            background-color: purple;
            color: white;
            border: 2px dotted white;
            padding: 10px 25px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: 'Times New Roman';
            margin-top: 10px;
        }
        .styled-button:hover {
            background-color: #45a049;
        }
        .labelStyled {
            font-size: 20px;
            font-family: 'Times New Roman';
            color: purple;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="LogForm" runat="server">
        <div class="container">
            <h2>LogIn Yourself!</h2>
            <fieldset class="fieldset">

                <!-- ✅ Show all validation messages together -->
                <asp:ValidationSummary ID="vsLogin" runat="server" ForeColor="Red"
                    HeaderText="Please fix the following errors:" DisplayMode="BulletList" />

                <table>
                    <!-- EMAIL FIELD -->
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox runat="server" ID="eamiltxt" TextMode="Email"></asp:TextBox><br />

                            <!-- ✅ RequiredFieldValidator for Email -->
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ControlToValidate="eamiltxt"
                                ErrorMessage="*Email is required."
                                ForeColor="Red"
                                Display="Dynamic"></asp:RequiredFieldValidator><br />

                            <!-- ✅ RegularExpressionValidator for Email -->
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ControlToValidate="eamiltxt"
                                ErrorMessage="*Enter a valid email address."
                                ForeColor="Red"
                                Display="Dynamic"
                                ValidationExpression="^\S+@\S+\.\S+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <!-- PASSWORD FIELD -->
                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox runat="server" ID="passtxt" TextMode="Password"></asp:TextBox><br />

                            <!-- ✅ RequiredFieldValidator for Password -->
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                ControlToValidate="passtxt"
                                ErrorMessage="*Password is required."
                                ForeColor="Red"
                                Display="Dynamic"></asp:RequiredFieldValidator><br />

                            <!-- ✅ RegularExpressionValidator for Password strength -->
                            <asp:RegularExpressionValidator ID="revPassword" runat="server"
                                ControlToValidate="passtxt"
                                ErrorMessage="*Password must have uppercase, lowercase, number, special char, and be 8+ chars long."
                                ForeColor="Red"
                                Display="Dynamic"
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&amp;]).{8,}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <!-- REMEMBER ME -->
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox runat="server" ID="chkRemember" Text="Save information for next time." />
                        </td>
                    </tr>

                    <!-- LOGIN BUTTON -->
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button runat="server" ID="Btn_Log" Text="LogIn" CssClass="styled-button"
                                OnClick="Btn_Log_Click" />
                        </td>
                    </tr>

                    <!-- MESSAGE LABEL -->
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="lblMsg" runat="server" CssClass="labelStyled"></asp:Label>
                        </td>
                    </tr>

                    <!-- SIGNUP SECTION -->
                    <tr><td colspan="2" style="height:15px;"></td></tr>
                    <tr>
                        <td></td>
                        <td><label>You are new? SignUp here!</label></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button runat="server" ID="SignUp_btn" Text="SignUp"
                                CssClass="styled-button" PostBackUrl="~/Registeration.aspx" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
