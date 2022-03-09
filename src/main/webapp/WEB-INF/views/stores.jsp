<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Welcome"; %>
<%@ include file="layouts/header.jsp"%><sql:query dataSource="${snapshot}" var="stores">
		SELECT * FROM Store ORDER BY city, store_name ASC;
</sql:query>
<div class="container">
	
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
	        
	  <h3>Our Stores</h3>
	  <p>Some text that describes me lorem ipsum ipsum lorem.
	  </p>
  	<h3>Where would you like to order from today?</h3>
		
		<table border="1" width ="66%">
			<tr>
				<th>Store</th>
				<th>Address</th>
				<th>City</th>
				<th>Postal Code</th>
				<th>Phone Number</th>
			</tr>
					
			
			<c:forEach var="row" items="${stores.rows}">
				<tr>
					<c:if test="${row.enabled}">
						<td><a href="stores/${row.store_id}"><c:out value="${row.store_name}"/></a></td>						
					</c:if>
					<c:if test="${!row.enabled}">
						<td><c:out value="${row.store_name}"/></td>		
					</c:if>
					<td><c:out value="${row.address_line_1}"/> <c:out value="${row.address_line_2}"/></td>
					<td><c:out value="${row.city}"/></td>
					<td><c:out value="${row.postal_code}"/></td>
					<td><c:out value="${row.phone_number}"/></td>
				</tr>
			</c:forEach>
		</table>
  	</c:if>
  </div>
<%@ include file="layouts/footer.jsp"%>