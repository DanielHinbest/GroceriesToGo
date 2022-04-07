
   
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



<div class="container">
    <p>Suggested Stores</p>
    <table>


    			<c:forEach var="storeList" items="${stores.rows}">
    				<tr>
    					<c:if test="${storeList.enabled}">
    						<form action="${contextPath}/stores/${storeList.store_id}">
    							<td>
    								<button class="button button--pandora">
    									<span>
											<c:out value="${storeList.store_name}" />
										</span>
									</button>
								</td>
				                &nbsp;
                                &nbsp;
    						</form>
    					</c:if>
    					<c:if test="${!storeList.enabled}">
							<td>
								<button class="button button--pandora">
									<span>
										<c:out value="${storeList.store_name}" />
									</span>
								</button>
							</td>
    					</c:if>
    				</tr>
    			</c:forEach>
    		</table>
</div>
<script src="${contextPath}/resources/js/searchbar.js"></script>

<%@ include file="layouts/footer.jsp"%>
