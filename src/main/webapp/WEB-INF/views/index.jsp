<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Home"; %>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from User WHERE username = ?
         <sql:param value = "${username}" />
</sql:query>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">

		<c:forEach var="row" items="${result.rows}">
        	<h2>Welcome <c:out value = "${row.firstName}"/></h2>
		</c:forEach>
	
		<p><a href="/stores">Store list</a></p>
		
	
    </c:if>
</div>

<%@ include file="layouts/footer.jsp"%>