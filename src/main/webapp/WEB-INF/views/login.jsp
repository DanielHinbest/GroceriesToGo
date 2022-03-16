<% String title = "Log in"; %>
<%@ include file="layouts/header.jsp"%>

<div class="container">

    <form class="center" method="POST" action="${contextPath}/login" class="form-signin">
        <div class="form-group ${error != null ? 'has-error' : ''}">
	    	<table class="center">
		        <tr><th><h2 class="form-heading">Log in</h2></th></tr>
				<tr><td>
		            <span>${message}</span>
		            <input name="username" type="text" class="form-control" placeholder="Username"
		                   autofocus="true"/>
		        </td></tr>
		        <tr><td>
		            <input name="password" type="password" class="form-control" placeholder="Password"/>
		            <span>${error}</span>
		            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
		            <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
		            <h4 class="text-center"><a href="${contextPath}/registration">Create an account</a></h4>
		       	</td></tr>
	        </table>
        </div>
    </form>

</div>
<%@ include file="layouts/footer.jsp"%>