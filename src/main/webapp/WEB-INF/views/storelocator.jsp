<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	March 1, 2022
 -->
<% String title = "Welcome"; %>
<%@ include file="layouts/header.jsp"%>
<c:if test="${pageContext.request.userPrincipal.name == null}">
		<% response.sendRedirect("/login"); %>
	</c:if>
	
	<c:if test="${pageContext.request.userPrincipal.name != null}">
  <h3>Store Locator</h3>

  <div class="container">
      <div id="searchWrapper">
          <input type="text" name="searchBar" id="searchBar" placeholder="search for a Store" />
      </div>
      <ul id="storeList"></ul>
  </div>
  <div class="container">
       <iframe width="800" height="400" frameborder="0" src="https://www.bing.com/maps/embed?h=400&w=800&cp=43.95074511840181~-78.87153625489805&lvl=11&typ=d&sty=r&src=SHELL&FORM=MBEDV8" scrolling="no">
       </iframe>
       <div style="white-space: nowrap; text-align: center; width: 800px; padding: 6px 0;">
          <a id="largeMapLink" target="_blank" href="https://www.bing.com/maps?cp=43.95074511840181~-78.87153625489805&amp;sty=r&amp;lvl=11&amp;FORM=MBEDLD">View Larger Map</a> &nbsp; | &nbsp;
          <a id="dirMapLink" target="_blank" href="https://www.bing.com/maps/directions?cp=43.95074511840181~-78.87153625489805&amp;sty=r&amp;lvl=11&amp;rtp=~pos.43.95074511840181_-78.87153625489805____&amp;FORM=MBEDLD">Get Directions</a>
      </div>
  </div>
  </c:if>
<%@ include file="layouts/footer.jsp"%>