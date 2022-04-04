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
<sql:query dataSource="${snapshot}" var="stores">
		SELECT * FROM Store ORDER BY city, store_name ASC
</sql:query>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/test.css">



<!-- <div class="container">
    <div id="searchWrapper">
        <input type="text" name="searchBar" id="searchBar" placeholder="search for a Store" />
    </div>
    <ul id="storeList"></ul>
</div> -->

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">

		<c:forEach var="row" items="${result.rows}">
        	<h2>Welcome <c:out value = "${row.firstName}"/></h2>
		</c:forEach>
	
		<p><a href="${contextPath}/stores">Store list</a></p>
		
    </c:if>
</div>

<div class="container">
    <p>Suggested Stores</p>
    <table>


    			<c:forEach var="storeList" items="${stores.rows}">
    				<tr>
    					<c:if test="${storeList.enabled}">
    						<td><a href="stores/${storeList.store_id}"><c:out value="${storeList.store_name}"/></a></td>
    					</c:if>
    					<c:if test="${!storeList.enabled}">
							<td><button class="button button--pandora"><span>
										<c:out value="${storeList.store_name}" />
									</span></button></td>
    					</c:if>
    				</tr>
    			</c:forEach>
    		</table>
</div>
<script src="${contextPath}/resources/js/searchbar.js"></script>

<%@ include file="layouts/footer.jsp"%>