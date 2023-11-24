<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="connection.DbCon"%>
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

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>

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
	/* background-color: bisque; */
	
	font-family: arial;
	position: relative;
}

body::before {
	content: "";
	background-image: url("images/bg1.jpg");
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
	width: 20%;
	display: inline-block;
	box-shadow: 2px 2px 20px black;
	backdrop-filter: blur(50px);
	background: transparent; 
	/* background-color:white; */
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
			<h1>All Products</h1>
		</center>
		<%
			if (products != null && !products.isEmpty()) {
			for (Product p : products) {
		%>

		<div class="card">
			<div class="image">
				<img src="images/<%=p.getImage()%>">
			</div>
			<div class="card-body">
				<h5 class="card-title"><%=p.getName()%></h5>
				<h6 class="price">
					Price:
					<%=p.getUnitprice()%></h6>
				<h6 class="category">
					Category:<%=p.getCategory()%></h6>
				<a class="btn btn-primary custom-button"
					href="add-to-cart?action=addtocart&id=<%=p.getProduct_id()%>">Add
					to Cart</a>

			</div>
		</div>

		<%
			}
		}
		%>

	</div>
	<%@include file="footer.jsp"%>

</body>
</html>