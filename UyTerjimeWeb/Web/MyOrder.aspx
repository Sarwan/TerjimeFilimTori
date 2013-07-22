<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="Web_MyOrder" Trace="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
    </style>
    
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style3" align="center">
        <tr>
            <td>
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="زاكازلىرىم"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" ForeColor="Black" 
                    GridLines="None" 
                    DataSourceID="ldsMyOrder" >
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="MovieID" 
                            DataNavigateUrlFormatString="~/Web/Movie.aspx?id={0}" 
                            DataTextField="MovieTitle" HeaderText="كىنو ئىسمى" SortExpression="MovieID" />
                        <asp:BoundField DataField="MovieID" HeaderText="MovieID" 
                            SortExpression="MovieID" Visible="False" />
                        <asp:BoundField DataField="Count" HeaderText="سانى" SortExpression="Count" />
                        <asp:TemplateField HeaderText="ھۆججەت فورماتى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ldfFileFormat" DataTextField="FileFormat1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("FileFormat") %>' Enabled="False" 
                                    ondatabinding="DropDownList1_DataBinding">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldfFileFormat" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (FileFormat1, ID, Enable)" 
                                    TableName="FileFormats" Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="دىسكا تۈرى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ldsDiscType" 
                                    DataTextField="DiscType1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("DiscType") %>' Enabled="False">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsDiscType" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, DiscType1, Enable)" 
                                    TableName="DiscTypes" Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ئىنىقلىقى">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" 
                                    DataSourceID="ldsResolution" DataTextField="Resolution1" DataValueField="ID" 
                                    SelectedValue='<%# Bind("Resolution") %>' Enabled="False">
                                </asp:DropDownList>
                                <asp:LinqDataSource ID="ldsResolution" runat="server" 
                                    ContextTypeName="dcUTWDataContext" Select="new (ID, Resolution1, Enable)" 
                                    TableName="Resolutions" Where="Enable == @Enable">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="True" Name="Enable" Type="Boolean" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="زاكاز قىلىنغان ۋاقتى" 
                            SortExpression="Date" />
                        <asp:BoundField DataField="Sate" HeaderText="ھالىتى" SortExpression="Sate" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Button" 
                            DeleteText="ئۆچۈرۈش" HeaderText="ئۆچۈرۈش" />
                    </Columns>
                    <FooterStyle BackColor="#262626" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#4D4D4D" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#606060" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsMyOrder" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableDelete="True" OrderBy="Date desc" 
                    TableName="Notes" Where="UserID == @UserID">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="hfUserID" DefaultValue="0" Name="UserID" 
                            PropertyName="Value" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:HiddenField ID="hfUserID" runat="server" Value="0" />
            </td>
        </tr>
    </table>
</asp:Content>

