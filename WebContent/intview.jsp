<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
String name = request.getAttribute("name")==null ? "" : String.valueOf(request.getAttribute("name"));
String message = request.getAttribute("message")==null ? "" : String.valueOf(request.getAttribute("message"));
%>

<%@ page import="java.util.*"%>
<%@ page import="com.verizon.vo.*"%>
<%
Interviewer intwrObj = request.getAttribute("interviewer")==null ? new Interviewer() : (Interviewer)request.getAttribute("interviewer");
List<InterviewDetail> intwrList = intwrObj.getInterviews();

Interviewee intweObj = request.getAttribute("interviewee")==null ? new Interviewee() : (Interviewee)request.getAttribute("interviewee");
List<InterviewDetail> intweList = intweObj.getInterviewsGiven();
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
		$('#intvw').DataTable();
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
        
        function feedDetails()
        {
        	document.getElementById("feedback").reset();
        	document.getElementById("feed").style.display = "block";
			document.getElementById("list").style.display = "none";
			document.getElementById("intDate").focus();
        }
        
        function details(String rslt)
        {
        	window.open("evalDet.jsp", "_blank", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, height=510, width=980");
        }
        
        function download()
        {
        }
        
        function cancel()
        {
        	document.getElementById("feed").style.display = "none";
			document.getElementById("list").style.display = "inline";
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
        <div align="right">Logged in as <%=name%> &nbsp;</div>
        <div class="clear"></div>
      </section>
      <section id="intro" style="border:none;">
        <div id="list" class="grid_12" style="display:inline">
          <table border=1 width="100%">
            <tr>
              <td width="88%"><h2>Your list of interviews</h2></td>
              <td width="12%"><div align="right"><a href="javascript:feedDetails();">Add Interview</a></div></td>
            </tr>
          </table>
          <b class="shadow_divider"><b><b></b></b></b>
          <table id="intvw" class="display" cellspacing="0" width="100%">
          <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Date</th>
                <th>Venue</th>
                <th>Event</th>
                <th>Remarks</th>
                <th>Result</th>
                <th></th>
            </tr>
          </thead>
          <tbody>
            <% for(int i=0; i<intwrList.size(); i++){ %>
            <tr>
            	<td><%= intwrList.get(i).getInterviewId() %></td>
            	<td><%= intwrList.get(i).getInterviewDate() %></td>
            	<td><%= intwrList.get(i).getVenue() %></td>
            	<td><%= intwrList.get(i).getInterviewType() %></td>
            	<td><%= intwrList.get(i).getFeedback() %></td>
            	<td><%= intwrList.get(i).getResult() %></td>
				<td>
					<a href="javascript:details(<%= intwrList.get(i).getEvaluationResults() %>);"><img src="img/details.png" height="15px" width="15px" title="Evaluation Details"/></a>
					<a href="javascript:download(<%= intwrList.get(i).getAddlDocument() %>);"><img src="img/attach.png" height="25px" width="25px" title="Download Attachments"/></a>
				</td>
            </tr>
            <%} %>
         </table>
        </div>
        
        <div id="feed" style="display:none">
        	<div id="list" class="grid_12">
	          <table border=1>
	            <tr>
	              <td width="100%"><h2>Interview feedback</h2></td>
	            </tr>
	          </table>
	          <b class="shadow_divider"><b><b></b></b></b>
	          <article class="login_form userinfo_form">
	            <form id="feedback" name="feedback" method="post" action="feedServlet">
	              <table class="display" width="100%">
	               <tr>
	              	<td width="15%"><label>Interview Date</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="text" id="intDate" name='intDate' title='Interview Date' tabindex=1 size="36">
	                </div></td>
	                <td width="15%"><label>Interview Venue</label></td>
	                <td width="35%"><div class="sso_box">
	                	<select id="intVenue" title="Select a venue" style="width:250px">
						   <option value="otp">Chennai OTP</option>
						   <option value="rmz">Chennai RMZ</option>
						   <option value="tit">Hyderabad Titus</option>
						   <option value="orn">Hyderabad Orion</option>
						   <option value="oth">Outside Verizon Premises</option>
						</select>
	                </div></td>
	               </tr>
	               <tr>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               </tr>
	               <tr>
	              	<td width="15%"><label>Candidate Name</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="text" id="cndName" name='cndName' title='Candidate Name' tabindex=3 size="36">
	                </div></td>
	                <td width="15%"><label>Event Type</label></td>
	                <td width="35%"><div class="sso_box">
	                	<select id="intEvent" title="Select an event" style="width:250px">
						   <option value="cmp">Campus</option>
						   <option value="viv">VIVM Backfill</option>
						   <option value="ijp">Internal Job Posting</option>
						   <option value="lat">Lateral Entry</option>
						   <option value="ref">Referral</option>
						</select>
	                </div></td>
	               </tr>
	               <tr>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               </tr>
	               <tr>
	              	<td width="15%"><label>Remarks</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="text" id="intRem" name='intRem' title='Final Remarks' tabindex=5 size="36">
	                </div></td>
	                <td width="15%"><label>Result</label></td>
	                <td width="35%"><div class="sso_box">
	                	<select id="intRslt" title="Select a result" style="width:250px">
						   <option value="rec">Recommended</option>
						   <option value="sht">Shortlisted</option>
						   <option value="nor">Not Recommended</option>
						   <option value="hld">On Hold</option>
						   <option value="res">Rescheduled</option>
						   <option value="can">Cancelled</option>
						</select>
	                </div></td>
	               </tr>
	               <tr>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               </tr>
	               <tr>
	              	<td width="15%"><label>Communication</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="radio" name="intC1" value="5">5</input>
	                	<input type="radio" name="intC1" value="4">4</input>
	                	<input type="radio" name="intC1" value="3">3</input>
	                	<input type="radio" name="intC1" value="2">2</input>
	                	<input type="radio" name="intC1" value="1">1</input>
	                </div></td>
	                <td width="15%"><label>Problem Solving</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="radio" name="intC2" value="5">5</input>
	                	<input type="radio" name="intC2" value="4">4</input>
	                	<input type="radio" name="intC2" value="3">3</input>
	                	<input type="radio" name="intC2" value="2">2</input>
	                	<input type="radio" name="intC2" value="1">1</input>
	                </div></td>
	               </tr>
	               <tr>
	              	<td width="15%"><label>Quality Orientation</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="radio" name="intC3" value="5">5</input>
	                	<input type="radio" name="intC3" value="4">4</input>
	                	<input type="radio" name="intC3" value="3">3</input>
	                	<input type="radio" name="intC3" value="2">2</input>
	                	<input type="radio" name="intC3" value="1">1</input>
	                </div></td>
	                <td width="15%"><label>Adaptability</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="radio" name="intC4" value="5">5</input>
	                	<input type="radio" name="intC4" value="4">4</input>
	                	<input type="radio" name="intC4" value="3">3</input>
	                	<input type="radio" name="intC4" value="2">2</input>
	                	<input type="radio" name="intC4" value="1">1</input>
	                </div></td>
	               </tr>
	               <tr>
	              	<td width="15%"><label>Teamwork</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="radio" name="intC5" value="5">5</input>
	                	<input type="radio" name="intC5" value="4">4</input>
	                	<input type="radio" name="intC5" value="3">3</input>
	                	<input type="radio" name="intC5" value="2">2</input>
	                	<input type="radio" name="intC5" value="1">1</input>
	                </div></td>
	                <td width="15%"><label>Innovation</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="radio" name="intC6" value="5">5</input>
	                	<input type="radio" name="intC6" value="4">4</input>
	                	<input type="radio" name="intC6" value="3">3</input>
	                	<input type="radio" name="intC6" value="2">2</input>
	                	<input type="radio" name="intC6" value="1">1</input>
	                </div></td>
	               </tr>
	               <tr>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               	<td width="15%">&nbsp;</td>
	               	<td width="35%">&nbsp;</td>
	               </tr>
	               <tr>
	              	<td width="15%"><label>Attachments</label></td>
	                <td width="35%"><div class="sso_box">
	                	<input type="file" id="intAttach" name='intAttach' title='Attach resume, exercise document, etc' tabindex=7 size="36">
	                </div></td>
	                <td width="15%"></td>
	                <td width="35%"></td>
	               </tr>
	               <tr></tr>
	              </table>
	                <br>
	              <div class="button_box">
	              	<input class="button" type="submit" value="Submit">
	              	<input class="button" type="button" value="Cancel" onClick="javascript:cancel();">
	              </div>
	            </form>
	          </article>
        </div>
        <div class="clear"></div>
      </section>
    </div>
    <section>
    	<br>
    	<div align="center">A small POC for showcasing Continuous Integration. BGW Hackers (Prakash & Devjyoti).</div>
    </section>
    
  </div>
</div>

</body>
</html>
