<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopDown.ascx.cs" Inherits="Web_Common_UserControls_TopDown" %>

<table cellpadding="0" cellspacing="0" width="200px" align="center">
    <tr>
        <td bgcolor="#F4F4F4" class="SideBarHeader">
            <asp:Label ID="lblTitle" runat="server" Text="كۆپ چۈشۈرۈلگەن فىلىملەر"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" align="center">
            <asp:DataList ID="dlTopDown" runat="server" HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                   <div>
                   <div>
                   <a href='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>'>
                        <asp:Image ID="Image1" runat="server" Height="128px" 
                        ImageUrl='<%# Eval("Cover") %>' Width="96px" />
                        </a>
                    </div>
                    
                    <div>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>' 
                        Text='<%# Eval("Name") %>'></asp:HyperLink>
                        </div>
                    <br />
                    </div>
                    
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<asp:HiddenField ID="hfCount" runat="server" Value="5" />
