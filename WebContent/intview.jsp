<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.verizon.ProductVO"%>
<%@ page import="com.verizon.UserVO"%>
<%
String message = request.getAttribute("message")==null ? "" : String.valueOf(request.getAttribute("message"));
%>

<html lang="en">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'/>

<title>VZ Feeder</title>

<link rel="stylesheet" href="css/Core960.css"/>
<link rel="stylesheet" href="css/CustomTheme.css"/>
<link rel="stylesheet" href="css/Styles.css"/>
<link rel="stylesheet" href="css/components.css"/>

<!--[if IE]>
    <link rel="stylesheet" href="css/ie.css"/>
    <![endif]-->

<!--Responsive Design Media Queries-->
<!-- liquid -->
<link href='css/handheld.css' media='only screen and (max-width: 960px)' rel='stylesheet'
          type='text/css'>

<link rel="stylesheet" href="css/jquery.dataTables.min.css"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>

<!--Modernizr script for IE-->
<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/fun.js" type="text/javascript"></script>
<script src="js/jquery.js" type="text/javascript"></script>

<script language=javaScript>

		<% if(message!=null && message.trim().length()>0){ %>
			var message = '<%=message%>';
			alert(message);
		<% }%>
		
		
		$(document).ready(function()
		{
		    $('#intvw').DataTable();
		});
		
        // check if browser is Netscape
        // if Netscape, capture the event
        if (navigator.appName == "Netscape")
        {
            document.captureEvents(Event.KEYPRESS);
            document.onKeyPress = submitEnter;
        }

        // on pressing the enter key, the form submits
        function submitEnter(e)
        {
            var enterkey;
            if (navigator.appName == "Microsoft Internet Explorer") {
                enterkey = window.event.keyCode;
            } else if (navigator.appName == "Netscape") {
                enterkey = e.which;
            } else if (navigator.appName == "Mozilla") {
                enterkey = e.keyCode;
            }
            if (enterkey == 13)
            {      
            }
        }

        window.focus();
        if (navigator.appName == "Netscape" && document.layers != null) {
            wid = window.innerWidth;
            hit = window.innerHeight;
            if (wid < 400 && hit < 500) {
                window.moveTo(0, 0);
                window.outerHeight = screen.availHeight;
                window.outerWidth = screen.availWidth;
            }
        }

        window.onload = resizeWindow;
        function resizeWindow() {
            if (navigator.appName == "Microsoft Internet Explorer") {
                wid = document.body.clientWidth;
                hit = document.body.clientHeight;
                if (wid < 400 && hit < 500) {
                    window.moveTo(0, 0);
                    window.resizeTo(screen.availWidth, screen.availHeight);
                    document.body.scrollLeft = window.pageXOffset;
                }
            }
        }
    </script>
</head>

<body>
<div id="page">
  <div class="content_container">
    <div class="container_12" style="position:relative">
   	  <section style="border-bottom: 10px solid #FF0000; padding:0px;">
  		<img src="img/Logo.png"/>
  		<br>
      </section>
      </br>
      <section style="border-bottom: 1px solid #DDDDDD; padding:0px;">
        <div class="grid_8">
          <h1 style="margin:5px 0;">VZ Feeder</h1>
        </div>
        <div class="clear"></div>
      </section>
      <section id="intro" style="border:none;">
        <div class="grid_12">
          <table border=1>
            <tr>
              <td width="91%"><h2>Your list of interviews</h2></td>
              <td style="font-size: 12px"></td>
            </tr>
          </table>
          <b class="shadow_divider"><b><b></b></b></b>
          <table id="intvw" class="display" cellspacing="0" width="100%">
          <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Age</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
        <tbody>
            <tr>
                <td>Tiger Nixon</td>
                <td>System Architect</td>
                <td>Edinburgh</td>
                <td>61</td>
                <td>2011/04/25</td>
                <td>$320,800</td>
            </tr>
            <tr>
                <td>Garrett Winters</td>
                <td>Accountant</td>
                <td>Tokyo</td>
                <td>63</td>
                <td>2011/07/25</td>
                <td>$170,750</td>
            </tr>
       </table>
        </div>
        <div class="clear"></div>
      </section>
    </div>
    <section>
    	<br>
    	<div align="center">All rights reserved. BGW Hackers.</div>
    </section>
    
  </div>
</div>

</body>
</html>
