<nav class="navbar navbar-expand-lg navbar-light bg-secondary">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>
  <div class="collapse navbar-collapse" id="navbarNav">
  <ul class="navbar-nav">
  	<li class="nav-item active">
        <a class="nav-link" href="${contextPath}/">
        <img src="${contextPath}/resources/images/GTGLogo.PNG" alt="Logo" style=width:20%>
        </a>
      </li>
  </ul>
  <span class="nav">
    <ul class="navbar-nav" >
      
      <li class="nav-item" padding: 25px>
      	<a class="nav-link" href="${contextPath}/cart">Cart</a>
      </li>      
    	<c:if test="${pageContext.request.userPrincipal.name != null}">
       <li class="nav-item">
        <a class="nav-link" onclick="document.forms['logoutForm'].submit()" href="#">Logout</a> 
      </li>
      </c:if>
      <c:if test="${pageContext.request.userPrincipal.name == null}">
       <li class="nav-item">
        <a class="nav-link" href="${contextPath}/login">Login</a> 
      </li>
      </c:if>
    </ul>
    </span>
  </div>
</nav>

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slidebar.css">
    <div class="menuToggle">
    <ul class="navbar-nav">
        <li class="list" style="--clr: #000;">
            <a href="${contextPath}/">
                <span class="icon"><ion-icon name="home-outline" color="success"></ion-icon></span>
                <span class="text">Home</span>

            </a>
        </li>
        <li class="list" style="--clr: #000;">
            <a href="${contextPath}/about">
                <span class="icon"><ion-icon name="people-outline" color="success"></ion-icon></span>
                <span class="text">About</span>

            </a>
        </li>
        <li class="list" style="--clr: #000;">
            <a href="${contextPath}/stores">
                <span class="icon"><ion-icon name="storefront-outline" color="success"></ion-icon></span>
                <span class="text">Stores</span>

            </a>
        </li>
        <li class="list" style="--clr: #000;">
            <a href="${contextPath}/store_locator">
                <span class="icon"><ion-icon name="location-outline" color="success"></ion-icon></span>
                <span class="text">Store Locator</span>
            </a>
        </li>
        <li class="list" style="--clr: #000;">
                    <a href="${contextPath}/search">
                        <span class="icon"><ion-icon name="location-outline" color="success"></ion-icon></span>
                        <span class="text">Find Product</span>
                    </a>
                </li>
        <li class="list" style="--clr: #000;">
            <a href="${contextPath}/cart">
                <span class="icon"><ion-icon name="newspaper-outline" color="success"></ion-icon></span>
                <span class="text">Cart</span>
            </a>
        </li>
    </ul>
    
    </div>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="${contextPath}/resources/js/slidebar.js"></script>
