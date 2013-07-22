<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TextLinks.ascx.cs" Inherits="Web_Common_UserControls_TextLinks" %>
<table cellpadding="0" cellspacing="0" width="200px" align="center">
    <tr>
        <td bgcolor="#F4F4F4" class="SideBarHeader">
            <asp:Label ID="lblTitle" runat="server" Text="ئۇلىنىشلار"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" align="center">
           
            <asp:DataList ID="DataList1" runat="server" DataSourceID="ldsTextLinks" 
                HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Url") %>' 
                        Text='<%# Eval("Title") %>'></asp:HyperLink>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:LinqDataSource ID="ldsTextLinks" runat="server" 
                ContextTypeName="dcUTWDataContext" OrderBy="Serial" 
                Select="new (ID, Title, Descraption, Url, AddTime)" TableName="Links" 
                Where="State == @State &amp;&amp; IsImageLink == @IsImageLink">
                <WhereParameters>
                    <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                    <asp:Parameter DefaultValue="False" Name="IsImageLink" Type="Boolean" />
                </WhereParameters>
            </asp:LinqDataSource>
           
        </td>
    </tr>
</table>
<asp:HiddenField ID="hfCount" runat="server" Value="5" />