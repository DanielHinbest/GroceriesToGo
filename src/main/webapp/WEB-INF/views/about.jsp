<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	February 20, 2022
 -->
<% String title = "About"; %>
<%@ include file="layouts/header.jsp"%>
	
	<div class="container text-center mt-5 mb-2">
    <h1 class="mb-0">About</h1>
    <span>Groceries to Go is an online grocery platform. This website allows shoppers to grocery shop for whichever products they
  			desire. With both pick-up and delivery options, Groceries to Go is committed to bring fresh groceries and everyday essentials
  			to busy families across the Durham Region.
  	</span>
  	<p>
  	Groceries to Go was developed as part of a Capstone Project to utilize everything we have learned from Durham College's Programming
  	and Analysis program. 
  	</p>
	</div>	
  
  <div class="container text-center mt-5 mb-2">
    <h1 class="mb-0">Meet our Team</h1>
  </div>
<div class="container mt-3">
    <div class="row">
        <div class="col-md-3">
            <div class="bg-white p-3 text-center rounded box"><img class="img-responsive rounded-circle" src="${contextPath}/resources/images/RyanClayson.jpg" alt="Ryan" style="width:100%">
                <h5 class="mt-3 name">Ryan Clayson</h5>
                <span class="work d-block">Front-End</span>
                <span class="work d-block">Development</span>
                <div class="mt-4 about"><span>is a long established fact that eader&nbsp; will be distracted by the readable content.</span></div>
                <div class="mt-4">
                    <h6 class="v-profile"><a href="https://www.linkedin.com/in/ryan-clayson/">View Profile</a></h6>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="bg-white p-3 text-center rounded box"><img class="img-responsive rounded-circle" src="${contextPath}/resources/images/DanielPic.png" alt="Daniel" style="width:100%">
                <h5 class="mt-3 name">Daniel Hinbest</h5>
                <span class="work d-block">Full Stack</span>
                <span class="work d-block">Development</span>
                <div class="mt-4 about"><span>is a long established fact that eader&nbsp; will be distracted by the readable content.</span></div>
                <div class="mt-4">
                    <h6 class="v-profile"><a href="https://www.linkedin.com/in/daniel-hinbest/">View Profile</a></h6>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="bg-white p-3 text-center rounded box"><img class="img-responsive rounded-circle" src="${contextPath}/resources/images/Yashpic.jpg" alt="Yash" style="width:100%">
                <h5 class="mt-3 name">Yash Gadhiya</h5>
                <span class="work d-block">Back-end</span>
                <span class="work d-block">Development</span>
                <div class="mt-4 about"><span>is a long established fact that eader&nbsp; will be distracted by the readable content.</span></div>
                <div class="mt-4">
                    <h6 class="v-profile"><a href="https://www.linkedin.com/in/yash551/">View Profile</a></h6>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="layouts/footer.jsp"%>
 