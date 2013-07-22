<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SlideShow.ascx.cs" Inherits="Web_Common_SlideShow" %>

<script src="Common/Script/jquery-1.2.6.min.js" type="text/javascript"></script>

<script type="text/javascript">

    /*** 
    Simple jQuery Slideshow Script
    Released by Jon Raasch (jonraasch.com) under FreeBSD license: free to use or modify, not responsible for anything, etc.  Please link out to me if you like it :)
    ***/

    function slideSwitch() {
        var $active = $('#slideshow DIV.active');

        if ($active.length == 0) $active = $('#slideshow DIV:last');

        // use this to pull the divs in the order they appear in the markup
        var $next = $active.next().length ? $active.next()
        : $('#slideshow DIV:first');

        // uncomment below to pull the divs randomly
        // var $sibs  = $active.siblings();
        // var rndNum = Math.floor(Math.random() * $sibs.length );
        // var $next  = $( $sibs[ rndNum ] );


        $active.addClass('last-active');

        $next.css({ opacity: 0.0 })
        .addClass('active')
        .animate({ opacity: 1.0 }, 1000, function() {
            $active.removeClass('active last-active');
        });
    }

    $(function() {
        setInterval("slideSwitch()", 5000);
    });

</script>

<style type="text/css">

/*** set the width and height to match your images **/

#slideshow {
    position:relative;
    height:200px;
    width:1024px;
}

#slideshow DIV {
    position:absolute;
    top:0;
    left:0;
    z-index:8;
    opacity:0.0;
    height: 200px;
    width:1024px;
    background-color: #FFF;
}

#slideshow DIV.active {
    z-index:10;
    opacity:1.0;
}

#slideshow DIV.last-active {
    z-index:9;
}

#slideshow DIV IMG {
    height: 200px;
    width:1024px;
    display: block;
    border: 0;
    margin-bottom: 10px;
}

</style>

<div id="slideshow">
        <asp:Literal ID="ltrlImages" runat="server"></asp:Literal>
   
    
</div>