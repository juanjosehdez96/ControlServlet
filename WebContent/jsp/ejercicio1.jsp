<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ejercicio1</title>
</head>

<style>

#enlaces {
	
	text-align: center;
	
}

#enlaces li {
list-style: none;

}

#enlaces li a {
	text-decoration: none;
}

#recuadro {
	padding: 2%;
	margin-top: 5%;
	margin-left: 25%;
	border-radius: 50px;
	width: 50%;
	background-color: #DEDEDE;
	height: 400px;
	box-shadow: 0px 0px 15px 10px #999999;
}

</style>
<body>

	<div id="recuadro">
	<div id="enlaces">
		<h1>Página de enlaces</h1>

		<%
			HttpSession sesion = request.getSession();
			ArrayList<String> array = (ArrayList<String>) sesion.getAttribute("arrayEnlaces");
			pageContext.setAttribute("arrayEnlaces", array);
		%>


		<c:forEach var="enlaces" items="${arrayEnlaces}">
			<li><a href="${enlaces}">${enlaces}</a></li>

		</c:forEach>
		</div>

	</div>

</body>
</html>