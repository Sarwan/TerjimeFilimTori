<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Web_Register" %>

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
            <td>
                <asp:Label ID="lblTitle" runat="server" CssClass="Title" Text="تىزىملىتىش"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="ID" DataSourceID="ldsUser" DefaultMode="Insert" 
                    ForeColor="#333333" GridLines="None" Height="50px" Width="480px">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <RowStyle BackColor="#EFF3FB" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <Fields>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Type" HeaderText="Type" InsertVisible="False" 
                            SortExpression="Type" />
                        <asp:CheckBoxField DataField="State" HeaderText="State" SortExpression="State" 
                            Visible="False" />
                        <asp:BoundField DataField="Password" HeaderText="Password" 
                            SortExpression="Password" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="TelePhone" HeaderText="TelePhone" 
                            SortExpression="TelePhone" />
                        <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" 
                            Visible="False" />
                        <asp:BoundField DataField="Address" HeaderText="Address" 
                            SortExpression="Address" />
                        <asp:BoundField DataField="LoginCount" HeaderText="LoginCount" 
                            SortExpression="LoginCount" Visible="False" />
                        <asp:BoundField DataField="BuyCount" HeaderText="BuyCount" 
                            SortExpression="BuyCount" Visible="False" />
                        <asp:BoundField DataField="AddTime" HeaderText="AddTime" 
                            SortExpression="AddTime" Visible="False" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#EFF3FB" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:DetailsView>
                <asp:LinqDataSource ID="ldsUser" runat="server" 
                    ContextTypeName="dcUTWDataContext" EnableInsert="True" TableName="Users" 
                    Where="ID == @ID">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="0" Name="ID" Type="Int64" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

