<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MDownloads.aspx.cs" Inherits="Web_Manage_MDownloads" %>

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
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" 
                    Text="چۈشۈرۈلمە باشقۇرۇش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvDowns" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsDownloads" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="gvDowns_SelectedIndexChanged" 
                    Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نومۇرى" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="نامى" SortExpression="Name" />
                        <asp:BoundField DataField="Type" HeaderText="تۈرى" SortExpression="Type" />
                        <asp:BoundField DataField="Url" HeaderText="ئادرىسى" SortExpression="Url" />
                        <asp:BoundField DataField="AddTime" DataFormatString="{0:d}" 
                            HeaderText="قوشۇلغان ۋاقتى" InsertVisible="False" ReadOnly="True" 
                            SortExpression="AddTime" />
                        <asp:BoundField DataField="Descraption" HeaderText="چۈشەندۈرلىشى" 
                            SortExpression="Descraption" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرلىشى" 
                            InsertVisible="False" ReadOnly="True" SortExpression="DownCount" />
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
                <asp:LinqDataSource ID="ldsDownloads" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                    TableName="Downloads">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="قوشۇش" />
                <asp:HiddenField ID="hfDownID" runat="server" Value="0" />
                <asp:DetailsView ID="dvDown" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOneDown" ForeColor="#333333" 
                    GridLines="None" Height="50px" oniteminserted="dvDown_ItemInserted" 
                    oniteminserting="dvDown_ItemInserting" onitemupdated="dvDown_ItemUpdated" 
                    Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نومۇرى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="نامى:" SortExpression="Name">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Type" HeaderText="تۈرى:" SortExpression="Type">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Url" HeaderText="ئادرىسى:" SortExpression="Url">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                        <asp:TemplateField HeaderText="چۈشەندۈرلىشى:">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" 
                                    Text='<%# Bind("Descraption") %>' TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" 
                                    Text='<%# Bind("Descraption") %>' TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Descraption") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="80%" />
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرلىشى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="DownCount" />
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
                <asp:LinqDataSource ID="ldsOneDown" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Downloads" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfDownID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

