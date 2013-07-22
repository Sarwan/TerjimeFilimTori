<%@ Page Title="" Language="C#" MasterPageFile="~/Web/Common/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Movie.aspx.cs" Inherits="Web_Movie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Common/Script/jquery.js" type="text/javascript"></script>

    <script src="Common/Script/jquery.lightbox-0.5.pack.js" type="text/javascript"></script>

    <script src="Common/Script/jquery.lightbox-0.5.js" type="text/javascript"></script>

    <script src="Common/Script/jquery.lightbox-0.5.min.js" type="text/javascript"></script>

    <link href="Common/Styles/jquery.lightbox-0.5.css" rel="stylesheet" type="text/css" />
    
 <script type="text/javascript">
    $(function() {
        $('#gallery a').lightBox();
    });
    </script>
    	<style type="text/css">
	/* jQuery lightBox plugin - Gallery style */
	#gallery {
		background-color: #444;
		padding: 10px;
		width: 1000px;
	}
	#gallery ul { list-style: none; }
	#gallery ul li { display: inline; }
	#gallery ul img {
		border: 5px solid #3e3e3e;
		border-width: 5px 5px 20px;
	}
	#gallery ul a:hover img {
		border: 5px solid #fff;
		border-width: 5px 5px 20px;
		color: #fff;
	}
	#gallery ul a:hover { color: #fff; }
	</style>
	<script type="text/javascript">
//	    function ajaxFunction() {
//	        var xmlhttp;
//	        if (window.XMLHttpRequest) {
//	            // code for IE7+, Firefox, Chrome, Opera, Safari
//	            xmlhttp = new XMLHttpRequest();
//	        }
//	        else if (window.ActiveXObject) {
//	            // code for IE6, IE5
//	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
//	        }
//	        else {
//	            alert("Your browser does not support XMLHTTP!");
//	        }
//	        xmlhttp.onreadystatechange = function() {
//	            if (xmlhttp.readyState == 4) {
//	                //document.write(xmlhttp.responseText);
//	                document.getElementById("ctl00_ContentPlaceHolder1_lblMovieTitle").innerHTML = xmlhttp.responseText;
//	            }
//	        }
//	        alert("Start")
//	        xmlhttp.open("GET", "IMDBRating.aspx?imdbid=tt0892782", true);
//	        xmlhttp.send(null);
//	        alert("end");
//	    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0"  width="100%">
    <tr>
        <td>
            <br />
            <asp:Label ID="lblMovieTitle" runat="server" CssClass="Title"></asp:Label>
            <br />
            <br />
            <br />
            <table cellpadding="0" cellspacing="0"  width="100%">
                <tr>
                    <td>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                            CellPadding="4" DataKeyNames="ID" DataSourceID="ldsMovie" ForeColor="#333333" 
                            GridLines="None" Height="50px" Width="100%">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                            <RowStyle BackColor="#F7F7F7" HorizontalAlign="Right" />
                            <FieldHeaderStyle BackColor="#E8E8E8" HorizontalAlign="Right" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="Name" HeaderText="فىلىم نامى:" 
                                    SortExpression="Name" />
                                <asp:BoundField DataField="OtherName" HeaderText="باشقا نامى:" 
                                    SortExpression="OtherName" />
                                <asp:BoundField DataField="ReleaseTime" HeaderText="تارقىتىلغان ۋاقتى:" 
                                    SortExpression="ReleaseTime" DataFormatString="{0:D}" />
                                <asp:BoundField DataField="Country" HeaderText="دۆلەت:" 
                                    SortExpression="Country" />
                                <asp:TemplateField HeaderText="تۈرى:">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MovieCatgory.Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Language" HeaderText="تىلى:" 
                                    SortExpression="Language" />
                                <asp:BoundField DataField="Subtitle" HeaderText="يېزىقى:" 
                                    SortExpression="Subtitle" />
                                <asp:HyperLinkField DataNavigateUrlFields="IMDBUrl" DataTextField="IMDBUrl" 
                                    HeaderText="IMDB ئادرىسى:" />
                                <asp:TemplateField HeaderText="نۇمۇرى:">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRating" runat="server" ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Director" HeaderText="رىژىسسور:" 
                                    SortExpression="Director" />
                                <asp:BoundField DataField="Artst" HeaderText="رولچىلار:" 
                                    SortExpression="Artst" />
                                <asp:BoundField DataField="Source" HeaderText="مەنبەسى:" 
                                    SortExpression="Source" />
                                <asp:BoundField DataField="WatchCount" HeaderText="كۆرۈلگەن قېتىمى:" 
                                    SortExpression="WatchCount" />
                                <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرۈلگەن قېتىمى:" 
                                    SortExpression="DownCount" />
                                <asp:BoundField DataField="AddTime" HeaderText="قوشۇلغان ۋاقتى:" 
                                    SortExpression="AddTime" DataFormatString="{0:D}" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                                    DataNavigateUrlFormatString="~/Web/Watch.aspx?id={0}" Text="كۆرۈش" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID" 
                                    DataNavigateUrlFormatString="~/Web/Order.aspx?ID={0}" Text="زاكاز قىلىش" />
                            </Fields>
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                    </td>
                    <td>
                        <asp:HyperLink ID="hlWatch" runat="server"><asp:Image ID="imgCover" runat="server"  CssClass="MovieCoverImage" /></asp:HyperLink>
                        
                    </td>
                </tr>
            </table>
            <asp:LinqDataSource ID="ldsMovie" runat="server" 
                ContextTypeName="dcUTWDataContext" TableName="Movies" Where="ID == @ID">
                <WhereParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="id" 
                        Type="Int64" />
                </WhereParameters>
            </asp:LinqDataSource>
           <br />
  
           
        </td>
    </tr>
    <tr>
        <td align="right">
            <asp:Literal ID="ltrlDescraption" runat="server"></asp:Literal>
            <br />
        </td>
    </tr>
    <tr>
        <td align="center">
            
            <div id="gallery">
            <asp:Literal ID="ltrlImages" runat="server"></asp:Literal>

            </div>
            
            </td>
    </tr>
    <tr>
        <td align="center">
            <asp:GridView ID="gvDownUrls" runat="server" 
                AutoGenerateColumns="False" CellPadding="4" DataSourceID="ldsDownloadsVideos" 
                ForeColor="#333333" GridLines="None" onrowcommand="gvDownUrls_RowCommand" 
                Width="100%">
                <RowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:BoundField DataField="OtherInfo" HeaderText="نامى" 
                        SortExpression="OtherInfo" />
                    <asp:TemplateField HeaderText="چۈشۈرۈش">
                        <ItemTemplate>
                        <span dir="ltr">
                            <asp:LinkButton ID="lbDown" runat="server" CommandArgument='<%# Eval("ID") %>' 
                                onclick="lbDown_Click" Text='<%# Eval("Url") %>'></asp:LinkButton>
                                </span>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" Width="50%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="FileType" HeaderText="ھۆججەت تىپى" ReadOnly="True" 
                        SortExpression="FileType" />
                    <asp:BoundField DataField="Resolution" HeaderText="ئىنىقلىقى" ReadOnly="True" 
                        SortExpression="Resolution" />
                    <asp:BoundField DataField="Size" HeaderText="سىغىمى" ReadOnly="True" 
                        SortExpression="Size" />
                    <asp:BoundField DataField="MovieTime" HeaderText="ئۇزۇنلۇقى" ReadOnly="True" 
                        SortExpression="MovieTime" />
                    <asp:BoundField DataField="DownCount" HeaderText="چۈشۈرۈلىشى" ReadOnly="True" 
                        SortExpression="DownCount" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="black" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:LinqDataSource ID="ldsDownloadsVideos" runat="server" 
                ContextTypeName="dcUTWDataContext" 
                Select="new (OtherInfo, Resolution, FileType, Url, MovieID, ID, MovieTime, DownCount, AddTime, Movie, Size)" 
                TableName="MovieAddrs" Where="MovieID == @MovieID">
                <WhereParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="MovieID" QueryStringField="id" 
                        Type="Int64" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>
    </tr>
</table>
</asp:Content>

