<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MPictures.aspx.cs" Inherits="Web_Manage_MPictures" %>

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
                <asp:Label ID="lblTitle" runat="server" Text="فىلىم رەسىمى باشقۇرۇش" 
                    CssClass="Title"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvPictures" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsMoviePictures" ForeColor="#333333" 
                    GridLines="None" Width="100%" 
                    onselectedindexchanged="gvPictures_SelectedIndexChanged">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                            SortExpression="ID" />
                        <asp:TemplateField HeaderText="فىلىم نامى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ldsMovies" 
                                    DataTextField="Name" DataValueField="ID" Enabled="False" 
                                    SelectedValue='<%# Bind("MovieID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsMovies" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Movies" 
                                    Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ldsMovies" 
                                    DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("MovieID") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsMovies" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Movies" 
                                    Where="State == @State">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="Url" HeaderText="رەسىم">
                            <ControlStyle Height="64px" Width="64px" />
                        </asp:ImageField>
                        <asp:BoundField DataField="Descraption" HeaderText="چۈشەندۈرۈش" 
                            SortExpression="Descraption" />
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" ReadOnly="True" 
                            SortExpression="AddTime" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" DeleteText="ئۆچۈرۈش" EditText="تەھرىرلەش" 
                            HeaderText="باشقۇرۇش" SelectText="تاللاش" UpdateText="ئۆزگەرتىش" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsMoviePictures" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                    TableName="Pictures">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" Text="رەسىم قوشۇش" 
                    onclick="btnAdd_Click" />
                <br />
                <asp:HiddenField ID="hfPictureID" runat="server" />
                <asp:DetailsView ID="dvPicture" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsOnePicture" 
                    ForeColor="#333333" GridLines="None" Height="50px" Width="100%" 
                    oniteminserted="dvPicture_ItemInserted" 
                    oniteminserting="dvPicture_ItemInserting" onitemupdated="dvPicture_ItemUpdated">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="تەرتىپ نۇمۇرى:" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:TemplateField HeaderText="فىلىم نامى:">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsMovie" 
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
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsMovie" 
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
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsMovie" 
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
                        <asp:BoundField DataField="Descraption" HeaderText="رەسىم چۈشەندۈرىشى:" 
                            SortExpression="Descraption" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Url" HeaderText="رەسىم ئادرىسى:" 
                            SortExpression="Url" >
                        <ControlStyle Width="95%" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                            SortExpression="State" />
                        <asp:TemplateField HeaderText="رەسىم:">
                            <ItemTemplate>
                                
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Url") %>'><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Url") %>' /></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" InsertVisible="False" 
                            ReadOnly="True" SortExpression="AddTime" />
                        <asp:CommandField ShowEditButton="True" ShowInsertButton="True" 
                            CancelText="بىكار قىلىش" EditText="تەھرىرلەش" InsertText="قوشۇش" 
                            NewText="قوشۇش" UpdateText="ئۆزگەرتىش" >
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsOnePicture" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    TableName="Pictures" Where="ID == @ID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfPictureID" DefaultValue="0" Name="ID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

