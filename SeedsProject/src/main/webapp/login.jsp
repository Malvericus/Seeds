<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Shopping Cart</title>
</head>
<body style='background-color:#FFF6FA;'>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Shopping Cart</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
					<%
					if (auth != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center bg-danger text-white">User Login</div>
			<div class="card-body" style='background-color:#FFDCDC;'>
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email </label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email" style='background-color:#FFF6FA;'>
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Enter password" style='background-color:#FFF6FA;'>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-danger">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
           <br>
           <br>
           <br>
	<%@include file="/includes/footer.jsp"%>
            <%@include file="/includes/html/foot.html"%>
</body>
</html>