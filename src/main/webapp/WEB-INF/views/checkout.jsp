.<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 16, 2022
 -->
<% String title = "Checkout"; %>
<%@ include file="layouts/header.jsp"%>
<c:set var="username" value="${pageContext.request.userPrincipal.name}"/>
<sql:query dataSource="${snapshot}" var="result">
	SELECT * FROM User WHERE username = ?
	<sql:param value="${username}"/>
</sql:query>
<c:forEach var="users" items="${result.rows }">
	<c:set var="user_id" value="${users.id }"/>
</c:forEach>
<sql:query dataSource="${snapshot}" var="cart_items">
	SELECT product_name, product_brand, product_cost, store_name, cart_item_id, product_image
	FROM CartItem
	INNER JOIN Product ON CartItem.product_id = Product.product_id
	INNER JOIN Store ON CartItem.store_id = Store.store_id
	WHERE user_id = ?;
	<sql:param value="${user_id }"/>
</sql:query>
<sql:query dataSource="${snapshot}" var="count_and_cost_query">
	SELECT user_id, SUM(product_cost) as Cost, COUNT(Product.product_id) as Count
	FROM CartItem
	INNER JOIN Product ON CartItem.product_id = Product.product_id
	WHERE user_id = ?
	GROUP BY user_id;
	<sql:param value="${user_id}"/>
</sql:query>
<c:forEach var="count_and_cost" items="${count_and_cost_query.rows}">
	<c:set var="count" value="${count_and_cost.Count }"/>
	<c:set var="cost" value="${count_and_cost.Cost }"/>
</c:forEach>
<div class="container">

    <h2>Checkout</h2>
</div>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="#">

        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="Oshawa">

            <div class="row">
              <div class="col-50">
                <label for="province">Province</label>
                <input type="text" id="province" name="province" placeholder="ON">
              </div>
              <div class="col-50">
                <label for="zip">Postal Code</label>
                <input type="text" id="postalcode" name="postalcode" placeholder="L1R1W1">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"><img src="${contextPath}/resources/images/1200px-Visa.png">  </i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">

            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>

        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input type="submit" value="Continue to checkout" class="btn">
      </form>
    </div>
  </div>

  <div class="col-25">
    <div class="container">
      <h4>Cart
        <span class="price" style="color:black">
          <i class="fa fa-shopping-cart"></i>
          <b>${count}</b>
        </span>
      </h4>
      
      <c:forEach var="cart" items="${cart_items.rows}">
      	 <p><c:out value="${cart.product_name}"/><span class="price">${cart.product_cost}</span></p>
      </c:forEach>
      <!-- Checkout placeholders
	      <p><a href="#">Product 1</a> <span class="price">$15</span></p>
	      <p><a href="#">Product 2</a> <span class="price">$5</span></p>
	      <p><a href="#">Product 3</a> <span class="price">$8</span></p>
	      <p><a href="#">Product 4</a> <span class="price">$2</span></p>
	  -->
      <hr>
      <p>Total <span class="price" style="color:black"><b>$${cost}</b></span></p>
    </div>
  </div>
</div>
<%@ include file="layouts/footer.jsp"%>