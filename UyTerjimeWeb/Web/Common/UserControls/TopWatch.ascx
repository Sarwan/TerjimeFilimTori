<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopWatch.ascx.cs" Inherits="Web_Common_UserControls_TopWatch" %>

<table cellpadding="0" cellspacing="0" width="200px">
    <tr>
        <td bgcolor="#F4F4F4" class="SideBarHeader">
            <asp:Label ID="lblTitle" runat="server" Text="كۆپ كۆرۈلگەن فىلىملەر"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:DataList ID="dlTopWatch" runat="server" HorizontalAlign="Center">
                <ItemTemplate>
                   
                   <a href='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>'>
                        <asp:Image ID="Image1" runat="server" Height="128px" 
                        ImageUrl='<%# Eval("Cover") %>' Width="96px" />
                        </a>
                    
                    
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>' 
                        Text='<%# Eval("Name") %>'></asp:HyperLink>
                    <br />
                    
                    
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<asp:HiddenField ID="hfCount" runat="server" Value="5" />
