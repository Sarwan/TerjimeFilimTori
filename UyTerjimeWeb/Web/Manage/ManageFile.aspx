<%@ Page Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="ManageFile.aspx.cs" Inherits="Web_FileManagement_MFile" Title="ھۆججەت باشقۇرۇش" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 100%" border="1px" cellpadding="0" cellspacing="0">
        <tr>
            <td style="text-align: center">
                <br />
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="ھۆججەت باشقۇرۇش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnHome" runat="server" Text="باش مۇندەرىجە" OnClick="btnHome_Click" CssClass="Button" SkinID="btnHome" />
                <asp:Button ID="btnUp" runat="server" Text="ئۈستىگە" OnClick="btnUp_Click" CssClass="Button" SkinID="btnUp" />
                &nbsp;<asp:Label ID="lblUrl" runat="server" Text="URL:"></asp:Label><asp:TextBox ID="txtUrl" runat="server" ReadOnly="True" Width="400px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvFiles" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" OnRowDeleting="gvFiles_RowDeleting" OnSelectedIndexChanged="gvFiles_SelectedIndexChanged"
                    Width="100%" SkinID="gvFiles">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="FileExtension" 
                            DataImageUrlFormatString="~/Web/Common/images/FileType/{0}.png">
                            <ControlStyle Height="32px" Width="32px" />
                        </asp:ImageField>
                        <asp:CommandField ShowSelectButton="True" DeleteText="ئۆچۈرۈش" SelectText="تاللاش" />
                        <asp:BoundField DataField="Name" HeaderText="ھۆججەت نامى" />
                        <asp:BoundField DataField="FileExtension" HeaderText="تىپى" />
                        <asp:BoundField DataField="IsFolder" HeaderText="مۇدەرىجە" />
                        <asp:BoundField DataField="Size" HeaderText="سىغىمى" />
                        <asp:BoundField DataField="Created" HeaderText="قۇرۇلغان ۋاقتى" />
                        <asp:BoundField DataField="Modified" HeaderText="ئۆزگەرتىلگەن ۋاقتى" />
                        <asp:CommandField ShowDeleteButton="True" HeaderText="ئۆچۈرۈش" 
                            CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" EditText="تەھرىرلەش" 
                            InsertText="قىستۇرۇش" NewText="قۇرۇش" SelectText="تاللاش" 
                            UpdateText="ئۆزگەرتىش" />
                    </Columns>
                    <RowStyle BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFoldrName" runat="server" Text="مۇندەرىجە نامى:" SkinID="lblFoldrName"></asp:Label>
                <asp:TextBox ID="txtFolderName" runat="server" ValidationGroup="CreateDir"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDir" runat="server" ControlToValidate="txtFolderName"
                    ValidationGroup="CreateDir">*</asp:RequiredFieldValidator>
                <asp:Button ID="btnCreateFolder" runat="server" OnClick="btnCreateFolder_Click" Text="يىڭى مۇندەرىجە قۇرۇش"
                    ValidationGroup="CreateDir" CssClass="Button" SkinID="btnCreateFolder" />
                &nbsp; &nbsp;<br />
                <asp:Label ID="lblFileName" runat="server" Text="ھۆججەت ئادرىسى:" SkinID="lblFileName"></asp:Label>
                <asp:FileUpload ID="fuFile" runat="server" Width="405px" />
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="ھۆججەت يوللاش" CssClass="Button" SkinID="btnUpload" /></td>
        </tr>
    </table>
</asp:Content>

