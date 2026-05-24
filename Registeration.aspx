<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="TailShopping.Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration form</title>
    <style>
.fieldset {
    width: 50%;
    position: relative;
    margin: 20px auto;
    background-color: pink;
    border: 3px dotted white;
    padding: 20px;
    box-sizing: border-box;
}

h2 {
    font-family: 'Times New Roman';
    color: purple;
    text-align: center;
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
    <form id="Regform" runat="server">
        <asp:ScriptManager 
            runat="server">
        </asp:ScriptManager>

        <h2>Sign Yourself Here!</h2>
        <div>
            <fieldset class="fieldset">
                <asp:ValidationSummary 
                    ID="ValidationSummary2" 
                    runat="server" 
                    ForeColor="Red">
                </asp:ValidationSummary>

                <table>
                    <tr>
                        <td>F Name</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtFname">
                            </asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfvFname" 
                                runat="server" 
                                ControlToValidate="txtFname" 
                                ErrorMessage="*First name required." 
                                ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator 
                                ID="revFname" 
                                runat="server" 
                                BorderStyle="None" 
                                ControlToValidate="txtFname" 
                                ErrorMessage="*Name should be in Upper Case." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^[A-Z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>L Name</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtLname">
                            </asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfvLname" 
                                runat="server" 
                                ControlToValidate="txtLname" 
                                ErrorMessage="*Last name required." 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator 
                                ID="revLname0" 
                                runat="server" 
                                BorderStyle="None" 
                                ControlToValidate="txtLname" 
                                ErrorMessage="*Name should be in Upper Case." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^[A-Z]+$">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Province</td>
                        <td>
                            <asp:DropDownList 
                                runat="server" 
                                ID="ddlProvince">
                                <asp:ListItem Text="Select"></asp:ListItem>
                                <asp:ListItem Text="Punjab"></asp:ListItem>
                                <asp:ListItem Text="KPK"></asp:ListItem>
                                <asp:ListItem Text="Sindh"></asp:ListItem>
                                <asp:ListItem Text="Balochistan"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfvddlProvince" 
                                runat="server" 
                                ClientIDMode="AutoID" 
                                ErrorMessage="*Select your province." 
                                ForeColor="#CC0000" 
                                ControlToValidate="ddlProvince">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Address</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="addressTxt" 
                                TextMode="MultiLine">
                            </asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfvAddress" 
                                runat="server" 
                                ErrorMessage="*Address required." 
                                ControlToValidate="addressTxt" 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Postal Code</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtPostCode" 
                                style="height: 22px">
                            </asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator 
                                ID="rePostCode" 
                                runat="server" 
                                ControlToValidate="txtPostCode" 
                                ErrorMessage="*Enter your postal code." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^\d{5}$">
                            </asp:RegularExpressionValidator>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfPostalCode" 
                                runat="server" 
                                ControlToValidate="txtPostCode" 
                                ErrorMessage="*Must enter postal code." 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td>Number</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtNumber">
                            </asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator 
                                ID="reNumber" 
                                runat="server" 
                                ControlToValidate="txtNumber" 
                                ErrorMessage="*Enter Phone Number." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^\d{11}$">
                            </asp:RegularExpressionValidator>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfNumber" 
                                runat="server" 
                                ControlToValidate="txtNumber" 
                                ErrorMessage="*Must enter phone number." 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>CNIC</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtCNIC">
                            </asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator 
                                ID="reCNIC" 
                                runat="server" 
                                ControlToValidate="txtCNIC" 
                                ErrorMessage="*Enter your CNIC." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^\d{5}-\d{7}-\d{1}$">
                            </asp:RegularExpressionValidator>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfCNIC" 
                                runat="server" 
                                ControlToValidate="txtCNIC" 
                                ErrorMessage="*Must enter CNIC." 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Gender</td>
                        <td>
                            <asp:RadioButtonList 
                                runat="server" 
                                ID="rblGender">
                                <asp:ListItem Text="Male"></asp:ListItem>
                                <asp:ListItem Text="Female"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator5" 
                                runat="server" 
                                ErrorMessage="*Select gender" 
                                ControlToValidate="rblGender" 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>DoB</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtDoB"  
                                Placeholder="dd/MM/yyyy">
                            </asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfDoB" 
                                runat="server" 
                                ControlToValidate="txtDoB" 
                                ErrorMessage="*Must enter DoB." 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                            <br />
                            <asp:CustomValidator 
                                ID="cvDoB" 
                                runat="server" 
                                ControlToValidate="txtDoB" 
                                ErrorMessage="*You must be 18 years or older to register." 
                                ForeColor="#CC0000" 
                                OnServerValidate="cvDoB_ServerValidate"
                                ValidateEmptyText="true">
                            </asp:CustomValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtEmail" 
                                TextMode="Email">
                            </asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="rqfEmail0" 
                                runat="server" 
                                ControlToValidate="txtEmail" 
                                ErrorMessage="*Must enter Email." 
                                ForeColor="#CC0000">
                            </asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator 
                                ID="revEmail" 
                                runat="server" 
                                ControlToValidate="txtEmail" 
                                ErrorMessage="*Email must be in proper fromat." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^\S+@\S+\.\S+$">
                            </asp:RegularExpressionValidator>
                            <br />
                        </td>
                    </tr>

                    <tr>
                        <td>Password</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtPassword" 
                                TextMode="Password">
                            </asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator  
                                ID="revPassword"  
                                runat="server" 
                                ControlToValidate="txtPassword" 
                                ErrorMessage="*Password must contain at least 1 uppercase, 1 lowercase, 1 digit, 1 special character and be 8+ chars." 
                                ForeColor="#CC0000" 
                                ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Confirm Password</td>
                        <td>
                            <asp:TextBox 
                                runat="server" 
                                ID="txtConfirmPassword" 
                                TextMode="Password">
                            </asp:TextBox>
                            <br />
                            <asp:CompareValidator 
                                ID="CVconPassword" 
                                runat="server" 
                                ErrorMessage="*Confirm password should match password." 
                                ControlToCompare="txtPassword" 
                                ControlToValidate="txtConfirmPassword" 
                                ForeColor="#CC0000">
                            </asp:CompareValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>Please select your interest(only 1):</td>
                        <td>
                            <asp:CheckBoxList 
                                runat="server" 
                                ID="cblInterest">
                                <asp:ListItem Text="Stiched"></asp:ListItem>
                                <asp:ListItem Text="Unstiched"></asp:ListItem>
                                <asp:ListItem Text="Bags"></asp:ListItem>
                                <asp:ListItem Text="Shoes"></asp:ListItem>
                            </asp:CheckBoxList>

                            <asp:CustomValidator 
                                ID="cvCblInterest" 
                                runat="server" 
                                ErrorMessage="*Please select at least one interest." 
                                ForeColor="#CC0000" 
                                OnServerValidate="CV_CblInterest" 
                                ValidateEmptyText="true">
                            </asp:CustomValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox runat="server" ID="chkRemembr" Text="Remember me" />
                        </td>
                        
                    </tr>
                    <tr>

                        <td></td>
                        <td>
                            <asp:Button  
                                CssClass="styled-button" 
                                runat="server"  
                                ID="btnRegister" 
                                Text="SignIn"  
                                OnClick="Button_Click" 
                                CausesValidation="true">
                            </asp:Button>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <asp:Label 
                                ID="lblMessage" 
                                CssClass="labelStyled" 
                                runat="server">
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
