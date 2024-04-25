<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>Seed Site</title>
</head>
<body style='background-color:#FFF6FA;'>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Seed For Life</a>
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
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100vw; height: 500px;">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner" style="height: 100%;">
    <div class="carousel-item active" style="height: 100%;">
      <img class="d-block w-100 h-100" src="images/wheat.jpeg" alt="Wheat" style="object-fit: cover;">
    </div>
    <div class="carousel-item" style="height: 100%;">
      <img class="d-block w-100 h-100" src="images/grass.jpg" alt="Grass" style="object-fit: cover;">
    </div>
    <div class="carousel-item" style="height: 100%;">
      <img class="d-block w-100 h-100" src="images/plant.jpg" alt="Plant" style="object-fit: cover;">
    </div>
    <div class="carousel-item" style="height: 100%;">
      <img class="d-block w-100 h-100" src="images/nico.jpeg" alt="Nico" style="object-fit: cover;">
    </div>
    <div class="carousel-item" style="height: 100%;">
      <img class="d-block w-100 h-100" src="images/tulip.jpeg" alt="Tulip" style="object-fit: cover;">
    </div>
  </div>

  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	<div class="container">
    <div class="card-header my-3 text-center" style='background-color:#FFF6FA;'>
        <h3>Products</h3>
    </div>
    <div class="row">
	  <% if (!products.isEmpty()) { for (Product p : products) { %>
	  <div class="col-md-4 my-3">
	    <div class="card w-100">
	      <img class="card-img-top" src="images/<%=p.getImage() %>" alt="Card image cap" style="height: 250px; object-fit: cover;">
	      <div class="card-body" style='background-color:#FEE5E5;'>
	        <h5 class="card-title"><%=p.getName() %></h5>
	        <h6 class="price">Price: $<%=p.getPrice() %></h6>
	        <h6 class="category">Category: <%=p.getCategory() %></h6>
	        <div class="mt-3 d-flex justify-content-between">
	          <a class="btn btn-dark" href="${pageContext.request.contextPath}/add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
	          <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
	        </div>
	      </div>
	    </div>
	  </div>
	  <% } } else { out.println("There is no proucts"); } %>
	</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
           <%@include file="/includes/html/foot.html"%>
</body>
</html>