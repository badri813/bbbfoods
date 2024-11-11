<%@page import="food.connection.DbConnection"%>
<%@page import="food.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="food.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd=new ProductDao(DbConnection.getConnection());
List<Product> products= pd.getAllProducts();
ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");

if(cart_list!=null){
	
	request.setAttribute("cart_list", cart_list);
	
	
}

%>
<!DOCTYPE html>
<html>
<head>

<title>Welcome to BBB foods</title>
<%@include file="includes/head.jsp"%>

</head>
<body>


	<%@include file="includes/footer.jsp"%>


	<%@include file="includes/navbar.jsp"%>


	<div class="container">
		<div class="card-header my-3">All products</div>
		<div class="row">
		
		<%
		if(!products.isEmpty()){
			for(Product p: products){%>
				
				<div class="col-md-3 my-3">

				<div class="card " style="width: 18rem;">
					<img src="product-images/<%=p.getImage() %>" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: <%=p.getPrice() %></h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 f-flex justify-content-between">
						<a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark">Add to cart</a>
						
						
						
						
						</div>
						
					</div>
				</div>

			</div>
				
			<% }
		}
		%>
			
		</div>

	</div>



</body>
</html>