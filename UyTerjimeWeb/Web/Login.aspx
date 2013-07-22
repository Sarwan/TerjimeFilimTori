<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Web_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="text-align: center">
                
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="كىرىش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
    <table align="center" cellpadding="0" cellspacing="0"  width="480px" border="0" >
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="نامى:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="پارول:"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="rfvPass" runat="server" 
                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPass">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:Button ID="btnLogin" runat="server" Text="كىرىش" 
                onclick="btnLogin_Click" />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="بىكار قىلىش" 
                CausesValidation="False" onclick="btnCancel_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:Label ID="lblMSG" runat="server" ForeColor="#CC0000"></asp:Label>
        </td>
    </tr>
</table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

