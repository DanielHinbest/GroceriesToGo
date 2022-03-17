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
	<sql:query dataSource="${snapshot}" var="stores">
		SELECT * FROM Store WHERE store_id = ?;
		<sql:param value="${store}"/>
	</sql:query>
	
	<sql:query dataSource="${snapshot}" var="product">
		SELECT * FROM Product WHERE product_id = ?;
		<sql:param value="${product}"/>
	</sql:query>
	
	<c:forEach var="item" items="${product.rows}">
		<c:set var="product_id" value="${item.product_id}"/>
	</c:forEach>
	
	<c:forEach var="user" items="${result.rows}">
		<c:set var="user_id" value="${user.id }"/>
	</c:forEach>
	
	<c:forEach var="store" items="${stores.rows}">
		<c:set var="store_id" value="${store.store_id}"/>
	</c:forEach>
	
	<sql:update dataSource="${snapshot}" var="add_to_cart">
		INSERT INTO CartItem (product_id, store_id, user_id) VALUES (?, ?, ?);
		<sql:param value="${product_id}"/>
		<sql:param value="${store_id}"/>
		<sql:param value="${user_id}"/>
	</sql:update>
	<c:set var="debug">Product: ${product_id} Store: ${store_id} User: ${user_id}</c:set>
	<jsp:useBean id="debug" type="java.lang.String"/>
	<% System.out.println(debug); %>
	<c:set var="store_id">${store_id}</c:set>
	<jsp:useBean id="store_id" type="java.lang.String"/>
	<% response.sendRedirect("/stores/" + store_id); %>
</c:if>
<%@ include file="layouts/footer.jsp"%>