<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 3, 2022
 -->
<% String title = "Home"; %>
<%@ include file="layouts/header.jsp"%>
<c:set var="username" value="${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="result">
	SELECT * FROM User WHERE username = ?
	<sql:param value="${username}"/>
</sql:query>
<c:forEach var="users" items="${result.rows }">
	<c:set var="user_id" value="${users.id }"/>
</c:forEach>
<sql:query dataSource="${snapshot}" var="cart_items">
	SELECT * FROM CartItem WHERE user_id = ?
	<sql:param value="${user_id }"/>
</sql:query>

<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	<h2>Your cart</h2>
</div>
<%@ include file="layouts/footer.jsp"%>