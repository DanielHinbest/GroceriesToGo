<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	February 20, 2022
 -->
<% String title = "Welcome"; %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="layouts/header.jsp"%>

  <h3>About</h3>
  <p>Groceries to Go is an online grocery platform. This websitre allows shoppers to grocery shop for whichever products they
  desire. With both pick-up and delivery options, Groceries to Go is committed to bring fresh groceries and everyday essentials
  to busy families across the Durham Region.
  </p>
  <p>
  Groceries to Go was developed as part of a Capstone Project to utilize everything we have learned from Durham College's Programming
  and Analysis program. 
  </p>
  
  <h3>Meet the Team</h3> 
  <div class="row">
  <div class="column">
    <div class="card">
      <img src="${contextPath}/resources/images/RyanClayson.jpg" alt="Ryan" style="width:100%">
      <div class="container">
        <h2>Ryan Clayson</h2>
        <p class="title">Front-end Development</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>ryan.clayson@dcmail.ca</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="${contextPath}/resources/images/Danielpic.jpg" alt="Daniel" style="width:100%">
      <div class="container">
        <h2>Daniel Hinbest</h2>
        <p class="title">Full-Stack Development</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>daniel.hinbest@dcmail.ca</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="${contextPath}/resources/images/Yashpic.jpg" alt="Yash" style="width:100%">
      <div class="container" style="width:300%">
        <h2>Yash Gadhiya</h2>
        <p class="title">Back-end Development</p>
        <p>Some text that describes me lorem dfgfdg ipsum ipsum lorem.</p>
        <p>yashashvinbhai.gadhiya@dcmail.ca</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
</div>

<%@ include file="layouts/footer.jsp"%>
 