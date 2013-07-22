<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MArticleCatogory.aspx.cs" Inherits="Web_Manage_MArticleCatogory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td style="text-align: center">
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="Title" 
                    style="text-align: center" Text="ماقالە(خەۋەر)سەھىپىسى باشقۇرۇش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvArticleCatgory" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsArticleCatogory" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="gvArticleCatgory_SelectedIndexChanged" 
                    Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="سەھىپە نامى" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="Descraption" HeaderText="سەھىپە چۈشەندۈرىشى" 
                            SortExpression="Descraption" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:CommandField CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" 
                            EditText="تەھرىرلەش" HeaderText="باشقۇرۇش" SelectText="تاللاش" 
                            ShowEditButton="True" ShowSelectButton="True" UpdateText="ئۆزگەرتىش" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsArticleCatogory" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                    TableName="ArticleCatogries">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="قوشۇش" />
                <asp:HiddenField ID="hfCatID" runat="server" />
                <asp:DetailsView ID="dvCat" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOneCat" ForeColor="#333333" 
                    GridLines="None" Height="50px" oniteminserted="dvCat_ItemInserted" 
                    onitemupdated="dvCat_ItemUpdated" Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نۇمۇرى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="سەھىپە نامى:" 
                            SortExpression="Name">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Descraption" HeaderText="سەھىپە چۈشەندۈرىشى:" 
                            SortExpression="Descraption">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھرىرلەش" 
                            InsertText="قوشۇش" NewText="سەھىپە قوشۇش" ShowEditButton="True" 
                            ShowInsertButton="True" UpdateText="ئۆزگەرتىش" />
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsOneCat" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="ArticleCatogries" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfCatID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

