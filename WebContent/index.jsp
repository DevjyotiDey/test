<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<!--Modernizr script for IE-->
<script src="js/modernizr.js" type="text/javascript"></script>
<script src="js/fun.js" type="text/javascript"></script>
<script src="js/jquery.js" type="text/javascript"></script>

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
        
        function setFocusToEmpId() {
        	document.Login.empid.focus();
        }
        
        function clearForm()
        {
        	document.getElementById("empid").value='';
			document.getElementById("password").value='';
        }
        
        function login()
        {
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
              <td width="91%"><h2>Login with your desktop credentials</h2></td>
              <td style="font-size: 12px"></td>
            </tr>
          </table>
          <b class="shadow_divider"><b><b></b></b></b>
          <article class="login_form userinfo_form">
            <form name="login" method="post" action="loginServlet">
                <div class="sso_box">
                  <label>Windows User ID</label>
                  <input type='text' autofocus="autofocus" id="empid" name='empid' size='36' autocomplete='off' maxlength='10' class='sectionItem' title='Employee ID' tabindex=1 onKeyPress='return submitEnter(event)'>
                </div>
                <div class="clear"></div>
                <br>
              	<div class="sso_box">
                	<label>Password</label>
                	<input 	type='password' id="password" autocomplete='off' name='password' size='36' maxlength='15' class='sectionItem' title='password' tabindex=2 onKeyPress='return submitEnter(event)'>
                </div>
                <br>
              <div class="button_box">
              	<input class="button" type="submit" value="Login">
              	<input class="button" type="button" value="Clear" onClick="javascript:clearForm();">
              </div>
            </form>
          </article>
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
