<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Recommends.ascx.cs" Inherits="Web_Common_UserControls_Recommends" %>
<table cellpadding="0" cellspacing="0" width="200px">
    <tr>
        <td bgcolor="#F4F4F4" class="SideBarHeader">
            <asp:Label ID="lblTitle" runat="server" Text="تەۋىسسىيەلىك فىلىملار"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:DataList ID="dlTopRecommends" runat="server" DataSourceID="ldsRecommends" 
                HorizontalAlign="Center">
                <ItemTemplate>
                   
                   <a href='<%# Eval("MovieID", "~/Web/Movie.aspx?id={0}") %>'>
                        <asp:Image ID="Image1" runat="server" Height="128px" 
                        ImageUrl='<%# Eval("Movie.Cover") %>' Width="96px" />
                        </a>
                    
                    
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("MovieID", "~/Web/Movie.aspx?id={0}") %>' 
                        Text='<%# Eval("Movie.Name") %>'></asp:HyperLink>
                    <br />
                    
                    
                </ItemTemplate>
            </asp:DataList>
            <asp:LinqDataSource ID="ldsRecommends" runat="server" 
                ContextTypeName="dcUTWDataContext" OrderBy="AddTime desc, ID desc" 
                Select="new (ID, MovieID, AddTime, Movie)" TableName="Recommends" 
                Where="State == @State">
                <WhereParameters>
                    <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>
    </tr>
</table>
<asp:HiddenField ID="hfCount" runat="server" Value="5" />