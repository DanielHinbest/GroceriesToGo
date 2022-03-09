<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 3, 2022
 -->
<% String title = "Home"; %>
<%@ include file="layouts/header.jsp"%>
<c:set var="username" value="${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="result">
	SELECT * FROM User WHERE username = ?
	<sql:param value="${username}"/>
</sql:query>
<c:forEach var="users" items="${result.rows }">
	<c:set var="user_id" value="${users.id }"/>
</c:forEach>
<sql:query dataSource="${snapshot}" var="cart_items">
	SELECT product_name, product_brand, product_cost, store_name
	FROM CartItem
	INNER JOIN Product ON CartItem.product_id = Product.product_id
	INNER JOIN Store ON CartItem.store_id = Store.store_id
	WHERE user_id = ?;
	<sql:param value="${user_id }"/>
</sql:query>

<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	<h2>Your cart</h2>
	
	<table border="1" width="66%">
		<tr>
			<th>Item</th>
			<th>Brand</th>
			<th>Cost</th>
			<th>Store</th>
		</tr>
		<c:forEach var="cart" items="${cart_items.rows}">
			<tr>
				<td><c:out value="${cart.product_name}"/></td>
				<td><c:out value="${cart.product_brand}"/></td>
				<td><c:out value="${cart.product_cost}"/></td>
				<td><c:out value="${cart.store_name}"/></td>
				<td><a href="#">Remove</a></td>
			</tr>
		</c:forEach>
	</table>
    <button class="btn btn-primary btn-block" type="submit">Checkout</button>
</div>
<%@ include file="layouts/footer.jsp"%>