<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="Web_Article" %>

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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" 
                    DataSourceID="ldsArticle">
                    <ItemTemplate>
                        <asp:Label ID="TitleLabel" runat="server" CssClass="Title" Text='<%# Eval("Title") %>' />
                        <br />
                       
                        <asp:Label ID="ArticleContentLabel" runat="server" 
                            Text='<%# Eval("ArticleContent") %>' />
                        <br />
                        
                        <br />
                        يوللانغان ۋاقتى:
                        <asp:Label ID="AddTimeLabel" runat="server" 
                            Text='<%# Eval("AddTime", "{0:D}") %>' />
                        <br />
                       يوللىغۇچى:
                        <asp:Label ID="ManagerIDLabel" runat="server" Text='<%# Eval("Manager.Name") %>' />
                        <br />
                        زىيارەت:
                        <asp:Label ID="VistCountLabel" runat="server" Text='<%# Eval("VistCount") %>' />
                        <br />
                        سەھىپىسى:
                        <asp:Label ID="ArticleCatogryLabel" runat="server" 
                            Text='<%# Eval("ArticleCatogry.Name") %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:LinqDataSource ID="ldsArticle" runat="server" 
                    ContextTypeName="dcUTWDataContext" TableName="Articles" 
                    Where="ID == @ID &amp;&amp; State == @State">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="ID" QueryStringField="ID" 
                            Type="Int64" />
                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

