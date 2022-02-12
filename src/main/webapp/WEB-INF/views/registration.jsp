<!-- 
	Groceries To Go
	Daniel Hinbest, Ryan Clayson, Yash Gadhiya
	February 12, 2022
 -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="This is the user registration page for the Groceries To Go website.">
    <meta name="author" content="Daniel Hinbest, Ryan Clayson, Yash Gadhiya">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Create your account</h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="email" class="form-control" placeholder="Email address"></form:input>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control"
                            placeholder="Confirm your password"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="firstName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="firstName" class="form-control" placeholder="First name"></form:input>
                <form:errors path="firstName"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="lastName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="lastName" class="form-control" placeholder="Last name"></form:input>
                <form:errors path="lastName"></form:errors>
            </div>
        </spring:bind>
        
        <!--<spring:bind path="dateOfBirth">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="dateOfBirth" class="form-control" placeholder="Date of Birth"></form:input>
                <form:errors path="dateOfBirth"></form:errors>
            </div>
        </spring:bind>-->
        
        <spring:bind path="addressLine1">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="addressLine1" class="form-control" placeholder="Address Line 1"></form:input>
                <form:errors path="addressLine1"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="addressLine2">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="addressLine2" class="form-control" placeholder="Address Line 2 (optional)"></form:input>
                <form:errors path="addressLine2"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="city">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="city" class="form-control" placeholder="City"></form:input>
                <form:errors path="city"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="province">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <!--<form:input type="text" path="province" class="form-control" placeholder="Province"></form:input>-->
                <form:select path="province" class="form-control" placeholder="Province">
                	<!-- This list could maybe be looped from a database list??? -->
                	<form:option value="" label="Select a province"/>
                	<form:option value="Alberta" label="Alberta"/>
                	<form:option value="British Columbia" label="British Columbia"/>
                	<form:option value="Manitoba" label="Manitoba"/>
                	<form:option value="New Brunswick" label="New Brunswick"/>
                	<form:option value="Newfoundland and Labrador" label="Newfoundland and Labrador"/>    
                	<form:option value="Northwest Territories" label="Northwest Territories"/>    
                	<form:option value="Nova Scotia" label="Nova Scotia"/>    
                	<form:option value="Nunavut" label="Nunavut"/>            
                	<form:option value="Ontario" label="Ontario"/>        
                	<form:option value="Prince Edward Island" label="Prince Edward Island"/>       
                	<form:option value="Quebec" label="Quebec"/>
                	<form:option value="Saskatchewan" label="Saskatchewan"/>       
                	<form:option value="Yukon" label="Yukon"/>        	
                </form:select>
                <form:errors path="province"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="postalCode">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="postalCode" class="form-control" placeholder="Postal code"></form:input>
                <form:errors path="postalCode"></form:errors>
            </div>
        </spring:bind>
        

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>