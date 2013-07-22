<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MMenu.aspx.cs" Inherits="Web_Manage_MMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvMenu" runat="server" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                    DataSourceID="ldsMenu" ForeColor="#333333" GridLines="None" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Url" HeaderText="Url" SortExpression="Url" />
                        <asp:CheckBoxField DataField="State" HeaderText="State" 
                            SortExpression="State" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Target" HeaderText="Target" 
                            SortExpression="Target" />
                        <asp:BoundField DataField="Serial" HeaderText="Serial" 
                            SortExpression="Serial" />
                        <asp:BoundField DataField="Parent" HeaderText="Parent" 
                            SortExpression="Parent" />
                        <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsMenu" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableInsert="True" 
                    EnableUpdate="True" OrderBy="Parent, Serial" TableName="Menus">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

