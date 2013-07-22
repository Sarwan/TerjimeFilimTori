<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MWorkingMovie.aspx.cs" Inherits="Web_Manage_MWorkingMovie" %>

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
                    Text="ئىشلىنىۋاتقان فىلىملەرنى باشقۇرۇش"></asp:Label>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvWorkingMovies" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsWorkingMovie" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="gvWorkingMovies_SelectedIndexChanged" 
                    Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:HyperLinkField DataNavigateUrlFields="Url" DataTextField="Name" 
                            HeaderText="فىلىم نامى" />
                        <asp:HyperLinkField DataNavigateUrlFields="IMDBUrl" DataTextField="OtherName" 
                            HeaderText="باشقا نامى" SortExpression="OtherName" />
                        <asp:BoundField DataField="IMDBID" HeaderText="IMDBID" 
                            SortExpression="IMDBID" />
                        <asp:BoundField DataField="ReleaseTime" DataFormatString="{0:d}" 
                            HeaderText="تارقىتىلغان ۋاقتى" SortExpression="ReleaseTime" />
                        <asp:BoundField DataField="Country" HeaderText="دۆلەت" 
                            SortExpression="Country" />
                        <asp:BoundField DataField="Language" HeaderText="تىل" 
                            SortExpression="Language" />
                        <asp:BoundField DataField="Source" HeaderText="مەنبەسى" 
                            SortExpression="Source" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:TemplateField HeaderText="ئىشلىنىش ھالىتى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                                    SelectedValue='<%# Bind("WorkingState") %>'>
                                    <asp:ListItem Value="0">پىلانلاندى</asp:ListItem>
                                    <asp:ListItem Value="1">تەرجىمە قىلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="2">تەھرىرلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="3">ئىملا تۈزىتىلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="4">كىرىشتۈرلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="5">تارقىتىلدى</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" 
                                    SelectedValue='<%# Bind("WorkingState") %>'>
                                    <asp:ListItem Value="0">پىلانلاندى</asp:ListItem>
                                    <asp:ListItem Value="1">تەرجىمە قىلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="2">تەھرىرلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="3">ئىملا تۈزىتىلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="4">كىرىشتۈرلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="5">تارقىتىلدى</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                        <asp:CommandField HeaderText="باشقۇرۇش" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsWorkingMovie" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableInsert="True" 
                    EnableUpdate="True" TableName="WorkingMovies">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="قوشۇش" />
                <asp:HiddenField ID="hfOneMoveID" runat="server" />
                <asp:DetailsView ID="dvOneWorkingMovie" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOneWorkingMovie" 
                    ForeColor="#333333" GridLines="None" Height="50px" 
                    oniteminserted="dvOneWorkingMovie_ItemInserted" 
                    oniteminserting="dvOneWorkingMovie_ItemInserting" 
                    onitemupdated="dvOneWorkingMovie_ItemUpdated" Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نۇمۇرى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="فىلىم نامى:" SortExpression="Name">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cover" HeaderText="فىلىم رەسىمى:" 
                            SortExpression="Cover">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OtherName" HeaderText="باشقا نامى:" 
                            SortExpression="OtherName">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="تارقىتىلغان ۋاقتى:">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("ReleaseTime", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:TextBox>
                                <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBox1">
                                </cc1:CalendarExtender>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReleaseTime") %>'></asp:TextBox>
                                <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBox1">
                                </cc1:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Country" HeaderText="دۆلەت:" 
                            SortExpression="Country">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Language" HeaderText="تىلى:" 
                            SortExpression="Language">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IMDBUrl" HeaderText="IMDB ئادرىسى:" 
                            SortExpression="IMDBUrl">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IMDBID" HeaderText="IMDB تەرتىپ نۇمۇرى:" 
                            SortExpression="IMDBID">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Source" HeaderText="مەنبەسى:" 
                            SortExpression="Source">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:BoundField DataField="Url" HeaderText="ئادىرىسى:" SortExpression="Url">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ئىشلىنىش ھالىتى:">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                                    SelectedValue='<%# Bind("WorkingState") %>'>
                                    <asp:ListItem Value="0">پىلانلاندى</asp:ListItem>
                                    <asp:ListItem Value="1">تەرجىمە قىلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="2">تەھرىرلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="3">ئىملا تۈزىتىلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="4">كىرىشتۈرلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="5">تارقىتىلدى</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("WorkingState") %>'>
                                    <asp:ListItem Value="0">پىلانلاندى</asp:ListItem>
                                    <asp:ListItem Value="1">تەرجىمە قىلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="2">تەھرىرلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="3">ئىملا تۈزىتىلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="4">كىرىشتۈرلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="5">تارقىتىلدى</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("WorkingState") %>'>
                                    <asp:ListItem Value="0">پىلانلاندى</asp:ListItem>
                                    <asp:ListItem Value="1">تەرجىمە قىلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="2">تەھرىرلىنىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="3">ئىملا تۈزىتىلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="4">كىرىشتۈرلىۋاتىدۇ</asp:ListItem>
                                    <asp:ListItem Value="5">تارقىتىلدى</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
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
                <asp:LinqDataSource ID="ldsOneWorkingMovie" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="WorkingMovies" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfOneMoveID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

