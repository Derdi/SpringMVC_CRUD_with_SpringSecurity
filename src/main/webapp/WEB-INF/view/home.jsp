<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
    <h2>Welcome!</h2>

    <p>
        Hi :)
    </p>

    <hr>
        User: <security:authentication property="principal.username" />
    <br/><br/>
        Roles(s): <security:authentication property="principal.authorities" />
    <hr>
    <p>
        <a href="${pageContext.request.contextPath}/customer/list">Customer relationship management</a>
    </p>


    <security:authorize access="hasRole('MANAGER')">
        <p>
            <a href="${pageContext.request.contextPath}/leaders">Manager panel</a>
        </p>
    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">
        <p>
            <a href="${pageContext.request.contextPath}/systems">Admin panel</a>
        </p>
    </security:authorize>

    <form:form action="${pageContext.request.contextPath}/logout" method="POST">

        <input type="submit" value="Logout" />
    </form:form>

</body>
</html>
