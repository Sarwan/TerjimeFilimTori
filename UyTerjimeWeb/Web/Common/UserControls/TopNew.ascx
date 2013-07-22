<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNew.ascx.cs" Inherits="Web_Common_UserControls_TopNew" %>

<table cellpadding="0" cellspacing="0" width="200px" align="center">
    <tr>
        <td bgcolor="#F4F4F4" class="SideBarHeader">
            <asp:Label ID="lblTitle" runat="server" Text="يىڭى فىلىملەر"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:DataList ID="dlTopNew" runat="server" HorizontalAlign="Center">
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
            <asp:LinqDataSource ID="ldsNewMovie" runat="server" 
                ContextTypeName="dcUTWDataContext" OrderBy="AddTime desc, ID desc" 
                Select="new (ID, Name, Cover)" TableName="Movies" Where="State == @State">
                <WhereParameters>
                    <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>
    </tr>
</table>
<asp:HiddenField ID="hfCount" runat="server" Value="5" />
