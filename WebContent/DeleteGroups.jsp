<%--*******************************************************************
 *	RealityUWeb: CreateRoster.jsp
 	Created by Holstan,Josh,Ken 9/28/14
 *  10/12/2014
 Page used for Deleting all groups
 *******************************************************************--%>
<%@page import="dao.GroupsDAO"%>
<%@page import="obj.Group"%>
<%@page import="obj.Survey"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="dao.CoordinatorDAO" %>
<%@page import ="obj.Coordinator" %>
<% 
//RESET ALL SESSION OBJECTS TO NULL TO CLEAR OUT VALUES
Group grpp = null;
obj.Occupation ocp = null;
Survey survey = null;
String mssg = null;
HttpSession ses1 = request.getSession();
//For newgroup.jsp
ses1.setAttribute("newGrp", grpp);
ses1.setAttribute("newGroupMsg", mssg);
//For opengroup.jsp
	//DON'T CLEAR FOR THIS PAGE
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

obj.Group openGrp =(obj.Group)session.getAttribute("openGrp");
List<String> lstGroups = new ArrayList<String>();
List<Group> displayGroups = new ArrayList<Group>();
GroupsDAO gd = new GroupsDAO();
lstGroups = gd.findExpiredDates();
displayGroups = gd.diplayGroups();
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
	<li><a href="coordinatorlist.jsp">View Coordinators</a></li>
	<li><a href="regis.jsp">Admin Registration</a></li>
	<li><a href="occupations.jsp">Edit Occupations</a></li>
    <li><a href="helpadmin.html">Help</a></li>
  </ul>
</div><!--END NAVIGATION-->


</div><!--END HEADER-->



<!--MAIN CONTENT CONTAINER -->
<div id="main">

<br><br>

<fieldset>
<h3>Delete Group</h3>
</fieldset>



<br><br>

<div id="mainArea">

<!--START FORM-->
<!--Didn't change the name of the form below
its saved to a css i wanted to keep     -->
<form id="newGroupForm" name= "deletegroup">

<fieldset>
<br><br>
<div class = goleft>
<div class="FixedHeightContainer">
<div class="Content">
<br>
<br>

<%int count = 1; %>
<%GroupsDAO deletegroup = new GroupsDAO(); %>
<%for (int i = 0; i < lstGroups.size(); i++)
{ %>  
	<input type="hidden" value="<%out.println(lstGroups.get(i));%>" id="submit" name="deleteid <%out.println(lstGroups.get(i));%>"> 
	             
<table align="left";>	 	
		<tr>
		<% i++; %>
		<td><label for="input3">Event Expired</label></td>
		<td><div style="overflow:visible"><input style="width:10000%"  name="date" type="text" value = <% out.println(lstGroups.get(i)); %>></div></td>
		<% i++; %>
		<td><label for="school">High School:</label></td>
		<td><div style="overflow:visible"><input style="width:10000%" name="school" type="text" value = "<% out.println(lstGroups.get(i));%>"></div></td>
		<% i++; %>
		<td><label for="input2">Teacher:</label></td>
		<td><div style="overflow:visible"><input style="width:10000%"  name="teacher" type="text" value = <%  out.println(lstGroups.get(i));%>></div></td>
		<% i++; %>
		<td><label for="input3">Class Period</label></td>
		<td><div style="overflow:visible"><input style="width:10000%"  name="date" type="text" value = <% out.println(lstGroups.get(i)); %>></div></td>
	</tr>
	
</table>
<br>
<br>
 
<%}%>

</div>
<br>
<br>
</div>
</div>
</fieldset>

<!--END FORM-->
<div id="formButtonsContainer">
		  <div id="formButtons">		
				<a href = "http://localhost:8080/RealityUWeb/DeleteAllExpiredSurvlet"><input type="button" value="Delete All Groups" id="submit" name="deleteAll" onclick="btn='submit';"></a>
		  </div>
		</div>
</form>

</div><!--END mainArea-->



</div><!--END Main Area-->



</div><!--END Content Wrapper-->


<!--FOOTER OUTSIDE WRAPPER-->
<div id="footer" class="legal">
Copyright &copy; 2009-2014 CIS of Marietta/Cobb County
</div><!--END FOOTER-->


</body>
</html>
