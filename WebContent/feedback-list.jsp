<%@page import="java.util.List"%>
<%@page import="dao.FeedbackRecordDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	/*  User auth = (User) request.getSession().getAttribute("auth");
if(auth != null)
{
 request.setAttribute("auth",auth);
}   */

FeedbackRecordDao feedbackRecordDao = new FeedbackRecordDao();
List<FeedbackRecord> feedbackRecords = feedbackRecordDao.selectAllFeedbackRecords();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>

<%@include file="header.jsp"%>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />


<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
}

body {
	background-color: bisque;
	font-family: arial;
	position: relative;
}

body::before {
	content: "";
	background-image: url("images/feedbackbg.jpeg");
	filter: blur(5px); /* Adjust the blur value as needed */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	opacity: 0.7; /* Adjust the opacity as needed */
}

.main {
	margin: 2%;
}

.card {
	width: 70%;
	display: inline-block;
	box-shadow: 2px 2px 20px black;
	backdrop-filter: blur(50px);
	/* background: transparent;  */
	background-color : white; 
	border-radius: 5px;
	margin: 2%;
}

.image img {
	width: 100%;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
}

.card-title {
	text-align: center;
	padding: 10px;
	font-size: 20px;
}

 .button-new {
	
	background-color:#348781;
	color: #fff;
	padding: 10px 30px;
	border: none;
	cursor: pointer;
	border-radius : 80%;
	text-decoration: none;
} 



.button-edit {
	float: right; 
	text-decoration: none; 
	color: #007BFF; 
	padding: 2px 5px;
}

.button-delete {
	float: right; 
	text-decoration: none; 
	color: #FF3737; 
	padding: 2px 5px;
}

h5 {
	color: black;
}

h6 {
	font-size: 15px;
	padding: 3px;
	text-align: center;
	padding-top: 10px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	font-weight: 100;
}

h1{
   font-family: Cursive
}

.custom-button {
	text-align: center;
	background-color: #e7e7e7;
	color: black;
	border: 1px solid black;
	border-radius: 5px;
	padding: 10px;
	margin: 0 auto; /* This centers the button horizontally */
	display: block;
	/* Ensure the button takes the full width of its container  */
	text-decoration: none;
}

.custom-button:hover {
	background-color: green; /* Change the background color on hover */
	color: white; /* Change text color on hover */
	transition: 0.5s;
	cursor: pointer;
	text-decoration: none;
}
</style>

</head>
<body>

     <div class="main">
		<center>
		<h1>We Want Your Feedback.....</h1>
		<br>
		<a class="button-new"
			href="feedback-form.jsp">
			Add Feedback
		</a>
		<br>
		<br>

		<%
		if (feedbackRecords != null && !feedbackRecords.isEmpty()) {
			for (FeedbackRecord r : feedbackRecords) {
		%>
	        <div class="card">
				<div class="card-body">
					<h5 class="card-title">"<%=r.getFeedback()%>"</h5>
					<h6 class="price">
						- <%=r.getFirstname()%> <%=r.getLastname()%> -
					</h6>
										
						<a class="button-delete"
							href="<%= request.getContextPath() %>/feedback/delete?f_id=<%=r.getF_id()%>">
							Delete
						</a>
						
						<a class="button-edit"
							href="<%= request.getContextPath() %>/feedback/edit?f_id=<%=r.getF_id()%>">
							Edit
						</a>
						
					
				</div>
			</div>
		<%
			}
		}
		%>
		</center>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
	<%@include file="footer.jsp"%>

</body>
</html>