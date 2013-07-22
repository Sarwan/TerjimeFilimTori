<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/ManageMasterPage.master" AutoEventWireup="true" CodeFile="MMovieCatgory.aspx.cs" Inherits="Web_Manage_MMovieCatgory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
        width: 100%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2" align="center">
    <tr>
        <td style="text-align: center">
            <br />
            <asp:Label ID="lblTitle" runat="server" CssClass="Title" 
                Text="فىلىم سەھىپىلىرىنى باشقۇرۇش"></asp:Label>
            <br />
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
        <center>
            <asp:GridView ID="gvMovieCatgory" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="ID" DataSourceID="ldsMovieCatgory" ForeColor="#333333" 
                GridLines="None" Width="100%">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="تەرتىپ نومۇرى" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="سەھىپە نامى" 
                        SortExpression="Name" />
                    <asp:BoundField DataField="Descraption" HeaderText="چۈشەندۈرۈش" 
                        SortExpression="Descraption" />
                    <asp:CheckBoxField DataField="State" HeaderText="ھالىتى" 
                        SortExpression="State" />
                    <asp:CommandField CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" 
                        EditText="تەھرىرلەش" HeaderText="باشقۇرۇش" ShowDeleteButton="True" 
                        ShowEditButton="True" UpdateText="ئۆزگەرتىش" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:LinqDataSource ID="ldsMovieCatgory" runat="server" 
                ContextTypeName="dcUTWDataContext" EnableDelete="True" EnableInsert="True" 
                EnableUpdate="True" TableName="MovieCatgories">
            </asp:LinqDataSource>
            <br />
            </center>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" bgcolor="#CCCCFF">
            <br />
            <br />
            سەھىپە قوشۇش<br />
            <center>
            <asp:DetailsView ID="dvInsert" runat="server" AutoGenerateRows="False" 
                CellPadding="4" DataKeyNames="ID" DataSourceID="ldsMovieCatgory" 
                DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
                oniteminserted="dvInsert_ItemInserted" Width="480px">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="سەھىپە نامى:" 
                        SortExpression="Name" />
                    <asp:BoundField DataField="Descraption" HeaderText="چۈشەندۈرۈش:" 
                        SortExpression="Descraption" />
                    <asp:CheckBoxField DataField="State" HeaderText="ھالىتى:" 
                        SortExpression="State" />
                    <asp:CommandField CancelText="بىكار قىلىش" DeleteText="ئۆچۈرۈش" 
                        EditText="تەھرىرلەش" HeaderText="باشقۇرۇش" InsertText="قوشۇش" NewText="قۇرۇش" 
                        ShowInsertButton="True" UpdateText="ئۆزگەرتىش" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
                <br />
            </center>
        </td>
    </tr>
</table>
</asp:Content>

