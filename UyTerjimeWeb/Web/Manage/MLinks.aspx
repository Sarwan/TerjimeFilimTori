<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MLinks.aspx.cs" Inherits="Web_Manage_MLinks" %>

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
            <asp:Label ID="lblTitle" runat="server" CssClass="Title" 
                Text="ئۇلىنىش باشقۇرۇش"></asp:Label>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvLinks" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="ldsLinks" ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="gvLinks_SelectedIndexChanged" Width="100%">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="ئۇلىنىش نامى" 
                        SortExpression="Title" />
                    <asp:BoundField DataField="Url" HeaderText="Url" SortExpression="Url" />
                    <asp:CheckBoxField DataField="IsImageLink" HeaderText="رەسىملىكمۇ؟" 
                        SortExpression="IsImageLink" />
                    <asp:BoundField DataField="Serial" HeaderText="تەرتىپى" 
                        SortExpression="Serial" />
                    <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                        SortExpression="State" />
                    <asp:BoundField DataField="AddTime" DataFormatString="{0:d}" 
                        HeaderText="قوشۇلغان ۋاقتى" ReadOnly="True" SortExpression="AddTime" />
                    <asp:CommandField CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" 
                        EditText="تەھرىرلەش" SelectText="تاللاش" ShowSelectButton="True" 
                        UpdateText="ئۆزگەرتىش" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" 
                Text="ئۇلىنىش قوشۇش" />
            <asp:LinqDataSource ID="ldsLinks" runat="server" 
                ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                OrderBy="IsImageLink, Serial, State" TableName="Links">
            </asp:LinqDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:DetailsView ID="dvOneLink" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataKeyNames="ID" DataSourceID="LinqDataSource1" 
                ForeColor="#333333" GridLines="None" Height="50px" 
                oniteminserted="dvLink_ItemInserted" oniteminserting="dvLink_ItemInserting" 
                onitemupdated="dvLink_ItemUpdated" Width="100%">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <RowStyle BackColor="#EFF3FB" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="تەرتىپ نومۇرى:" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Title" HeaderText="تىمىسى:" SortExpression="Title" />
                    <asp:BoundField DataField="Descraption" HeaderText="چۈشەندۈرۈش:" 
                        SortExpression="Descraption" />
                    <asp:BoundField DataField="Url" HeaderText="Url:" SortExpression="Url" />
                    <asp:BoundField DataField="Image" HeaderText="رەسىمى:" SortExpression="Image" />
                    <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                        SortExpression="State" />
                    <asp:CheckBoxField DataField="IsImageLink" HeaderText="رەسىملىكمۇ؟" 
                        SortExpression="IsImageLink" />
                    <asp:BoundField DataField="Serial" HeaderText="تەرتىپى:" 
                        SortExpression="Serial" />
                    <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" 
                        InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                    <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھرىرلەش" 
                        InsertText="قوشۇش" NewText="قوشۇش" ShowEditButton="True" 
                        ShowInsertButton="True" UpdateText="ئۆزگەرتىش">
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Fields>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:DetailsView>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                TableName="Links" Where="ID == @ID">
                <WhereParameters>
                    <asp:ControlParameter ControlID="hfLinkID" DefaultValue="0" Name="ID" 
                        PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:HiddenField ID="hfLinkID" runat="server" Value="0" />
        </td>
    </tr>
</table>
</asp:Content>

