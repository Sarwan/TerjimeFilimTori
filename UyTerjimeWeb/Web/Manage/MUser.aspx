<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MUser.aspx.cs" Inherits="Web_Manage_MUser" %>

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
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="ئەزا باشقۇرۇش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsUsers" ForeColor="#333333" GridLines="None" 
                    onselectedindexchanged="gvUsers_SelectedIndexChanged" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="نامى" ReadOnly="True" 
                            SortExpression="Name" />
                        <asp:TemplateField HeaderText="تۈرى">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                    <asp:ListItem Value="1">سىستىما باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="2">باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="3">تەھرىر</asp:ListItem>
                                    <asp:ListItem Value="4">ئەزا</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                    <asp:ListItem Value="1">سىستىما باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="2">باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="3">تەھرىر</asp:ListItem>
                                    <asp:ListItem Value="4">ئەزا</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="Password" DataFormatString="******" 
                            HeaderText="پارول" ReadOnly="True" SortExpression="Password" />
                        <asp:BoundField DataField="Email" HeaderText="ئېلخەت" SortExpression="Email" />
                        <asp:BoundField DataField="TelePhone" HeaderText="تېلېفۇن" 
                            SortExpression="TelePhone" />
                        <asp:BoundField DataField="Task" HeaderText="ۋەزىپىسى" SortExpression="Task" />
                        <asp:BoundField DataField="AddTime" DataFormatString="{0:d}" 
                            HeaderText="قوشۇلغان ۋاقتى" InsertVisible="False" ReadOnly="True" 
                            SortExpression="AddTime" />
                        <asp:CommandField EditText="تەھرىرلەش" HeaderText="باشقۇرۇش" 
                            SelectText="تاللاش" ShowEditButton="True" ShowSelectButton="True" 
                            UpdateText="ئۆزگەرتىش" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsUsers" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableUpdate="True" TableName="Managers" 
                    Where="Type != @Type">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="Type" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:Button ID="btnAdd" runat="server" Text="يىڭى ئەزا قوشۇش" />
                <br />
                <asp:Label ID="lblMSG" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="dvUser" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsUser" ForeColor="#333333" 
                    GridLines="None" Height="50px" oniteminserted="dvUser_ItemInserted" 
                    oniteminserting="dvUser_ItemInserting" onitemupdated="dvUser_ItemUpdated" 
                    onitemupdating="dvUser_ItemUpdating" Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نۇمۇرى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="نامى:" ReadOnly="True" 
                            SortExpression="Name" />
                        <asp:TemplateField HeaderText="تۈرى:">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                    <asp:ListItem Value="2">باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="3">تەھرىر</asp:ListItem>
                                    <asp:ListItem Value="4">ئەزا</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                    <asp:ListItem Value="2">باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="3">تەھرىر</asp:ListItem>
                                    <asp:ListItem Value="4">ئەزا</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" 
                                    SelectedValue='<%# Bind("Type") %>'>
                                    <asp:ListItem Value="1">سىستىما باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="2">باشقۇرغۇچى</asp:ListItem>
                                    <asp:ListItem Value="3">تەھرىر</asp:ListItem>
                                    <asp:ListItem Value="4">ئەزا</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:TemplateField HeaderText="پارول:">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>' 
                                    TextMode="Password"></asp:TextBox>
                                (ئۆزگەرتمىسىڭىز بوش قالدۇرۇڭ)
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>' 
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="TextBox1" ControlToValidate="TextBox2" 
                                    ErrorMessage="CompareValidator">*</asp:CompareValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Password", "******") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Email" HeaderText="ئېلخەت:" SortExpression="Email" />
                        <asp:BoundField DataField="TelePhone" HeaderText="تېلېفۇن:" 
                            SortExpression="TelePhone" />
                        <asp:BoundField DataField="Task" HeaderText="ۋەزىپىسى:" SortExpression="Task">
                        <ItemStyle Width="80%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
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
                <asp:LinqDataSource ID="ldsUser" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Managers" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfUserID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:HiddenField ID="hfUserID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

