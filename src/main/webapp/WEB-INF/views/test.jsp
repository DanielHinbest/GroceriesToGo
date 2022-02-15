<%@ include file="layouts/header.jsp"%>

<div class="container">
	c
    <!--<c:if test="${pageContext.request.userPrincipal.name != null}">-->
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

   <!-- </c:if>-->	
   
   <h2>Hello please type something on the screen</h2>

</div>
<%@ include file="layouts/footer.jsp"%>