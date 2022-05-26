<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:out value="${SignUpsucces}"></c:out>
	<c:out value="${SignUpfailed}"></c:out>
	<c:out value="${loginFail}"></c:out>
	<c:out value="${resetPass}"></c:out>
	<c:out value="${editProfile}"></c:out>
	<c:out value="${isExistEmail}"></c:out>
	<c:out value="${Verify}"></c:out>
	<br>
	<a href="http://localhost:8080/xskt">Home page</a>
</body>
</html>