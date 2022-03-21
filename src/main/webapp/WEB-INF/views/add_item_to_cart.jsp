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
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<sql:query dataSource="${snapshot}" var="result">
		SELECT * FROM User WHERE username = ?
		<sql:param value="${username}"/>
	</sql:query>
	
	<c:forEach var="user" items="${result.rows}">
		<c:set var="user_id" value="${user.id }"/>
	</c:forEach>

	<sql:update dataSource="${snapshot}" var="add_to_cart">
		INSERT INTO CartItem (product_id, store_id, user_id) VALUES (?, ?, ?);
		<sql:param value="${product}"/>
		<sql:param value="${store}"/>
		<sql:param value="${user_id}"/>
	</sql:update>
	<c:set var="store">${store}</c:set>
	<jsp:useBean id="store" type="java.lang.String"/>
	<% response.sendRedirect("/stores/" + store); %>
</c:if>
<%@ include file="layouts/footer.jsp"%>