<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String result = request.getParameter("result");
String [] criteria = result.split(",");
%>

<%if(request.getSession(false) == null){%>
	alert("OOPS!! Session Expired, plz Login");
<%}%>

<%if(request.getSession(false) == null){%>
	<script>alert("OOPS!! Session Expired, plz Login");</script>
<%	
request.getRequestDispatcher("/index.jsp").forward(request, response);
}%>

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
                <th width="85%">Criteria</th>
                <th width="15%">Rating</th>
            </tr>
        </thead>
        <tbody>
        	<div id="critDiv">
            <tr>
                <td>Communication and Listening</td>
                <td><%= criteria[0] %></td>
            </tr>
            <tr>
                <td>Problem Solving</td>
                <td><%= criteria[1] %></td>
            </tr>
            <tr>
                <td>Quality Orientation</td>
                <td><%= criteria[2] %></td>
            </tr>
            <tr>
                <td>Adaptability and Change Management</td>
                <td><%= criteria[3] %></td>
            </tr>
            <tr>
                <td>Teamwork</td>
                <td><%= criteria[4] %></td>
            </tr>
            <tr>
                <td>Innovation</td>
                <td><%= criteria[5] %></td>
            </tr>
           </div>
          </tbody>
        </table>
        </div>
        <div class="clear"></div>
      </section>
    </div>
  </div>
</div>

</body>
</html>
