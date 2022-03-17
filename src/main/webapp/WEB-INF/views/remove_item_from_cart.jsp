<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Home"; %>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<sql:update dataSource="${snapshot}" var="remove_from_cart">
		DELETE FROM CartItem WHERE cart_item_id = ?
		<sql:param value="${cart_item}"/>
	</sql:update>
	<% response.sendRedirect("/cart"); %>
</c:if>
<%@ include file="layouts/footer.jsp"%>