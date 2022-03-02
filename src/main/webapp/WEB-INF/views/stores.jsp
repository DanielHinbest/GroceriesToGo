<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Welcome"; %>
<%@ include file="layouts/header.jsp"%>
<sql:query dataSource="${snapshot}" var="stores">
		SELECT * FROM Store ORDER BY city, store_name ASC
</sql:query>
<div class="container">
	
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
	        <form id="logoutForm" method="POST" action="${contextPath}/logout">
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        </form>
	  <h3>Our Stores</h3>
	  <p>Some text that describes me lorem dfgfdg ipsum ipsum lorem.
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
			
			<c:forEach var="storeList" items="${stores.rows}">
				<tr>
					<c:if test="${storeList.enabled}">
						<td><a href="stores/${storeList.store_id}"><c:out value="${storeList.store_name}"/></a></td>						
					</c:if>
					<c:if test="${!storeList.enabled}">
						<td><c:out value="${storeList.store_name}"/></td>		
					</c:if>
					<td><c:out value="${storeList.address_line_1}"/> <c:out value="${storeList.address_line_2}"/></td>
					<td><c:out value="${storeList.city}"/></td>
					<td><c:out value="${storeList.postal_code}"/></td>
					<td><c:out value="${storeList.phone_number}"/></td>
				</tr>
			</c:forEach>
		</table>
  	</c:if>
  </div>
<%@ include file="layouts/footer.jsp"%>