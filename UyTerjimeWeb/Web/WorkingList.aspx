<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="WorkingList.aspx.cs" Inherits="Web_WorkingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvWorkingL" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="ID" DataSourceID="ldsWorkingList" ForeColor="#333333" 
                    GridLines="None" Width="100%">
                    <RowStyle BackColor="#FAFAFA" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="فىلىم نامى" 
                            SortExpression="ID" />
                        <asp:BoundField DataField="Cover" HeaderText="رەسىمى" SortExpression="Cover" />
                        <asp:BoundField DataField="OtherName" HeaderText="باشقا نامى" 
                            SortExpression="OtherName" />
                        <asp:BoundField DataField="ReleaseTime" DataFormatString="{0:d}" 
                            HeaderText="تارقىتىلغان ۋاقتى" SortExpression="ReleaseTime" />
                        <asp:BoundField DataField="Country" HeaderText="دۆلىتى" 
                            SortExpression="Country" />
                        <asp:BoundField DataField="Language" HeaderText="تىلى" 
                            SortExpression="Language" />
                        <asp:BoundField DataField="IMDBUrl" HeaderText="IMDB ئادرىسى" 
                            SortExpression="IMDBUrl" />
                        <asp:TemplateField HeaderText="خىزمەت ھالىتى" SortExpression="WorkingState">
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
                        </asp:TemplateField>
                        <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى" 
                            SortExpression="AddTime" DataFormatString="{0:d}" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#E8E8E8" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="Black" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:LinqDataSource ID="ldsWorkingList" runat="server" 
                    ContextTypeName="dcUTWDataContext" OrderBy="AddTime desc" 
                    TableName="WorkingMovies" Where="State == @State">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

