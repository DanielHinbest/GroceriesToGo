<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% 
	// Find a way to change to store name
<<<<<<< HEAD
	String title = "Select Products"; 
=======
	String title = "Select Items"; 
>>>>>>> branch 'main' of https://github.com/DanielHinbest/GroceriesToGo
%>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
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
				<tr>
					<td><c:out value="${product_list.product_name}"/></td>
					<td><c:out value="${product_list.product_brand}"/></td>
					<td><c:out value="${product_list.product_cost}"/></td>
					<c:forEach var="departmentList" items="${departments.rows}">
						<c:if test="${product_list.department_id == departmentList.department_id}">
							<td><c:out value="${departmentList.department_name}"/></td>
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
</div>

<%@ include file="layouts/footer.jsp"%>