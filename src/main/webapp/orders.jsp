<%@page import="food.connection.DbConnection" %>
<%@page import="food.model.*" %>
<%@page import="food.dao.*" %>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if(auth!=null){
    	request.setAttribute("person", auth);
    	
   	     OrderDao orderDao  = new OrderDao(DbConnection.getConnection());
		orders = orderDao.userOrders(auth.getId());
    }
    ArrayList<Cart> cart_list=(ArrayList<Cart>) session.getAttribute("cart-list");

    if(cart_list!=null){
    	if (cart_list != null) {
    		request.setAttribute("cart_list", cart_list);
    	}
    	
    }
    %>
<!DOCTYPE html>
<html>
<head>


<%@include  file="includes/head.jsp"%>

<title>Orders page</title>
</head>

<body>
<%@include  file="includes/navbar.jsp"%>

<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity() %></td>
						<td><%=o.getPrice() %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderid() %>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>

<%@include  file="includes/footer.jsp"%>


</body>
</html>