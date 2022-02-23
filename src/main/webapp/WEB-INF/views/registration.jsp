<% String title = "Register"; %>
<%@ include file="layouts/header.jsp"%>

<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h4 class="text-right"><a href="${contextPath}/login">Back to login</a></h4>
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
        
        <spring:bind path="phone">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="phone" class="form-control" placeholder="Phone number"></form:input>
                <form:errors path="phone"></form:errors>
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
        <h4 class="text-right"><a href="${contextPath}/login">Back to login</a></h4>
    </form:form>

</div>
<%@ include file="layouts/footer.jsp"%>