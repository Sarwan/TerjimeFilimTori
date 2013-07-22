<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MMovieAdress.aspx.cs" Inherits="Web_Manage_MMovieAdress" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
                    Text="فىلىم ئادرىسى باشقۇرۇش"></asp:Label>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvMovieAddress" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsMovieAddress" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="gvMovieAddress_SelectedIndexChanged" 
                    Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="ID" />
                        <asp:HyperLinkField DataNavigateUrlFields="MovieID" 
                            DataNavigateUrlFormatString="~/Web/Movie.aspx?id={0}" DataTextField="ID" 
                            DataTextFormatString="فىلىم نۇمۇرى:{0}" HeaderText="فىلىم نۇمۇرى" 
                            SortExpression="MovieID" />
                        <asp:HyperLinkField DataNavigateUrlFields="Url" 
                            DataNavigateUrlFormatString="{0}" HeaderText="ئادرىسى" Text="Url" />
                        <asp:BoundField DataField="FileType" HeaderText="ھۆججەت تىپى" 
                            SortExpression="FileType" />
                        <asp:BoundField DataField="Resolution" HeaderText="ئىنىقلىقى" 
                            SortExpression="Resolution" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="Size" DataFormatString="{0}MB" HeaderText="سىغىمى" 
                            SortExpression="Size" />
                        <asp:BoundField DataField="MovieTime" DataFormatString="{0} مىنۇت" 
                            HeaderText="ئۇزۇنلۇقى" SortExpression="MovieTime" />
                        <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرلىشى" 
                            SortExpression="DownCount" />
                        <asp:BoundField DataField="WatchCount" HeaderText="كۆرۈلىشى" 
                            SortExpression="WatchCount" Visible="False" />
                        <asp:BoundField DataField="AddTime" DataFormatString="{0:d}" 
                            HeaderText="قوشۇلغان ۋاقتى" SortExpression="AddTime" />
                        <asp:CommandField DeleteText="ئۆچۈر(!)" HeaderText="تاللاش" SelectText="تاللاش" 
                            ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsMovieAddress" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" TableName="MovieAddrs">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="hfMovieAddressID" runat="server" />
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" 
                    Text="ئادرىس قوشۇش" />
                <br />
                <asp:DetailsView ID="dvMovieAddress" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOneAddress" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" Height="50px" 
                    oniteminserted="dvMovieAddress_ItemInserted" 
                    oniteminserting="dvMovieAddress_ItemInserting" 
                    onitemupdated="dvMovieAddress_ItemUpdated" 
                    onitemupdating="dvMovieAddress_ItemUpdating" Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" 
                        HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نۇمۇرى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:TemplateField HeaderText="فىلىم:">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ldsMovie" 
                                    DataTextField="Name" DataValueField="ID" Enabled="False" 
                                    SelectedValue='<%# Bind("MovieID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsMovie" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Movies" 
                                    Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ldsMovie" 
                                    DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("MovieID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsMovie" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Movies" 
                                    Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ldsMovie" 
                                    DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("MovieID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsMovie" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Movies" 
                                    Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Url" HeaderText="ئادرىسى:" SortExpression="Url" />
                        <asp:BoundField DataField="FileType" HeaderText="ھۆججەت تىپى:" 
                            SortExpression="FileType" />
                        <asp:BoundField DataField="Resolution" HeaderText="ئىنىقلىقى:" 
                            SortExpression="Resolution" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:TemplateField HeaderText="فىلىم ئۇزۇنلۇقى:">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("MovieTime") %>'></asp:Label>
                                مىنۇت
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MovieTime") %>'></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RangeValidator" MaximumValue="500" 
                                    MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                مىنۇت
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MovieTime") %>'></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RangeValidator" MaximumValue="500" 
                                    MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                مىنۇت
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Size" DataFormatString="{0}MB" 
                            HeaderText="سىغىمى(MB):" SortExpression="Size" />
                        <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرلىشى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="DownCount" />
                        <asp:BoundField DataField="WatchCount" HeaderText="كۆرۈلىشى" 
                            InsertVisible="False" ReadOnly="True" SortExpression="WatchCount" 
                            Visible="False" />
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                        <asp:CommandField />
                        <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھرىرلەش" 
                            InsertText="قوشۇش" NewText="قوشۇش" ShowEditButton="True" 
                            ShowInsertButton="True" UpdateText="ئۆزگەرتىش" />
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsOneAddress" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="MovieAddrs" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfMovieAddressID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

