<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Downloads.aspx.cs" Inherits="Web_Downloads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<br />
    <asp:GridView ID="gvDowns" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="ldsDownloads" 
        ForeColor="#333333" GridLines="None" Width="100%">
        <RowStyle BackColor="#FAFAFA" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="نامى" ReadOnly="True" 
                SortExpression="Name" >
            <ItemStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Type" HeaderText="تۈرى" ReadOnly="True" 
                SortExpression="Type" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="Descraption" HeaderText="چۈشەندۈرۈش" 
                ReadOnly="True" SortExpression="Descraption">
            <ItemStyle Width="40%" />
            </asp:BoundField>
            <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرلىشى" ReadOnly="True" 
                SortExpression="DownCount" >
            <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="چۈشۈرۈش">
                <ItemTemplate>
                    <asp:LinkButton ID="lbDown" runat="server" CommandArgument='<%# Eval("ID") %>' 
                        onclick="lbDown_Click">چۈشۈرۈش</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#E8E8E8" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="Black" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:LinqDataSource ID="ldsDownloads" runat="server" 
        ContextTypeName="dcUTWDataContext" OrderBy="DownCount desc" 
        Select="new (ID, Type, Url, AddTime, Descraption, DownCount, Name)" 
        TableName="Downloads" Where="State == @State">
        <WhereParameters>
            <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
        </WhereParameters>
    </asp:LinqDataSource>
    </center>
</asp:Content>

