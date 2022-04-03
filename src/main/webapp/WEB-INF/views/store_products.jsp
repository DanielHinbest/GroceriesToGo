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
<sql:query dataSource="${snapshot}" var="result">
	SELECT * FROM User WHERE username = ?
	<sql:param value="${username}"/>
</sql:query>
<sql:query dataSource="${snapshot}" var="results">
	SELECT product_id, product_name, product_brand, product_cost, department_name, product_image, Department.department_id, Store.store_id, store_name, 
	store_map_html, store_location, store_website
	FROM Product
	INNER JOIN Store ON Product.store_id = Store.store_id
    INNER JOIN Department ON Product.department_id = Department.department_id
	WHERE Store.store_id = ?
    ORDER BY department_name ASC;
	<sql:param value="${store}"/>
</sql:query>

<c:forEach var="users" items="${result.rows }">
	<c:set var="user_id" value="${users.id }"/>
</c:forEach>

<c:forEach var="row" items="${results.rows}">
	<c:set var="store_id" value="${row.store_id}"/>
	<c:set var="store_name" value="${row.store_name}"/>
	<c:set var="store_map" value="${row.store_map_html}"/>
	<c:set var="store_location" value="${row.store_location}"/>
	<c:set var="store_website" value="${row.store_website}"/>
</c:forEach>

<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login");	%>
	</c:if>
	<div class="row">
		<div class="col-50">
			<h2><a href="${store_website}"/>${store_name}</a></h2>
		</div>
		<div class="col-50">
			<span class="price"><p><a href="${contextPath}/stores">Back to store list</a></p></span>
		</div>
	</div>
	${store_map}
	
	<h3>Select the products you would like to add to your cart</h3>
		
		<table border="1" width="100%">
			<tr>
				<th></th>
				<th>Product</th>
				<th>Brand</th>
				<th>Cost</th>
				<th>Department</th>
			</tr>
			<c:forEach var="product_list" items="${results.rows}">			
				<tr>
					<td align="center"><img src="${contextPath}/resources/images/products/${product_list.product_image}" alt="Product image" height="100"></td>
					<td><a href="${contextPath}/stores/${store}/${product_list.product_id}"><c:out value="${product_list.product_name}"/></a></td>
					<td><c:out value="${product_list.product_brand}"/></td>
					<td><c:out value="${product_list.product_cost}"/></td>
					<td><c:out value="${product_list.department_name}"/></td>
    				<td>
    					<form action="${contextPath}/stores/${store}/${product_list.product_id}/add">
    						<input class="btn btn-primary btn-block" type="submit" value="Add To Cart"/>
						</form>
    				</td>
				</tr>
			</c:forEach>
		</table>
</div>
<%@ include file="layouts/footer.jsp"%>