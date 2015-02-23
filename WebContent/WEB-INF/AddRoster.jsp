<%@page import="java.util.List"%>
<% 
//RESET ALL SESSION OBJECTS TO NULL TO CLEAR OUT VALUES
obj.Group grpp = null;
List<obj.Survey> lstSurvs = null;
obj.Occupation ocp = null;
obj.Survey survey = null;
String mssg = null;
HttpSession ses1 = request.getSession();
//For newgroup.jsp
	//DON'T CLEAR FOR THIS PAGE
//For opengroup.jsp
ses1.setAttribute("openGrp", grpp);
ses1.setAttribute("lstSurveys", lstSurvs);
ses1.setAttribute("editGroupMsg", mssg);
ses1.setAttribute("isProcessed", mssg);
//For occupations.jsp
ses1.setAttribute("occupsMsg", mssg);
//For editoccups.jsp
ses1.setAttribute("editOccp", ocp);
ses1.setAttribute("editOccupsMsg", mssg);
//For surveyview.jsp
ses1.setAttribute("surveyviewGrp", grpp);
ses1.setAttribute("viewSurvey", survey);
ses1.setAttribute("surveyMssg", mssg);
//For surveprocessed.jsp	
ses1.setAttribute("surveyprocessGrp", grpp);
ses1.setAttribute("processSurvey", survey);
ses1.setAttribute("surveyProcMsg", mssg);

obj.Group newGrp =(obj.Group)session.getAttribute("newGrp");
%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<title>Communities In Schools - Reality U Admin New Group</title>
<meta charset="utf-8">
<!--Edge = render site in highest standards mode possible 8, 9..., chrome = use Google engine if installed-->

<meta http-equiv="pragma" content="no-cache">

<link rel="stylesheet" href="css/reset.css" media="screen">
<link rel="stylesheet" href="css/mainstyles.css" media="screen">

<!--FOR STICKY FOOTER IN OLDER IE BROWSERS (except IE 7 OK)-->
<!--[if (lt IE 9) & (!(IE 7))]>
	<style type="text/css">
		#wrapper {display:table; height:100%;}
	</style>
<![endif]-->


<!-- FORM VALIDATION -->
<script type="text/javascript">
	//Value of 'btn' set via onclick on submit/clear buttons at end of form
	var btn = "";
	
    function validate(myform) {
    	if (btn == "submit") {
       		//Validate Form only on 'submit' button (not for 'clear' button)
	        var num = 0;
	        var message = "";
	        if(myform.name.value == "") {
	            message += "- Group Name must be completed \n";
	            num = 1;
	        } 
	        if(myform.highschool.value == "") {
	            message += "- High School must be completed \n";
	            num = 1;
	        }
	        if(myform.teacher.value == "") {
	            message += "- Teacher must be completed \n";
	            num = 1;
	        }
	        if(myform.classPeriod.value == "") {
	            message += "- Period must be completed \n";
	            num = 1;
	        }	
	        if(myform.surveyStartDate.value == "") {
	            message += "- Survey Start Date must be completed \n";
	            num = 1;
	        }
	        if(myform.surveyEndDate.value == "") {
	            message += "- Survey End Date must be completed \n";
	            num = 1;
	        }
	        if(myform.eventDate.value == "") {
	            message += "- Event Date must be completed \n";
	            num = 1;
	        }
	
	        if (num == 1) { 
	            alert ("Please complete or correct the following required fields: \n\n"+message);
	            return false;
	        } else {
	            return true;
	        } //end if
    	} //end button if
    } //end func
</script>

</head>

<body>
<div id="wrapper">
 
<!--HEADER-->
<div id="header">

<img id="logoImg" src="images/cislogo.png" width="200" height="150" alt="Communities In Schools Logo">


<!--Header Text-->
<img id="headerText" src="images/realityuhead.png" width="600" height="80" alt="Reality University Program">
<!--REALITY U LOGO-->
<img id="logoImg2" src="images/realityulogo.png" width="100" height="95" alt="Reality U Logo">

<!--NAVIGATION-->
<div id="nav">
  <ul>
  	<li><a href="index.jsp">Home</a></li>	
	<li><a href="adminhome.jsp">Admin Home</a></li>
	<li><a href="newgroup.jsp">New Group</a></li>
    <li><a href="opengroup.jsp">Open Group</a></li>
	<li><a href="occupations.jsp">Edit Occupations</a></li>
    <li><a href="helpadmin.html">Help</a></li>
  </ul>
</div><!--END NAVIGATION-->


</div><!--END HEADER-->



<!--MAIN CONTENT CONTAINER -->
<div id="main">

<br><br>

<fieldset>
<h3>Edit Student Roster</h3>
</fieldset>



<br><br>

<div id="mainArea">

<!--START FORM-->
<form id="newGroupForm" method="post" action="http://localhost:8080/RealityUWeb/RosterServlet" onSubmit="return validate(this);">

<fieldset>
<br><br>

<% 
//If form never been filled in yet, all values are blank
if (session.getAttribute("newGrp") == null) {
%>
<div class="FixedHeightContainer">
<div class="Content">
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
<br>
<br>
<table align = "left">
<tr>
<td><label for="F">FirstName:</label></td>
<td><input style="width:10000%" id="input1" name="input1" type="text"></td>
<td><label for="input2">LastName:</label></td>
<td><input style="width:10000%" id="input2" name="input2" type="text"></td>
<td><label for="input3">DOB:(mm/dd/yyyy)</label></td>
<td><input style="width:100%" id="input3" name="input3" type="date"></td>
<td><label for="input4">GPA:</label></td>
<td><input style="width:3000%" id="input4" name="input4" type="text"></td>
</tr>
</table>
<br>
</div>
</div>

<%
//If form filled in and checked on server but not valid: have dupe
//Group Name, fill in with previous values with error message
} else { 



                    //String obj 'newGroupMsg' created in NewGroupServlet
                    //Display msg only if new group data submitted
                    if (session.getAttribute("newGroupMsg") != null) {
                        HttpSession ses = request.getSession();
                        String msg = (String)ses.getAttribute("newGroupMsg");
                        out.println("<h2 id='newGroupMsg'>"+msg+"</h2>");                  
                    } //end if              
%> 

	<div>
		<% 
		//If dupe Group Name, show message
		//Key: id 0=dupe group name (New Group), id -1=dupe group name (Edited Group)
		if (newGrp.getId() <= 0) { 
		%>
		<span class="inputErrorMsg">THIS GROUP NAME ALREADY USED. PLEASE RE-TRY</span><br><br>
		<% } //end if %>
		<label for="name">Group Name:</label>
		<input type="text" name="name" value="<%=newGrp.getName()%>">
	</div>
	<div>
		<label for="highschool">High School:</label>
		<input type="text" name="highschool" value="<%=newGrp.getHighschool()%>">
	</div>
	<div>
		<label for="teacher">Teacher:</label>
		<input type="text" name="teacher" value="<%=newGrp.getTeacher()%>">
	</div>
	<div>
		<label for="classPeriod">Period:</label>
		<input type="text" name="classPeriod" value="<%=newGrp.getClassPeriod()%>">
	</div>
	<div>
		<label for="surveyStartDate">Survey Start Date:</label>
		<input type="text" name="surveyStartDate" value="<%=newGrp.getSurveyStartDate()%>">
	</div>
	<div>
		<label for="surveyEndDate">Survey End Date:</label>
		<input type="text" name="surveyEndDate" value="<%=newGrp.getSurveyEndDate()%>">
	</div>	
	
	<div>
		<label for="eventDate">Event Date:</label>
		<input type="text" name="eventDate" value="<%=newGrp.getEventDate()%>">
	</div>
	<!--========================================-->
	<!--Adding Marriage Choice Radio Button		-->
	<!--           UPDATED CODE                 -->	
	<!--         Created by Josh                -->
	<!--========================================-->
	<div>
		<%
			if(newGrp.getmarriageChoice() .equals("yes")){%>
		<label>Marriages?</label>
		</br>				
		<label>Yes:</label><input type = "radio" name = "choice" value = yes checked="checked">
		<label>	No:</label><input type = "radio" name = "choice" value = no>
		<% }%>
		<%
			if(newGrp.getmarriageChoice() .equals("no")){%>	
			<label>Marriages?</label>
		</br>				
		<label>Yes:</label><input type = "radio" name = "choice" value = yes>
		<label>	No:</label><input type = "radio" name = "choice" value = no checked="checked">
		<%}%>	
		<!--    end of josh's code       -->
	</div>
	
	<div>
		
		<% 
		//If not a dupe Group Name, and new Group has been created, show message
		//Key: id 0=dupe group name (New Group), id -1=dupe group name (Editd Group) 
		if (newGrp.getId() > 0) { 
		%>
		<span class="inputErrorMsg">THIS IS THE GROUP'S STUDENT ACCESS CODE:</span><br><br>
		<% } //end if %>
		
		<label for="studentAccessCode">Student Access Code:</label>
		<input type="text" name="studentAccessCode" value="<%=newGrp.getStudentAccessCode()%>" readonly>
	</div>
		<div>
		
		<%
		//ADDED IN THE COORDINATORS PASSWORD ========JOSH
			 %>
		<span class="inputErrorMsg">THIS IS THE GROUP'S COORDINATORS PASS CODE:</span><br><br>
		<label for="coordinatorCode">Student Access Code:</label>
		<input type="text" name="coordinatorCode" value="<%=newGrp.getcoordinatorCode()%>" readonly>
	</div>
	
<% } //end if %>


</fieldset>

<br>

<!--SUBMIT FORM BUTTONS-->
		<div id="formButtonsContainer">
		  <div id="formButtons">		
				<input type="submit" value="Submit" id="submit" name="submit" onclick="btn='submit';">
		  </div>
		</div>

<br><br>

<!--END FORM-->
</form>

</div><!--END mainArea-->



</div><!--END Main Area-->


<!--FOR STICKY FOOTER-->
<div id="push"></div>


</div><!--END Content Wrapper-->


<!--FOOTER OUTSIDE WRAPPER-->
<div id="footer" class="legal">
Copyright &copy; 2009-2014 CIS of Marietta/Cobb County
</div><!--END FOOTER-->


</body>
</html>
