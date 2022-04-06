<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Welcome"; %>
<%@ include file="layouts/header.jsp"%>
<div class="container">
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	
	<c:if test="${pageContext.request.userPrincipal.name != null}">
  <h3 style="text-align: center">Store Locator</h3>
  <iframe src="https://my.atlistmaps.com/map/a27eaeb1-32ca-4d26-b425-92e0ae39ef77?share=true" allow="geolocation" width="100%" height="400px" frameborder="0" scrolling="no" allowfullscreen></iframe>
  </c:if>
  </div>
<%@ include file="layouts/footer.jsp"%>