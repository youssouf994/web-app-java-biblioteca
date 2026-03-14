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
		
		<div class="inserimento">
			<form method="post" action="libroServlet?id=">
				<label for="titolo">Titolo: </label>
				<input type="text" id="titolo" name="titolo" required><br>
				
				<label for="autore">Autore: </label>
				<input type="text" id="autore" name="autore" required><br> 
			
				<button type="submit">Invia</button>
			</form>
		</div>
		
		<div class="tabella">
			<table border="1">
				<tr>
					<th>ID</th>
		            <th>Titolo</th>
		            <th>Autore</th>
		            <th>opzioni</th>
	        		</tr>
	        		
	        		<c:forEach var="libro" items="${libri}">
	        			<tr>
		                <td>${libro.id}</td>
		                <td>${libro.titolo}</td>
		                <td>${libro.autore}</td>
		                <td>elimina, modifica</td>
	            		</tr>
	        		</c:forEach>
			</table>
		</div>
	</body>
</html>
