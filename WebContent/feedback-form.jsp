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
FeedbackRecord existingFeedbackRecord = null;
String title="Add Feedback";
if (request.getParameter("f_id") != null) {
	int f_id = Integer.parseInt(request.getParameter("f_id"));
	FeedbackRecordDao feedbackRecordDao = new FeedbackRecordDao();
	existingFeedbackRecord = feedbackRecordDao.selectFeedbackRecord(f_id);
	if (existingFeedbackRecord != null) {
		title="Update Feedback";
	}
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Commerce Cart</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

body::before {
	content: "";
	background-image: url("images/feedbackbg.jpeg");
	filter: blur(2px); /* Adjust the blur value as needed */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	opacity: 0.7; /* Adjust the opacity as needed */
}


form {
	position: relative;
	width: 500px;
	margin: auto;
	padding: 20px;
	/*background:rgb(49, 110, 145);*/
	border: 2px solid rgba(255. 255. 255, .5);
	border-radius: 20px;
	backdrop-filter: blur(20px);
	box-shadow: 0 0 30px rgba(0, 0, 0, .5);
	justify-content: center;
	align-items: center;
	font-size: 14px;
	font-family: verdana;
	color: black;
}

form h2 {
	font-size: 1.5rem;
	color: #0a0e11;
	text-align: center;
}

div {
	margin-bottom: 10px;
}


label {
	display: inline-block;
	width: 150px;
	padding:10px 5px;
	text-align: right;
	margin-right: 10px;
}

input[type="text"], input[type="phone"], input[type="email"], 
	textarea {
	width: 200px;
}

input[type="submit"] {
	background-color: #162938;
	color: #fff;
	border-width: 0;
	border-color: transparent;
}

.submitBtn {
	background-color: #162938;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 1em;
	font-weight: 500;
	position: absolute;
	right: 20px;
	bottom: 20px;
	text-decoration: none;
}

h3 {
	margin: 0;
	text-align: left;
}
</style>


<script>
function validateForm() {
    var firstname = document.getElementsByName("firstname")[0].value.trim();
    var lastname = document.getElementsByName("lastname")[0].value.trim();
    var email = document.getElementsByName("email")[0].value.trim();
    var address = document.getElementsByName("address")[0].value.trim();
    var feedback = document.getElementsByName("feedback")[0].value.trim();

    if (firstname === '') {
        alert("Please enter a First Name.");
        return false;
    }
    
    if (lastname === '') {
        alert("Please enter a Last Name.");
        return false;
    }
    
    if (email === '' || !validateEmail(email)) {
        alert("Please enter a valid Email address.");
        return false;
    }
    
    if (address === '') {
        alert("Please enter an Address.");
        return false;
    }
    
    if (feedback === '') {
        alert("Please enter a Feedback.");
        return false;
    }

    return true;
}

function validateEmail(email) {
    
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailRegex.test(email);
}
</script>




</head>
<body>
	<jsp:include page="header.jsp" />

	<br>
	<br>
	<div class=container2>
	
		<!-- Form Action -->
		<%
		if (existingFeedbackRecord != null) {
		%>
			<!-- Update Mode: /feedback/update?f_id=__ -->
			<form action="<%= request.getContextPath() %>/feedback/update?f_id=<%= request.getParameter("f_id") %>" method="post" class="form-inline">
		<%
		}
		%>
		<%
		if (existingFeedbackRecord == null) {
		%>
			<!-- Create Mode: /feedback/insert -->
			<form action="<%= request.getContextPath() %>/feedback/insert" method="post" class="form-inline" onsubmit="return validateForm();">
		<%
		}
		%>	
			<!-- Form Title -->
			<br>
			<h2>
				<%= title%>
			</h2>
	
			<!-- Form Inputs -->
			<%
			if (existingFeedbackRecord != null) { 
			%>
				<!-- Update Mode: Show existing field values -->
				<br> 
					<label>First Name:</label> <input type="text" name="firstname" value="<%= existingFeedbackRecord.getFirstname() %>" required> 
				<br>
				<br> 
					<label>Last Name:</label> <input type="text" name="lastname" value="<%= existingFeedbackRecord.getLastname() %>" required> 
				<br>
				<br> 
					<label>Email:</label> <input type="email" name="email" value="<%= existingFeedbackRecord.getEmail() %>" required> 
				<br /> 
				<br /> 
					<label>Address:</label> <textarea name="address" rows="1" cols="20" required><%= existingFeedbackRecord.getAddress() %></textarea>
				<br /> 
				<br /> 
					<label>Feedback:</label> <textarea name="feedback" rows="3" cols="20" required><%= existingFeedbackRecord.getFeedback() %></textarea>
				<br />
			<%
			}
			%>
			<%
			if (existingFeedbackRecord == null) {
			%>
				<!-- Create Mode: Show placeholder values -->
				<br> 
					<label>First Name:</label> <input type="text" name="firstname" placeholder="First Name" required> 
				<br>
				<br> 
					<label>Last Name:</label> <input type="text" name="lastname" placeholder="Last Name" required> 
				<br>
				<br> 
					<label>Email:</label> <input type="email" name="email" placeholder="abc@gmail.com" required> 
				<br /> 
				<br /> 
					<label>Address:</label> <textarea name="address" rows="1" cols="20" required></textarea>
				<br /> 
				<br /> 
					<label>Feedback:</label> <textarea name="feedback" rows="3" cols="20" required></textarea>
				<br />
			<%
			}
			%>
			
			 	<!-- Form Submit -->
				<br /> 
				<br> 
				<br> 
				<br> 
				<a class="submitBtn"><input type="submit" value="Submit" /></a>
			</form>
	</div>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp" />
</body>
</html>