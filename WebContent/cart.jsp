<%@page import="connection.DbCon" %>
<%@page import="dao.ProductDao" %>
<%@page import= "model.*" %>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import = "Servlet.AddToCartServlet" %>
<%@page import="Servlet.QuantityIncreDecreServlet" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
 

/* User auth = (User) request.getSession().getAttribute("auth");
if(auth != null)
{
	request.setAttribute("auth",auth);
} */

DecimalFormat dcf = new DecimalFormat("#,##");
request.setAttribute("dcf",dcf);

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list !=null)
{
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getToatalCartPrice(cart_list);
	request.setAttribute("cart_list",cart_list);
	request.setAttribute("total",total);
}



%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Commerce Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
}

body::before {
	content: "";
	background-image: url("images/cartbg1.jpg");
	filter: blur(2px); /* Adjust the blur value as needed */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	opacity: 0.7; /* Adjust the opacity as needed */
}

.container1 {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h3 {
	margin: 0;
	text-align: left;
}

.cart-total {
	text-align: right;
}

.cart-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.cart-table th, .cart-table td {
	border: none; /* Remove table borders */
	padding: 8px;
	text-align: left;
}

.cart-table th {
	background-color: #f2f2f2;
}

.product-actions {
	display: flex;
	align-items: center;
}

.quantity {
	width: 50px;
	text-align: center;
}

.action-button {
	background: none;
	border: none;
	font-size: 20px;
	cursor: pointer;
	color:black;
}

.buy-button {
	float: right; /* Move to the right corner */
	background-color: #007BFF;
	color: #fff;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
	text-decoration: none;
}

.remove-button {
	background-color: #FF3737;
	color: #fff;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
	border-radius : 80%;
	text-decoration: none;
}

.checkout-section {
	display: flex;
	justify-content: space-between;
	align-items: center; 
}

.badge-danger
{   top: 0;
    right: 0;
    font-size: 11px;
    background: #d60b28;
    width: 16px;
    height: 16px;
    display: block;
    /* font-family: 'Roboto', sans-serif; */
    /* border-radius: 30%; */
    padding: 1px 6px;
    border-radius:20%; 
    display: flex;
    justify-content: center;
    align-items: center;
 } 

</style>
</head>
<body>
<jsp:include page="header.jsp"/>

<br><br>
    <div class="container1">
        <div class="checkout-section">
            <h3>  <span class=" badge-danger">${cart_list.size() }</span><i class="fa fa-shopping-cart" style="font-size:24px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Price: Rs. ${ (total >0)? total:0}0</h3>
            
            <a class="buy-button" href="cart-check-out">Check Out</a>
        </div>
        
        
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Cancel</th>
                </tr>
            </thead>
            <tbody>

				 
    <%if (cart_list != null ) {
        for (Cart c : cartProduct) 
        {%>
        	<tr>
            <td><%= c.getName() %></td>
            <td><%= c.getCategory() %></td>
            <td>Rs. <%= c.getUnitprice() %>0</td>
            <td>
                <div class="product-actions">
                    <form action="" method="post" class="form-inline">
                        <input type="hidden" name="id" value="<%= c.getProduct_id() %>" class="form-input">
                       
                        <a class="action-button" href="QuantityIncreDecreServlet?action=dec&id=<%= c.getProduct_id() %>" style="margin-right: 10px;"><i class="fas fa-minus-square"></i></a>
                        
                        <input type="text" name="quantity" style="margin-right: 10px;"class="quantity" value="<%= c.getQty() %>" readonly>
                        
                        <a class="action-button" href="QuantityIncreDecreServlet?action=inc&id=<%= c.getProduct_id() %>" style="margin-right: 10px;"><i class="fas fa-plus-square"></i></a>
                        
                        
                        </form>
                </div>
            </td>
            <td><a class="remove-button" href="RemoveFromCartServlet?id=<%= c.getProduct_id() %>">Remove</a></td>
        </tr>
       <%}
    }%>
   
            </tbody>
        </table>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp" />
</body>
</html>
