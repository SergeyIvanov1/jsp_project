<%@ taglib prefix="seсurity" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Information for all employees</h3>

<br><br>

<%--возможно этот код не работает--%>
<seсurity:authorize access="hasRole('HR')">
    <input type="button" value="salary"
           onclick="window.location.href = 'hr_info'">
    Only for HR stuff
</seсurity:authorize>

<br><br>

<seсurity:authorize access="hasRole('MANAGER')">
    <input type="button" value="performance"
           onclick="window.location.href = 'manager_info'">
    Only for managers
</seсurity:authorize>
<br><br>

<seсurity:authorize access="hasRole('MANAGER')">
<input type="button" value="performance"
       onclick="window.location.href = '/encrypt'">
    Only for managers
</seсurity:authorize>

</body>
</html>
