<% String title = "search_result"; %>
<%@ include file="layouts/header.jsp"%>
<sql:query dataSource="${snapshot}" var="stores">
		SELECT * FROM Store ORDER BY city, store_name ASC
</sql:query>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/test.css">
<div class="container">
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<jsp:useBean id="contextPath" type="java.lang.String"/>
		<% response.sendRedirect(contextPath + "/login"); %>
	</c:if>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
<form class="serachform" action="${contextPath}/search" method="GET">
    <input type="search" name="keyword" size="50"
            class="form-control" placeholder="product" required />
            &nbsp;
            <input type="submit" value="Search" class="btn-search">
</form>
<h1>Search Results for ${keyword}</h1>
<c:forEach var="row" items="${searchResult}">
	<c:set var="product_id" value="${row.productId}"/>
	<c:set var="product_name" value="${row.productName}"/>
	<c:set var="product_image" value="${row.productImage}"/>
	<c:set var="product_brand" value="${row.productBrand}"/>
	<c:set var="product_stock" value="${row.productStock}"/>
	<c:set var="product_cost" value="${row.productCost}"/>
	<c:set var="store_id" value="${row.storeId }"/>
</c:forEach>
<table border="1" width="100%">
			<tr>
				<th></th>
				<th>Product</th>
				<th>Brand</th>
				<th>Cost</th>
			</tr>
			<c:forEach var="product_list" items="${searchResult}">
				<tr>
					<td align="center"><img src="${contextPath}/resources/images/products/${product_list.productImage}" alt="Product image" height="100"></td>
					<td><a href="${contextPath}/stores/${store}/${product_list.productId}"><c:out value="${product_list.productName}"/></a></td>
					<td><c:out value="${product_list.productBrand}"/></td>
					<td><c:out value="${product_list.productCost}"/></td>
    				<td>
    					<form action="${contextPath}/stores/${store}/${product_list.productId}/add">
    						<input class="btn btn-primary btn-block" type="submit" value="Add To Cart"/>
						</form>
    				</td>
				</tr>
			</c:forEach>
		</table>


</c:if>




<%@ include file="layouts/footer.jsp"%>