<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Catgory.ascx.cs" Inherits="Web_Common_UserControls_Catgory" %>

<table align="right" cellpadding="0" cellspacing="0" width="200px" dir="rtl">
    <tr>
        <td bgcolor="#F4F4F4" height="30">
            <asp:Label ID="lblCatgoryTitle" runat="server" Text="فىلىم تۈرلىرى"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            
            <asp:LinkButton ID="lbtnAll" runat="server" onclick="lbtnAll_Click">بارلىق</asp:LinkButton>
<asp:DataList ID="DataList1" runat="server" DataSourceID="ldsCatgory">
    <ItemTemplate>
        <asp:LinkButton ID="lbtnCatgory" runat="server" 
            CommandArgument='<%# Eval("ID") %>' Text='<%# Eval("Name") %>' 
            onclick="lbtnCatgory_Click"></asp:LinkButton>
    </ItemTemplate>
</asp:DataList>
<asp:LinqDataSource ID="ldsCatgory" runat="server" 
    ContextTypeName="dcUTWDataContext" OrderBy="ID" Select="new (ID, Name)" 
    TableName="MovieCatgories" Where="State == @State">
    <WhereParameters>
        <asp:Parameter DefaultValue="True" Name="State" Type="Boolean" />
    </WhereParameters>
</asp:LinqDataSource>
        </td>
    </tr>
</table>

