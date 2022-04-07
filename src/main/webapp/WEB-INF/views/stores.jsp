<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Welcome"; %>
<%@ include file="layouts/header.jsp"%><sql:query dataSource="${snapshot}" var="stores">
		SELECT * FROM Store ORDER BY city, store_name ASC;
</sql:query>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/table.css">

<div class="container">
	
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<jsp:useBean id="contextPath" type="java.lang.String"/>
		<% response.sendRedirect(contextPath + "/login"); %>
	</c:if>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
	        &nbsp;
	        	  &nbsp;

            	  	  &nbsp;
	  <h3 style="text-align: center; font-size:40px">Our Stores</h3>
	  &nbsp;
	  	  &nbsp;

	  	  &nbsp;
  	<h3 style="text-align: center;">Where would you like to order from today?</h3>
		&nbsp;
        	  	  &nbsp;
		<table class="table">
			<tr class="thread-dark">
				<th>Store</th>
				<th>Address</th>
				<th>City</th>
				<th>Postal Code</th>
				<th>Phone Number</th>
				<th>Store Information</th>
			</tr>
					
			
			<c:forEach var="row" items="${stores.rows}">
				<tr>
					<td><a href="${contextPath}/stores/${row.store_id}"><c:out value="${row.store_name}"/></a></td>					
					<td><c:out value="${row.address_line_1}"/> <c:out value="${row.address_line_2}"/></td>
					<td><c:out value="${row.city}"/></td>
					<td><c:out value="${row.postal_code}"/></td>
					<td><c:out value="${row.phone_number}"/></td>
					<td>
						<a href="${row.store_location }">View map</a>
						<br/>
						<a href="${row.store_website}">View website</a>
					</td>
				</tr>
			</c:forEach>
		</table>
  	</c:if> 
  </div>
<%@ include file="layouts/footer.jsp"%>