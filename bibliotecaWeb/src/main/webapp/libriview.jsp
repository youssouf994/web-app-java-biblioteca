<%@page language="java" contentType="text/html ; charset= UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lista Libri</title>
	</head>
	
	<body>
		<h1>LISTA LIBRI</h1>
		
		<table border="1">
			<tr>
				<th>ID</th>
	            <th>Titolo</th>
	            <th>Autore</th>
        		</tr>
        		
        		<c:forEach var="libro" items="${libri}">
        			<tr>
	                <td>${libro.id}</td>
	                <td>${libro.titolo}</td>
	                <td>${libro.autore}</td>
            		</tr>
        		</c:forEach>
		</table>
	</body>
</html>
