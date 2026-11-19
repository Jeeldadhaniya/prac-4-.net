<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Practical_4.RegistrationForm" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Student Registration Form</title>
</head>
<body>
<form id="form1" runat="server">
<table>
<tr>
<td>
<asp:Label ID="lblStudentName" runat="server" Text="Enter Name"></asp:Label>
</td>
<td>
<asp:TextBox ID="txtStudentName" runat="server" OnTextChanged="txtStudentName_TextChanged"></asp:TextBox>
</td>
<td>
<asp:RequiredFieldValidator ID="RFValidator" runat="server" ErrorMessage="Student Name Is Required" ControlToValidate="txtStudentName" ForeColor="Red">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblGrNo" runat="server" Text="Enter Gr_No."></asp:Label>
</td>
<td>
<asp:TextBox ID="txtGrNo" runat="server"></asp:TextBox>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblEmailId" runat="server" Text="Enter Email_ID"></asp:Label>
</td>
<td>
<asp:TextBox ID="txtEmailId" runat="server"></asp:TextBox>
</td>
<td>
<asp:RegularExpressionValidator ID="REValidator1" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="txtEmailId" ForeColor="Red" ValidationExpression="\w+([-.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblMobileNo" runat="server" Text="Enter Mobile_No"></asp:Label>
</td>
<td>
<asp:TextBox ID="txtMobileNo" runat="server"></asp:TextBox>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblAge" runat="server" Text="Enter Age"></asp:Label>
</td>
<td>
<asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
</td>
<td>
<asp:RangeValidator ID="RValidator1" runat="server" ErrorMessage="Age Should Be Between 18 to 40" ControlToValidate="txtAge" ForeColor="Red" MaximumValue="40" MinimumValue="18" Type="Integer"></asp:RangeValidator>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblPassword" runat="server" Text="Enter Password"></asp:Label>
</td>
<td>
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password"></asp:Label>
</td>
<td>
<asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password"></asp:TextBox>
</td>
<td>
<asp:CompareValidator ID="CValidator1" runat="server" ErrorMessage="Password and Confirm Password Both Should Match" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:CompareValidator>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
</td>
<td>
<asp:RadioButton ID="rbMale" runat="server" Text="Male" />
<asp:RadioButton ID="rbFemale" runat="server" Text="Female" />
</td>
<td>
<asp:CustomValidator ID="CuValidator1" runat="server" ErrorMessage="Select any one gender" OnServerValidate="CuValidator1_ServerValidate" ForeColor="Red" ValidateEmptyText="True"></asp:CustomValidator>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblBrnach" runat="server" Text="Branch"></asp:Label>
</td>
<td>
<asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
<asp:ListItem Selected="True">Select Branch</asp:ListItem>
<asp:ListItem>CSE</asp:ListItem>
<asp:ListItem>CE</asp:ListItem>
<asp:ListItem>AI/ML</asp:ListItem>
</asp:DropDownList>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblEvent" runat="server" Text="Select Event Type"></asp:Label>
</td>
<td>
<asp:CheckBox ID="Paper_Presentation" runat="server" Text="Paper Presentation" /><br />
<asp:CheckBox ID="Poster_Presentation" runat="server" Text="Poster Presentation" /><br />
<asp:CheckBox ID="Coding_Mania" runat="server" Text="Coding Mania" /><br />
</td>
<td>
<asp:CustomValidator ID="CuValidator2" runat="server" ErrorMessage="Select at least one event" ForeColor="Red" OnServerValidate="CuValidator2_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblDate" runat="server" Text="Select Date"></asp:Label>
</td>
<td>
<asp:Calendar ID="calDate" runat="server" OnSelectionChanged="calDate_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
<DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
<NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
<OtherMonthDayStyle ForeColor="#999999" />
<SelectedDayStyle BackColor="#333399" ForeColor="White" />
<TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
<TodayDayStyle BackColor="#CCCCCC" />
</asp:Calendar>
</td>
</tr>

<tr>
<td>
<asp:Label ID="lblBanner" runat="server" Text="Banner"></asp:Label>
</td>
<td>
<asp:Image ID="Image1" runat="server" ImageUrl="Image/event.jpg" Width="300px" />
</td>
</tr>

<tr>
<td></td>
<td>
<asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CausesValidation="True" />
<asp:Button ID="btnClear" runat="server" Text="Clear Form" OnClick="btnClear_Click" CausesValidation="False" />
</td>
</tr>

<tr>
<td colspan="3">
<asp:Label ID="lblOutput" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
</td>
</tr>

<tr>
<td colspan="3">
<asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:" ShowSummary="True" ShowMessageBox="False" />
</td>
</tr>
</table>
</form>
</body>
</html>