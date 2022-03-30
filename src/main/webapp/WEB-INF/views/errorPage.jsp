<% String title = "Error loading page"; %>
<%@ include file="layouts/header.jsp"%>
<div class="container">

    <h1>${errorCode}</h1>
    <br/>
    <h4>${errorMsg}</h4>
</div>
<%@ include file="layouts/footer.jsp"%>