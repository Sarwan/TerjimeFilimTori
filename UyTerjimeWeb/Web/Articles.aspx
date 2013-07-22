<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Articles.aspx.cs" Inherits="Web_Articles" %>

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
                <br />
                <asp:Label ID="lblTitle" runat="server" CssClass="Title"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvArticles" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsArticles" ForeColor="#333333" 
                    GridLines="None" PageSize="20" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="ID" 
                            DataNavigateUrlFormatString="~/Web/Article.aspx?id={0}" DataTextField="Title" 
                            HeaderText="تىمىسى" SortExpression="Title">
                        <ItemStyle HorizontalAlign="Right" Width="80%" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="AddTime" DataFormatString="{0:d}" 
                            HeaderText="يوللانغان ۋاقتى" SortExpression="AddTime">
                        <ItemStyle Width="20%" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsArticles" runat="server" 
                    ContextTypeName="dcUTWDataContext" OrderBy="AddTime desc, ID desc" 
                    Select="new (ID, Title, AddTime, VistCount)" TableName="Articles" 
                    Where="Catgory == @Catgory &amp;&amp; State == @State">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="Catgory" 
                            QueryStringField="CatID" Type="Int32" />
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

