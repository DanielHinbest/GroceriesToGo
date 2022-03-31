<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Products"; %>
<%@ include file="layouts/header.jsp"%>
<c:set var = "username" value = "${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="result">
	SELECT * FROM User WHERE username = ?
	<sql:param value="${username}"/>
</sql:query>
<sql:query dataSource="${snapshot}" var="departments">
	SELECT * FROM Product
	INNER JOIN Department ON product.department_id = department.department_id
	WHERE product_id = ?;
	<sql:param value="${product}"/>
</sql:query>
<c:forEach var="department_row" items="${departments.rows}">
	<c:set var="department" value="${department_row.department_name}"/>
</c:forEach>
<sql:query dataSource="${snapshot}" var="stores">
	SELECT * FROM Store WHERE store_id = ?;
	<sql:param value="${store}"/>
</sql:query>

<sql:query dataSource="${snapshot}" var="product">
	SELECT * FROM Product WHERE product_id = ?;
	<sql:param value="${product}"/>
</sql:query>
<c:forEach var="store_row" items="${stores.rows}">
	<c:set var="store" value="${store_row.store_name}"/>
</c:forEach>
<c:forEach var="row" items="${product.rows}">
	<c:set var="product_name" value="${row.product_name}"/>
	<c:set var="product_image" value="${row.product_image}"/>
	<c:set var="product_brand" value="${row.product_brand}"/>
	<c:set var="product_stock" value="${row.product_stock}"/>
	<c:set var="product_cost" value="${row.product_cost}"/>
</c:forEach>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<div class="row">		
			<div class="col-75">
				<h1><c:out value="${product_name}"/></h1>
				<h3><c:out value="${store}"/></h3>
			</div>
			<div class="col-25">
				<span class="price"><p><a href="${contextPath}/stores/${store_id}">Back to ${store}</a></p></span>
			</div>
		</div>
		<div class="row">
			<img src="${contextPath}/resources/images/products/${product_image}" height="250"/>
			<div class="col-50">
				<h4>Brand: <c:out value="${product_brand}"/></h4>
				<h4>Category: <c:out value="${department}"/></h4>
				<h4>Stock: <c:out value="${product_stock}"/></h4>
				<h4>Cost: $<c:out value="${product_cost}"/></h4>
				<table>
					<tr>
						<td>
							<form action="${contextPath}/stores/${store_id}/${product_list.product_id}/add">
			    				<input class="btn btn-primary btn-block" width="50" type="submit" value="Add To Cart"/>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</c:if>
    
</div>

<%@ include file="layouts/footer.jsp"%>