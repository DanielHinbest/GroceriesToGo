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
	SELECT product_name, product_brand, product_cost, store_name, cart_item_id, product_image
	FROM CartItem
	INNER JOIN Product ON CartItem.product_id = Product.product_id
	INNER JOIN Store ON CartItem.store_id = Store.store_id
	WHERE user_id = ?;
	<sql:param value="${user_id }"/>
</sql:query>

<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<jsp:useBean id="contextPath" type="java.lang.String"/>
		<% response.sendRedirect(contextPath + "/login"); %>
	</c:if>
	<h2>Your cart</h2>
	
		<table border="1" width="66%">
			<tr>
				<th></th>
				<th>Item</th>
				<th>Brand</th>
				<th>Cost</th>
				<th>Store</th>
			</tr>
			<c:forEach var="cart" items="${cart_items.rows}">
				<tr>
					<td align="center"><img src="${contextPath}/resources/images/products/${cart.product_image}" alt="Product image" height="100"></td>
					<td><c:out value="${cart.product_name}"/></td>
					<td><c:out value="${cart.product_brand}"/></td>
					<td><c:out value="${cart.product_cost}"/></td>
					<td><c:out value="${cart.store_name}"/></td>
					<td>					
						<form action="${contextPath}/cart/${cart.cart_item_id}">
							<input class="btn btn-primary btn-block" type="submit" value="Remove"/>						
						</form>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
					<form method="POST" action="${contextPath}/cart">
			         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			    		<button class="btn btn-primary btn-block" type="submit">Checkout</button>
			    	</form>
				</td>
			</tr>
		</table>	
		
</div>
<%@ include file="layouts/footer.jsp"%>