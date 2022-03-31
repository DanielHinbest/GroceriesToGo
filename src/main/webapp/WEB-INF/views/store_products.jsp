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

<c:forEach var="users" items="${result.rows }">
	<c:set var="user_id" value="${users.id }"/>
</c:forEach>

<c:forEach var="row" items="${stores.rows}">
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
			<span class="price"><p><a href="/stores">Back to store list</a></p></span>
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
			<c:forEach var="product_list" items="${product.rows}">			
				<tr>
					<td align="center"><img src="${contextPath}/resources/images/products/${product_list.product_image}" alt="Product image" height="100"></td>
					<td><a href="${store}/${product_list.product_id}"><c:out value="${product_list.product_name}"/></a></td>
					<td><c:out value="${product_list.product_brand}"/></td>
					<td><c:out value="${product_list.product_cost}"/></td>
					<c:forEach var="departmentList" items="${departments.rows}">
						<c:if test="${product_list.department_id == departmentList.department_id}">
							<td><c:out value="${departmentList.department_name}"/></td>
						</c:if>
					</c:forEach>
    				<td>
    					<form action="${contextPath}/stores/${store_id}/${product_list.product_id}/add">
    						<input class="btn btn-primary btn-block" type="submit" value="Add To Cart"/>
						</form>
    				</td>
				</tr>
			</c:forEach>
		</table>
</div>
<%@ include file="layouts/footer.jsp"%>