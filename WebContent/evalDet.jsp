<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String name = request.getAttribute("name")==null ? "" : String.valueOf(request.getAttribute("name"));
String message = request.getAttribute("message")==null ? "" : String.valueOf(request.getAttribute("message"));
%>

<html lang="en">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'/>

<title>Evaluation Details</title>

<link rel="stylesheet" href="css/core.css"/>
<link rel="stylesheet" href="css/custom.css"/>

<!--[if IE]>
    <link rel="stylesheet" href="css/ie.css"/>
<![endif]-->

<link rel="stylesheet" href="css/jquery.dataTables.min.css"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>

<script type="text/javascript" class="init">
	$(document).ready(function()
	{
		$('#evdet').DataTable({bFilter: false, bInfo: false, bPaginate: false});
	} );
</script>

<script language=javaScript>

		<% if(message!=null && message.trim().length()>0){ %>
			var message = '<%=message%>';
			alert(message);
		<% }%>
		
        // check if browser is Netscape
        // if Netscape, capture the event
        if (navigator.appName == "Netscape")
        {
            document.captureEvents(Event.KEYPRESS);
            document.onKeyPress = submitEnter;
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
      <section id="intro" style="border:none;">
        <div class="grid_12">
          <b class="shadow_divider"><b><b></b></b></b>
          <table id="evdet" class="display" cellspacing="0" width="100%">
          <thead>
            <tr>
                <th>Criteria</th>
                <th>5</th>
                <th>4</th>
                <th>3</th>
                <th>2</th>
                <th>1</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Communication and Listening</td>
                <td style="background-color:red"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Problem Solving</td>
                <td style="background-color:red"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Quality Orientation</td>
                <td></td>
                <td style="background-color:red"></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Adaptability and Change Management</td>
                <td></td>
                <td style="background-color:red"></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Teamwork</td>
                <td></td>
                <td style="background-color:red"></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Innovation</td>
                <td style="background-color:red"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
       </table>
        </div>
        <div class="clear"></div>
      </section>
    </div>
  </div>
</div>

</body>
</html>
