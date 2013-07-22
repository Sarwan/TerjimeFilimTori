<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MRecommend.aspx.cs" Inherits="Web_Manage_MRecommend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td class="style3" style="text-align: center">
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="Title" 
                    Text="تەۋىسسىيەلىك فىلىملەر"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvRecommends" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="LinqDataSource1" ForeColor="#333333" 
                    GridLines="None" Width="100%">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:TemplateField HeaderText="فىلىم">
                            <ItemTemplate>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="ldsMovie" 
                                    ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# Eval("ID", "~/Web/Movie.aspx?id={0}") %>' Target="_blank" 
                                            Text='<%# Eval("Name") %>'></asp:HyperLink>
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:LinqDataSource ID="ldsMovie" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Name)" TableName="Movies" 
                                    Where="ID == @ID">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="hfmID" DefaultValue="0" Name="ID" 
                                            PropertyName="Value" Type="Int64" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <asp:HiddenField ID="hfmID" runat="server" Value='<%# Eval("MovieID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                            SortExpression="State" />
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" 
                            InsertVisible="False" ReadOnly="True" SortExpression="AddTime" />
                        <asp:CommandField HeaderText="باشقۇرۇش" ShowDeleteButton="True" 
                            ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                    TableName="Recommends">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMSG" runat="server" ForeColor="#CC0000" 
                    Text="بۇ فىلىم تەۋىسسىيەلىك فىلىم تىزىملىكىدە ئاللىبۇرۇن مەۋجۇت!"></asp:Label>
                <br />
                <asp:DropDownList ID="ddlMovies" runat="server" DataSourceID="ldsMovies" 
                    DataTextField="Name" DataValueField="ID">
                </asp:DropDownList>
                <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" Text="قوشۇش" />
                <asp:LinqDataSource ID="ldsMovies" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" EnableUpdate="True" 
                    Select="new (ID, Name)" TableName="Movies" Where="State == @State">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

