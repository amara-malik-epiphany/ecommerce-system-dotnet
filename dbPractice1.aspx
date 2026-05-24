<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbPractice1.aspx.cs" Inherits="TailShopping.dbPractice1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration GridView</title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- GridView for displaying and editing registration data -->
        <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
    ShowFooter="true"        DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
            AllowSorting="True" AllowPaging="True" CellPadding="4"
            OnRowCommand="GridView11_RowCommand"

            OnSelectedIndexChanged="GridView11_SelectedIndexChanged1">

            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />

                 <asp:TemplateField>
            <FooterTemplate>
    <asp:LinkButton  ID="insertBtn" runat="server" Text="Add"  OnClick="btnInsert_Click" ForeColor="Blue" 
        Font-Underline="True">
    </asp:LinkButton>
</FooterTemplate>

        </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" InsertVisible="False" />


                <asp:TemplateField HeaderText="F Name">
                    <ItemTemplate>
                        
                        <%# Eval("F_Name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("F_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtFName" runat="server"
                            ErrorMessage="*First name required" ForeColor="Red" />
                        <asp:RegularExpressionValidator ControlToValidate="txtFName" runat="server"
                            ErrorMessage="*Uppercase only" ValidationExpression="^[A-Z]+$" ForeColor="Red" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtFNameF" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtFNameF" runat="server"
                            ErrorMessage="*First name required" ForeColor="Red" />
                         <asp:RegularExpressionValidator ControlToValidate="txtFNameF" runat="server"
                           ErrorMessage="*Uppercase only" ValidationExpression="^[A-Z]+$" ForeColor="Red" />
                    </FooterTemplate>
                </asp:TemplateField>

              
                <asp:TemplateField HeaderText="L Name">
                    <ItemTemplate>
                        <%# Eval("L_Name") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("L_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtLName" runat="server"
                            ErrorMessage="*Last name required" ForeColor="Red" />
                        <asp:RegularExpressionValidator ControlToValidate="txtLName" runat="server"
                            ErrorMessage="*Uppercase only" ValidationExpression="^[A-Z]+$" ForeColor="Red" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtLNameF" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtLNameF" runat="server"
                            ErrorMessage="*Last name required" ForeColor="Red" />
                        <asp:RegularExpressionValidator ControlToValidate="txtLNameF" runat="server"
                     ErrorMessage="*Uppercase only" ValidationExpression="^[A-Z]+$" ForeColor="Red" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Province">
                    <ItemTemplate>
                        <%# Eval("Province") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlProvince" runat="server">
                              <asp:ListItem Text="-- Select Province --" Value="" Selected="True" Disabled="True"></asp:ListItem>
                            <asp:ListItem Text="Punjab"></asp:ListItem>
                            <asp:ListItem Text="KPK"></asp:ListItem>
                            <asp:ListItem Text="Sindh"></asp:ListItem>
                            <asp:ListItem Text="Balochistan"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ControlToValidate="ddlProvince" runat="server"
                            ErrorMessage="*Select Province" InitialValue="" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlProvinceF" runat="server">
                              <asp:ListItem Text="Select Province" Value="" Selected="True" Disabled="True"></asp:ListItem>
                            <asp:ListItem Text="Punjab"></asp:ListItem>
                            <asp:ListItem Text="KPK"></asp:ListItem>
                            <asp:ListItem Text="Sindh"></asp:ListItem>
                            <asp:ListItem Text="Balochistan"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ControlToValidate="ddlProvinceF" runat="server"
                            ErrorMessage="*Select Province" InitialValue="" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%# Eval("Address") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtAddress" runat="server"
                            ErrorMessage="*Address required" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAddressF" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtAddressF" runat="server"
                            ErrorMessage="*Address required" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Postal_Code">
                    <ItemTemplate>
                        <%# Eval("Postal_Code") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPostalCode" runat="server" Text='<%# Bind("Postal_Code") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtPostalCode" runat="server"
                            ErrorMessage="*Postal Code required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtPostalCode" runat="server"
                            ErrorMessage="*Must be 5 digits" ValidationExpression="^\d{5}$" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPostalCodeF" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtPostalCodeF" runat="server"
                            ErrorMessage="*Postal Code required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtPostalCodeF" runat="server"
                            ErrorMessage="*Must be 5 digits" ValidationExpression="^\d{5}$" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Number">
                    <ItemTemplate>
                        <%# Eval("Number") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNumber" runat="server" Text='<%# Bind("Number") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtNumber" runat="server"
                            ErrorMessage="*Number required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtNumber" runat="server"
                            ErrorMessage="*Must be 11 digits" ValidationExpression="^\d{11}$" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNumberF" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtNumberF" runat="server"
                            ErrorMessage="*Number required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtNumberF" runat="server"
                            ErrorMessage="*Must be 11 digits" ValidationExpression="^\d{11}$" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="CNIC">
                    <ItemTemplate>
                        <%# Eval("CNIC") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCNIC" runat="server" Text='<%# Bind("CNIC") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtCNIC" runat="server"
                            ErrorMessage="*CNIC required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtCNIC" runat="server"
                            ErrorMessage="*Format 12345-1234567-1" ValidationExpression="^\d{5}-\d{7}-\d{1}$" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtCNICF" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtCNICF" runat="server"
                            ErrorMessage="*CNIC required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtCNICF" runat="server"
                            ErrorMessage="*Format 12345-1234567-1" ValidationExpression="^\d{5}-\d{7}-\d{1}$" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <%# Eval("Gender") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rblGender" runat="server">
                            <asp:ListItem Text="Male"></asp:ListItem>
                            <asp:ListItem Text="Female"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ControlToValidate="rblGender" runat="server"
                            ErrorMessage="*Select gender" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:RadioButtonList ID="rblGenderF" runat="server">
                            <asp:ListItem Text="Male"></asp:ListItem>
                            <asp:ListItem Text="Female"></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ControlToValidate="rblGenderF" runat="server"
                            ErrorMessage="*Select gender" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="DoB">
                    <ItemTemplate>
                        <%# Eval("DoB") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDoB" runat="server" Text='<%# Bind("DoB") %>' Placeholder="dd/MM/yyyy"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtDoB" runat="server"
                            ErrorMessage="*DoB required" ValidationGroup="dobGroup" ForeColor="Red"/>
                        <asp:CustomValidator ControlToValidate="txtDoB" runat="server"
                            ErrorMessage="*You must be 18+ to register" OnServerValidate="cvDoB_ServerValidate"
                            ValidateEmptyText="true" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtDoBF" runat="server" Placeholder="dd/MM/yyyy"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtDoBF" runat="server"
                         ValidationGroup="dobGroup"   ErrorMessage="*DoB required" ForeColor="Red"/>
                    <asp:CustomValidator ControlToValidate="txtDoBF" runat="server"
                            ErrorMessage="*You must be 18+ to register" OnServerValidate="cvDoB_ServerValidate"
                            ValidateEmptyText="true" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%# Eval("Email") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtEmail" runat="server"
                            ErrorMessage="*Email required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtEmail" runat="server"
                            ErrorMessage="*Invalid email format" ValidationExpression="^\S+@\S+\.\S+$" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmailF" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtEmailF" runat="server"
                            ErrorMessage="*Email required" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ControlToValidate="txtEmailF" runat="server"
                        ErrorMessage="*Invalid email format" ValidationExpression="^\S+@\S+\.\S+$" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <%# Eval("Password") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' TextMode="Password"></asp:TextBox>
                        <asp:RegularExpressionValidator ControlToValidate="txtPassword" runat="server"
                            ErrorMessage="*Password must contain Upper, Lower, Digit, Special char and 8+ chars"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$" ForeColor="Red"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtPasswordF" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtPasswordF" runat="server"
                            ErrorMessage="*Password required" ForeColor="Red"/>
                          <asp:RegularExpressionValidator ControlToValidate="txtPasswordF" runat="server"
                     ErrorMessage="*Password must contain Upper, Lower, Digit, Special char and 8+ chars"
                   ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$" ForeColor="Red"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Confirm Password">
                    <ItemTemplate>
                        <%# Eval("Confirm_Password") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" Text='<%# Bind("Confirm_Password") %>' TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="txtConfirmPassword" runat="server"
                            ControlToCompare="txtPassword" ErrorMessage="*Password does not match" ForeColor="Black"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtConfirmPasswordF" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ControlToValidate="txtConfirmPasswordF" runat="server"
                            ControlToCompare="txtPasswordF" ErrorMessage="*Password does not match" ForeColor="Black"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Interest">
                    <ItemTemplate>
                        <%# Eval("Interest") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBoxList ID="cblInterest" runat="server">
                            <asp:ListItem Text="Stiched"></asp:ListItem>
                            <asp:ListItem Text="Unstiched"></asp:ListItem>
                            <asp:ListItem Text="Bags"></asp:ListItem>
                            <asp:ListItem Text="Shoes"></asp:ListItem>
                        </asp:CheckBoxList>
                        <asp:CustomValidator ID="cvInterest" runat="server" ForeColor="Black"
                            OnServerValidate="cvInterest_ServerValidate" ErrorMessage="*Select at least one interest"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBoxList ID="cblInterestF" runat="server">
                            <asp:ListItem Text="Stiched"></asp:ListItem>
                            <asp:ListItem Text="Unstiched"></asp:ListItem>
                            <asp:ListItem Text="Bags"></asp:ListItem>
                            <asp:ListItem Text="Shoes"></asp:ListItem>
                        </asp:CheckBoxList>
                        <asp:CustomValidator ID="cvInterestF" runat="server" ForeColor="Red"
                            OnServerValidate="cvInterestF_ServerValidate" ErrorMessage="*Select at least one interest"/>
                    </FooterTemplate>
                </asp:TemplateField>


            </Columns>

            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CC66FF" ForeColor="Black" />
            <FooterStyle BackColor="#FF99FF" Font-Bold="True" ForeColor="#003300" />
            <HeaderStyle BackColor="#FF99CC" Font-Bold="True" ForeColor="#003300" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFCCFF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>

        <br />
<asp:Label ID="lblMessage" runat="server" ForeColor="Green" Font-Bold="True"></asp:Label>
<br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:MyDBConnectionString1 %>"
            ProviderName="<%$ ConnectionStrings:MyDBConnectionString1.ProviderName %>"
            SelectCommand="SELECT [Id], [F_Name] AS F_Name, [L_Name] AS L_Name, [Province], [Address], [Postal_Code] AS Postal_Code, [Number], [CNIC], [Gender], [DoB], [Email], [Password], [Confirm_Password] AS Confirm_Password, [Interest] FROM [Registration]"
            InsertCommand="INSERT INTO [Registration] ([F_Name], [L_Name], [Province], [Address], [Postal_Code], [Number], [CNIC], [Gender], [DoB], [Email], [Password], [Confirm_Password], [Interest]) VALUES (@F_Name, @L_Name, @Province, @Address, @Postal_Code, @Number, @CNIC, @Gender, @DoB, @Email, @Password, @Confirm_Password, @Interest)"
            UpdateCommand="UPDATE [Registration] SET [F Name] = @F_Name, [L Name] = @L_Name, [Province] = @Province, [Address] = @Address, [Postal_Code] = @Postal_Code, [Number] = @Number, [CNIC] = @CNIC, [Gender] = @Gender, [DoB] = @DoB, [Email] = @Email, [Password] = @Password, [Confirm_Password] = @Confirm_Password, [Interest] = @Interest WHERE [Id] = @Id"
            DeleteCommand="DELETE FROM [Registration] WHERE [Id] = @Id">
           
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="F_Name" Type="String" />
                <asp:Parameter Name="L_Name" Type="String" />
                <asp:Parameter Name="Province" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Postal_Code" Type="String" />
                <asp:Parameter Name="Number" Type="String" />
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="DoB" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Confirm_Password" Type="String" />
                <asp:Parameter Name="Interest" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="F_Name" Type="String" />
                <asp:Parameter Name="L_Name" Type="String" />
                <asp:Parameter Name="Province" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Postal_Code" Type="String" />
                <asp:Parameter Name="Number" Type="String" />
                <asp:Parameter Name="CNIC" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="DoB" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Confirm_Password" Type="String" />
                <asp:Parameter Name="Interest" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>

    </form>
</body>
</html>
