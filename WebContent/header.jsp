<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grocery Mart</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: black;
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
        }
        
        .badge-danger {
    background-color: red;
    color: white;
    border-radius: 20%;
    padding: 1px 8px; /* Adjust the padding as needed */
    
  }
    </style>
</head>
<body>
    <header>
        <h1>Grocery Mart</h1>
    </header>
    
    <nav>
        <a href="home.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Shopping Cart</a>
        <a href="payment.jsp">Payment</a>
        <a href="feedback-list.jsp">Feedback</a>
        <a href="login.jsp">Login</a>
        <a href="profile.jsp">Profile</a>
    </nav>
</body>
</html>