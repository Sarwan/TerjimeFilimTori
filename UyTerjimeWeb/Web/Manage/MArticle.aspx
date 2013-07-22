<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MArticle.aspx.cs" Inherits="Web_Manage_MArticle" %>

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
                    Text="ماقالە(خەۋەر) باشقۇرۇش"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvArticles" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsArticles" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="gvArticles_SelectedIndexChanged" 
                    Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="ID" />
                        <asp:BoundField DataField="Title" HeaderText="تىمىسى" SortExpression="Title" />
                        <asp:TemplateField HeaderText="سەھىپىسى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsArticleCatgory" DataTextField="Name" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("Catgory") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsArticleCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="ArticleCatogries" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="AddTime" HeaderText="يېزىلغان ۋاقتى" 
                            SortExpression="AddTime" />
                        <asp:TemplateField HeaderText="يازغۇچى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsManager" 
                                    DataTextField="Name" DataValueField="ID" Enabled="False" 
                                    SelectedValue='<%# Bind("ManagerID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsManager" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Managers">
                                </asp:LinqDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="VistCount" HeaderText="زىيارەت سانى" 
                            SortExpression="VistCount" />
                        <asp:CommandField HeaderText="باشقۇرۇش" SelectText="تاللاش" 
                            ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="قوشۇش" />
                <asp:LinqDataSource ID="ldsArticles" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Articles">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="dvArticle" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOneArticle" 
                    ForeColor="#333333" GridLines="None" Height="50px" 
                    oniteminserted="dvArticle_ItemInserted" 
                    oniteminserting="dvArticle_ItemInserting" onitemupdated="dvArticle_ItemUpdated" 
                    Width="100%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:TemplateField HeaderText="سەھىپە:">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsArticleCatgory" DataTextField="Name" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("Catgory") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsArticleCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="ArticleCatogries" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsArticleCatgory" DataTextField="Name" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Catgory") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsArticleCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="ArticleCatogries" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldsArticleCatgory" DataTextField="Name" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Catgory") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsArticleCatgory" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" 
                                    TableName="ArticleCatogries" Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="تىمىسى:" SortExpression="Title">
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="مەزمۇنى:">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ArticleContent") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" 
                                    Text='<%# Bind("ArticleContent") %>' TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="300px" 
                                    Text='<%# Bind("ArticleContent") %>' TextMode="MultiLine" Width="95%"></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:BoundField DataField="AddTime" HeaderText="يېزىلغان ۋاقتى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                        <asp:TemplateField HeaderText="يازغۇچى:">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsManager" 
                                    DataTextField="Name" DataValueField="ID" Enabled="False" 
                                    SelectedValue='<%# Bind("ManagerID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsManager" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Managers">
                                </asp:LinqDataSource>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsManager" 
                                    DataTextField="Name" DataValueField="ID" Enabled="False" 
                                    SelectedValue='<%# Bind("ManagerID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsManager" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Managers">
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsManager" 
                                    DataTextField="Name" DataValueField="ID" Enabled="False" 
                                    SelectedValue='<%# Bind("ManagerID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsManager" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Managers">
                                </asp:LinqDataSource>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="VistCount" HeaderText="زىيارەت سانى:" 
                            InsertVisible="False" ReadOnly="True" SortExpression="VistCount" />
                        <asp:CommandField CancelText="بىكار قىلىش" EditText="تەھرىرلەش" 
                            InsertText="يوللاش" NewText="تىما يوللاش" ShowEditButton="True" 
                            ShowInsertButton="True" UpdateText="ئۆزگەرتىش">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsOneArticle" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Articles" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfArticleID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:HiddenField ID="hfArticleID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

