<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MAdvertize.aspx.cs" Inherits="Web_Manage_MAdvertize" %>

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
            <td style="text-align: center">
                <br />
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="ئېلان باشقۇرۇش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvAdv" runat="server" AllowPaging="True" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
                    DataSourceID="ldsAdvs" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="gvAdv_SelectedIndexChanged" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Url" HeaderText="رەسىم ئادرىسى" 
                            SortExpression="Url" />
                        <asp:BoundField DataField="Title" HeaderText="تىمىسى" SortExpression="Title" />
                        <asp:BoundField DataField="NavUrl" HeaderText="ئۇلىنىش ئادرىسى" 
                            SortExpression="NavUrl" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="AddTime" DataFormatString="{0:d}" 
                            HeaderText="قوشۇلغان ۋاقتى" InsertVisible="False" ReadOnly="True" 
                            SortExpression="AddTime" />
                        <asp:CommandField CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" 
                            EditText="تەھرىرلەش" HeaderText="باشقۇرۇش" InsertText="قوشۇش" NewText="قوشۇش" 
                            SelectText="تاللاش" ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" UpdateText="ئۆزگەرتىش" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsAdvs" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                    TableName="Advertizements">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="قوشۇش" />
                <br />
                <asp:DetailsView ID="dvAdv" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOneAdv" ForeColor="#333333" 
                    GridLines="None" Height="50px" oniteminserted="dvAdv_ItemInserted" 
                    oniteminserting="dvAdv_ItemInserting" onitemupdated="dvAdv_ItemUpdated" 
                    Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نومۇرى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Url" HeaderText="رەسىم ئادرىسى:" 
                            SortExpression="Url" />
                        <asp:BoundField DataField="Title" HeaderText="تىمىسى:" SortExpression="Title" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                        <asp:BoundField DataField="NavUrl" HeaderText="ئۇلىنىش ئادرىسى:" 
                            SortExpression="NavUrl" />
                        <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھىرلەش" 
                            InsertText="قوشۇش" NewText="قوشۇش" ShowEditButton="True" 
                            ShowInsertButton="True" UpdateText="ئۆزگەرتىش">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsOneAdv" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Advertizements" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfAdvID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:HiddenField ID="hfAdvID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

