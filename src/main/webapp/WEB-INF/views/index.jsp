<% String title = "Welcome"; %>
<%@ include file="layouts/header.jsp"%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/groceriestogo?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehaviour=convertToNull"
         user = "root"  password = "password"/>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from User WHERE username = ?
         <sql:param value = "${username}" />
</sql:query>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

		<c:forEach var="row" items="${result.rows }">
        	<h2>Welcome <c:out value = "${row.firstName }"/> <c:out value = "${row.lastName }"/> | <a class="text-right" onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
		</c:forEach>
    </c:if>

</div>

<%@ include file="layouts/footer.jsp"%>