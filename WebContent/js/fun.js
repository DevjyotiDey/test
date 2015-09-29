// Author: Kathy Duong
function isEmpty(str){
  for (var i = 0; i < str.length; i++){
    var ch = str.charAt(i);
    if ((ch != ' ') && (ch != '\n') && (ch != '\t')){
      return false;
    }
  }
  return true;
}

function trim1 (str) {
    return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}

//trim white spaces
function trim(value){
var val = value;
var str="";
for (var i=0; i<val.length; i++){
    var ch = val.charAt(i);
    if (ch != ' '){
       str = str + ch;
    }
}
return str;
}

// unescape the url string and then set the url string back to it's original state
// Author: Kathy Duong
function getUrlStr(a){
  var urlstring = unescape(a);
  var str2 = "";
  var str = Array();
  var index = 0;
  var j = 0;
  var flag = false;
  var tmp = "";
  var count = 0;

  for (var i = 0; i < urlstring.length; i++){
    var ch = urlstring.charAt(i);
    str[i] = ch;
    if (ch == '$' && j == 0){
       flag = true;
       index = i
       j = 1;
    }
    if (ch == '$'){
      count++;
    }
  }

  if (flag){
    if (count > 20){	
      for (var i = 0; i < urlstring.length; i++){
        var ch = urlstring.charAt(i);
        if (i == 0){
          tmp = ch;
        } 
	if (ch == '$'){
	  str2 = ch;
        }else if (str2 == '$' && ch == '&'){
          str2 = ch;
          tmp = tmp + "%26%23";
        }else if (str2 == '$' && ch == '#'){
	  str2 = ch;
        }else if (str2 == '$' && ch == ';'){
          str2= ch;
          tmp = tmp + "%3B";
        }else if (i > 0){
          str2 = ch;
          tmp = tmp + ch
        }
      } 
      urlstring = tmp;
    }else if (str[index+1] == '$'){
      for (var i = 0; i < urlstring.length; i++){
        var ch = urlstring.charAt(i);
        if (i == 0){
          tmp = ch;
        }
        if (ch == '$'){
          if (str2 != '$'){
            tmp = tmp + "$";
          } 
          str2 = ch;                
        }else if (i > 0){
          str2 = ch;
	  tmp = tmp + ch;
        }
      }
      urlstring = tmp;
    }
  }
  return urlstring;
}

// Author:  Kathy Duong
// Purpose: Popup a default password help box
// Date:    04/30/03
function popDefaultPwd(){
    config = 'toolbar=no,location=no,directories=no,status=no,menubar=no,width=450,height=250';
    config += 'scrollbars=no,resizable=no';
    content = "<HTML>";
    content += "<HEAD><TITLE>Verizon Web User Authentication</TITLE>";
    content += "<LINK REL=stylesheet TYPE='text/css' HREF='/includes/css/header1.css'>";   
    content += "<SCRIPT LANGUAGE='javaScript' SRC='/includes/js/main1.js'></SCRIPT>";
    content += "</HEAD>";
    content += "<BODY LEFTMARGIN='0' TOPMARGIN='0' MARGINHEIGHT='0' MARGINWIDTH='0' BGCOLOR='#ffffff'>";
    content += "<TABLE WIDTH='100%' BORDER='0' CELLPADDING='0' CELLSPACING='0' BGCOLOR='#e1e1e1'>";
    content += "<TR>";
    content += "<TD BGCOLOR='#999999'><IMG SRC='/images/common/header_marker.gif' WIDTH='10' HEIGHT='22'>";
    content += "<IMG SRC='/images/main/spacer.gif' WIDTH='12' HEIGHT='1'></TD>";
    content += "<TD BGCOLOR='#999999' class='compTitle'>Default Password</TD>";
    content += "<TD BGCOLOR='#999999'><IMG SRC='/images/main/spacer.gif' WIDTH='45' HEIGHT='1'></TD>";
    content += "</TR>";
    content += "<TR VALIGN='top'>";
    content += "<TD BGCOLOR='#e1e1e1' VALIGN='top' align='center'>";
    content += "<IMG SRC='/images/common/bullet_square.gif' WIDTH='5' HEIGHT='5' vspace='10'></TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='100%' HEIGHT='6'><BR>";
    content += "<SPAN style='font-family:verdana,geneva,sans-serif; font-size:11px; color:#333333'>";
    content += "If you are a first time user enter the default password based on the format "; 
    content += "described below. Otherwise, use the temporary password you received when you "; 
    content += "reset your password.</SPAN>";
    content += "</TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='0' HEIGHT='1'></TD>";
    content += "</TR>";
    content += "<TR VALIGN='top'>";
    content += "<TD BGCOLOR='#e1e1e1' VALIGN='top' align='center'>";
    content += "<IMG SRC='/images/common/bullet_square.gif' WIDTH='5' HEIGHT='5' vspace='10'></TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='100%' HEIGHT='6'><BR>";
    content += "<SPAN style='font-family:verdana,geneva,sans-serif; font-size:11px; color:#333333'>";
    content += "<B>Default Password</b> is CaSe SeNsItIvE and letters are in Upper Case";
    content += "</SPAN>";
    content += "</TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='0' HEIGHT='1'></TD>";
    content += "</TR>";
    content += "<TR VALIGN='top'>";
    content += "<TD BGCOLOR='#e1e1e1' VALIGN='top' align='center'>";
    content += "<IMG SRC='/images/main/spacer.gif' WIDTH='5' HEIGHT='5' vspace='10'></TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='100%' HEIGHT='6'><BR>";
    content += "<SPAN style='font-family:verdana,geneva,sans-serif; font-size:11px; color:#333333'>";
    content += "<center>The following is an example only!";
    content += "</center>";
    content += "Please do not type the following example as your default password.  ";
    content += "Use your own information when entering your default password.</SPAN>";
    content += "</TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='0' HEIGHT='1'></TD>";
    content += "</TR>";
    content += "<TR VALIGN='top'>";
    content += "<TD BGCOLOR='#e1e1e1' VALIGN='top' align='center'>";
    content += "<IMG SRC='/images/main/spacer.gif' WIDTH='5' HEIGHT='5' vspace='10'></TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='100%' HEIGHT='1'><BR>";
    content += "<IMG SRC='/images/main/default_password_new.gif' WIDTH='370' HEIGHT='85'>";
    content += "</TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='0' HEIGHT='1'></TD>";
    content += "</TR>";
    content += "<TR VALIGN='top'>";
    content += "<TD BGCOLOR='#e1e1e1' VALIGN='top' align='center'></TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='100%' HEIGHT='15'><BR>";
    content += "</TD>";
    content += "<TD BGCOLOR='#e1e1e1'><IMG SRC='/images/main/spacer.gif' WIDTH='0' HEIGHT='1'></TD>";
    content += "</TR>";
    content += "</TABLE>";
    content += "</BODY></HTML>";
    pop = window.open ("","",config);
    pop.document.open();
    pop.focus();
    pop.document.write(content);
    pop.document.close();
}


