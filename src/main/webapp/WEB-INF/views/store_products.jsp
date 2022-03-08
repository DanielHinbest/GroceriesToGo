<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% 
	// Find a way to change to store name
	String title = "Select Products"; 
%>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="users">
	SELECT * FROM User WHERE username = ?;
	<sql:param value="${username}"/>
</sql:query>
<sql:query dataSource="${snapshot}" var="stores">
	SELECT * FROM Store WHERE store_id = ?;
	<sql:param value="${store}"/>
</sql:query>

<sql:query dataSource="${snapshot}" var="product">
	SELECT * FROM Product WHERE store_id = ?;
	<sql:param value="${store}"/>
</sql:query>

<sql:query dataSource="${snapshot}" var="departments">
	SELECT * FROM Department
</sql:query>

<c:forEach var="user" items="${users.rows}">
	<c:set var="user_id" value="${user.user_id}"/>
</c:forEach>

<c:forEach var="row" items="${stores.rows}">
	<c:set var="store_name" value="${row.store_name}"/>
</c:forEach>

<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login");	%>
	</c:if>
		<p><a href="/stores">Back to store list</a></p>
	<h2><c:out value="${store_name}"/></h2>
	<h3>Select the products you would like to add to your cart</h3>
		
		<table border="1" width="66%">
			<tr>
				<th>Product</th>
				<th>Brand</th>
				<th>Cost</th>
				<th>Department</th>
			</tr>
			<c:forEach var="product_list" items="${product.rows}">
				<sql:update dataSource="${snapshot}" var="add_to_cart">
					INSERT INTO CartItem (product_id, store_id, user_id) VALUES (?, ?, ?);
					<sql:param value="${product_list.product_id}"/>
					<sql:param value="${store}"/>
					<sql:param value="${user_id}"/>
				</sql:update>
				<tr>
					<td><c:out value="${product_list.product_name}"/></td>
					<td><c:out value="${product_list.product_brand}"/></td>
					<td><c:out value="${product_list.product_cost}"/></td>
					<c:forEach var="departmentList" items="${departments.rows}">
						<c:if test="${product_list.department_id == departmentList.department_id}">
							<td><c:out value="${departmentList.department_name}"/></td>
						</c:if>
					</c:forEach>
					<td><a href="#">Add to cart</a></td>
				</tr>
			</c:forEach>
		</table>
</div>

<%@ include file="layouts/footer.jsp"%>