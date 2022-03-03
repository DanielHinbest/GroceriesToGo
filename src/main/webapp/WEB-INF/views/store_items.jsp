<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% 
	// Find a way to change to store name
	String title = "Select Items"; 
%>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="stores">
	SELECT * FROM Store WHERE store_id = ?;
	<sql:param value="${store}"/>
</sql:query>

<sql:query dataSource="${snapshot}" var="items">
	SELECT * FROM Item WHERE store_id = ?;
	<sql:param value="${store}"/>
</sql:query>

<c:forEach var="row" items="${stores.rows}">
	<c:set var="store_name" value="${row.store_name}"/>
</c:forEach>
<c:forEach var="row" items="${items.rows}">
	<c:set var="item_id" value="${row.item_id}"/>
</c:forEach>


<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login");	%>
	</c:if>
		<p><a href="/stores">Back to store list</a></p>
	<h2><c:out value="${store_name}"/></h2>
	<h2><c:out value="${item_id}"/></h2>

	<h3>Select the items you would like to add to your cart</h3>
		
		<table border="1" width="66%">
			<tr>
				<th>Item</th>
				<th>Brand</th>
				<th>Cost</th>
				<th>Department</th>
			</tr>
		</table>
</div>

<%@ include file="layouts/footer.jsp"%>