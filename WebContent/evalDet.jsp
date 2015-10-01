<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%if(request.getSession(false) == null){%>
	alert("OOPS!! Session Expired, plz Login");
<%}%>

<%if(request.getSession(false) == null){%>
	<script>alert("OOPS!! Session Expired, plz Login");</script>
<%	
request.getRequestDispatcher("/index.jsp").forward(request, response);
}%>

<%
String name = request.getAttribute("name")==null ? "" : String.valueOf(request.getAttribute("name"));
String message = request.getAttribute("message")==null ? "" : String.valueOf(request.getAttribute("message"));
if(request.getSession(false)!=null){
name=(String)request.getSession(false).getAttribute("EmployeeName");
}
%>

<%
String result = request.getParameter("result");
String [] criteria = result.trim().split(",");
%>

<html lang="en">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'/>

<title>VZ Feeder</title>

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
   	  <section style="border-bottom: 10px solid #FF0000; padding:0px;">
  		<img src="img/Logo.png" width="173px" height="71px"/>
  		<br>
      </section>
      </br>
      <section style="border-bottom: 1px solid #DDDDDD; padding:0px;">
        <div class="grid_8">
          <h1 style="margin:5px 0;">VZ Feeder</h1>
        </div>
        <div align="right">Logged in : <a href="/index.jsp" data-toggle="tooltip" title="Click to Logout" style="text-decoration:none"><%=name%></a> &nbsp;</div>
        <div class="clear"></div>
      </section>
      <section id="intro" style="border:none;">
        <div id="list" class="grid_12">
          <table border=1 width="100%">
            <tr>
              <td width="88%"><h2>Evaluation Criteria</h2></td>
              <td width="12%"><div align="right"><a href="javascript:window.history.back();">Back</a></div></td>
            </tr>
          </table>
          <b class="shadow_divider"><b><b></b></b></b>
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
                <td><%= criteria[0]!=null ? criteria[0] : "NA" %></td>
            </tr>
            <tr>
                <td>Problem Solving</td>
                <td><%= criteria[1]!=null ? criteria[1] : "NA" %></td>
            </tr>
            <tr>
                <td>Quality Orientation</td>
                <td><%= criteria[2]!=null ? criteria[2] : "NA" %></td>
            </tr>
            <tr>
                <td>Adaptability and Change Management</td>
                <td><%= criteria[3]!=null ? criteria[3] : "NA" %></td>
            </tr>
            <tr>
                <td>Teamwork</td>
                <td><%= criteria[4]!=null ? criteria[4] : "NA" %></td>
            </tr>
            <tr>
                <td>Innovation</td>
                <td><%= criteria[5]!=null ? criteria[5] : "NA" %></td>
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
