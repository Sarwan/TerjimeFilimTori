<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MOrders.aspx.cs" Inherits="Web_Manage_MOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style3">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="زاكازلار"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" ForeColor="Black" 
                    GridLines="None" 
                    DataSourceID="ldsOrders" Width="100%" >
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="MovieID" 
                            DataNavigateUrlFormatString="~/Web/Movie.aspx?id={0}" 
                            DataTextField="MovieTitle" HeaderText="كىنو ئىسمى" 
                            SortExpression="MovieID" >
                        <ItemStyle Width="20%" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Count" HeaderText="سانى" SortExpression="Count" >
                        <ItemStyle Width="20px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="فىلىم ئۇچۇرى">
                            <ItemTemplate>
                                ھۆججەت فورماتى:<asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldfFileFormat" DataTextField="FileFormat1" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("FileFormat") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldfFileFormat" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (FileFormat1, ID, Enable)" 
                                    TableName="FileFormats" Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource><br />
                                دىسكا تۈرى:<asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="ldsDiscType" DataTextField="DiscType1" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("DiscType") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsDiscType" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, DiscType1, Enable)" 
                                    TableName="DiscTypes" Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource><br />
                                ئىنىقلىقى:<asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSourceID="ldsResolution" DataTextField="Resolution1" DataValueField="ID" 
                                    Enabled="False" SelectedValue='<%# Bind("Resolution") %>'>
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsResolution" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Resolution1, Enable)" 
                                    TableName="Resolutions" Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                                <br />
                                <br />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Width="30%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="خېرىدار ئۇچۇرى">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Phone", "تېلېفۇن: {0}") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label5" runat="server" 
                                    Text='<%# Eval("Address", "ئادرېس: {0}") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Eval("Address", "E-Mail: {0}") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Memo", "ئىزاھات: {0}") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Width="30%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="ۋاقىت" 
                            SortExpression="Date" >
                        <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sate" HeaderText="ھالىتى" SortExpression="Sate" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" 
                            DeleteText="ئۆچۈرۈش" HeaderText="ئۆچۈرۈش" >
                        <ItemStyle Width="100px" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#262626" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#4D4D4D" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#606060" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsOrders" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableUpdate="True" 
                    OrderBy="Date" TableName="Notes">
                </asp:LinqDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

