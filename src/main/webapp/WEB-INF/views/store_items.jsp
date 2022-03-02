<% 
	// Find a way to change to store name
	String title = "Select Items"; 
%>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="store">
	SELECT * FROM Store WHERE store_id = ?;
    <sql:param value="${store}" />
</sql:query>
<sql:query dataSource="${snapshot}" var="items">
	SELECT * FROM Item
</sql:query>
<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login");	%>
	</c:if>
    	<form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        
		<p><a href="/stores">Back to store list</a></p>
		<c:forEach var="store" items="${store.rows}">
			<h2><c:out value = "${store.store_name}"/></h2>
		</c:forEach>
		
		<h3>Select the items you would like to add to your cart</h3>
		
		<table border="1" width="66%">
			<tr>
				<th>Item</th>
				<th>Brand</th>
				<th>Cost</th>
				<th>Department</th>
			</tr>
			<c:forEach var="itemList" items="${items.rows}">
				<tr>
					<td><c:out value="${itemList.item_name}"/></td>	
				</tr>
			</c:forEach>
		</table>
</div>

<%@ include file="layouts/footer.jsp"%>