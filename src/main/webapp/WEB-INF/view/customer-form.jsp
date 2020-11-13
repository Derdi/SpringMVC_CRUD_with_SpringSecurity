<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
    <head>
        <title>Title</title>

        <link type="text/css"
            rel="stylesheet"
              href="${pageContext.request.contextPath}/myResources/css/style.css">

        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/myResources/css/add-customer-style.css">

    </head>
    <body>

        <div id="wrapper">
            <div id="header">
                <h2>CRM - Customer Relationship Manager</h2>
            </div>
        </div>

        <div id="container">
            <h3>Save Customer</h3>

            <form:form action="saveCustomer" modelAttribute="customer" method="POST">

                <form:hidden path="id" />
                <table>
                    <tbody>
                        <tr>
                            <td><label>First name:</label></td>
                            <td><form:input path="firstName"></form:input></td>
                        </tr>
                        <tr>
                            <td><label>Last name:</label></td>
                            <td><form:input path="lastName"></form:input></td>
                        </tr>
                        <tr>
                            <td><label>Email:</label></td>
                            <td><form:input path="email"></form:input></td>
                        </tr>
                        <tr>
                            <td><label></label></td>
                            <td><input type="submit" value="Save" class="save"></td>
                        </tr>
                    </tbody>
                </table>
            </form:form>

            <div style="border: 1px black solid; border-radius: 5px; width: fit-content; height: fit-content"; padding: 2px;>

                <p>
                    <a style="text-decoration: none;" href="${pageContext.request.contextPath}/customer/list">Back to List</a>
                </p>

            </div>
        </div>

    </body>
</html>
