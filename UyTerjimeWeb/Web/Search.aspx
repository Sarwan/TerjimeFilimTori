<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Web_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
                <asp:Label ID="lblKeyWord" runat="server" Text="ئاچقۇچلۇق سۆز:"></asp:Label>
                <asp:TextBox ID="txtKeyWord" runat="server" Width="300px">پالۋان</asp:TextBox>
                <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem Value="0">بارلىق</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="ئىزدە" />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                    
                        <asp:GridView ID="gvMovies" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataKeyNames="ID" ForeColor="#333333" GridLines="None" 
                            PageSize="20" Width="100%" ShowHeader="False" UseAccessibleHeader="False" 
                            onpageindexchanging="gvMovies_PageIndexChanging">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:ImageField DataImageUrlField="Cover">
                                    <ControlStyle Height="128px" Width="96px" />
                                    <ItemStyle Height="128px" Width="96px" />
                                </asp:ImageField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0" >
                                            <tr>
                                                <td valign="top" width="40%">
                                                    فىلىم نامى:<asp:HyperLink ID="HyperLink1" runat="server" 
                                                        NavigateUrl='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>' 
                                                        Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                    (<asp:Label ID="Label1" runat="server" Text='<%# Eval("OtherName") %>'></asp:Label>
                                                    )<br />
                                                    تارقىتىلغان ۋاقتى:<asp:Label ID="Label2" runat="server" 
                                                        Text='<%# Eval("ReleaseTime", "{0:d}") %>' ></asp:Label>
                                                    <br />
                                                    تىلى:<asp:Label ID="Label3" runat="server" Text='<%# Eval("Language") %>'></asp:Label>
                                                    <br />
                                                    يېزىقى:<asp:Label ID="Label4" runat="server" Text='<%# Eval("Subtitle") %>'></asp:Label>
                                                    <br />
                                                    دۆلىتى:<asp:Label ID="Label5" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                                                    <br />
                                                    <asp:HyperLink ID="HyperLink2" runat="server" 
                                                        NavigateUrl='<%# Eval("ID", "~/Web/Watch.aspx?id={0}") %>'>كۆرۈش</asp:HyperLink>
                                                </td>
                                                <td valign="top" width="60%">
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Reduce( Eval("Descraption").ToString()) %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

