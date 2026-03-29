<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Molinari</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;0,900;1,400&family=DM+Mono:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/templates.css">
    <script src="${pageContext.request.contextPath}/js/doDelete.js" defer></script>
</head>

<body>

    <!-- HERO HEADER -->
    <header id="header">
        <div id="header-noise"></div>
        <div id="header-content">
            <div id="header-label">Sistema Bibliotecario</div>
            <h1 id="titolo-principale">Biblioteca<br><em>Molinari</em></h1>
            <p id="header-sub">Catalogo libri &mdash; Gestione collezione</p>
        </div>
        <div id="header-deco">&#10070;</div>
    </header>

    <main id="main">

        

        <!-- FORM INSERIMENTO -->
        <section id="sezione-inserimento">
            <h2 class="sezione-titolo">
                <span class="sezione-numero">01</span>
                Aggiungi un libro
            </h2>
            <form id="form-inserimento" method="post" action="libroServlet?id=">
                <div class="campo-gruppo">
                    <label class="campo-label" for="titolo">Titolo</label>
                    <input class="campo-input" type="text" id="titolo" name="titolo" placeholder="Es. I Promessi Sposi" required>
                </div>
                <div class="campo-gruppo">
                    <label class="campo-label" for="autore">Autore</label>
                    <input class="campo-input" type="text" id="autore" name="autore" placeholder="Es. Alessandro Manzoni" required>
                </div>
                <button class="btn-invia" type="submit">
                    <span class="btn-icona">+</span>
                    Aggiungi al catalogo
                </button>
            </form>
        </section>

        <!-- TABELLA LIBRI -->
        <section id="sezione-catalogo">
            <h2 class="sezione-titolo">
                <span class="sezione-numero">02</span>
                Catalogo
            </h2>
            <div id="tabella-wrapper">
                <table id="tabella-libri">
                    <thead>
                        <tr>
                            <th class="col-id">#</th>
                            <th class="col-titolo">Titolo</th>
                            <th class="col-autore">Autore</th>
                            <th class="col-azioni">Azioni</th>
                        </tr>
                    </thead>
                    <tbody id="tabella-body">
                        <c:forEach var="libro" items="${libri}">
                            <tr class="libro-riga">
                                <td class="col-id">
                                    <span class="id-badge">${libro.id}</span>
                                </td>
                                <td class="col-titolo">
                                    <span class="titolo-testo">${libro.titolo}</span>
                                </td>
                                <td class="col-autore">
                                    <span class="autore-testo">${libro.autore}</span>
                                </td>
                                <td class="col-azioni">
                                    <button
                                        class="btn-elimina"
                                        onclick="eliminaLibro(${libro.id}, this)"
                                        title="Elimina libro">
                                        &#10005; Elimina
                                    </button>
                                    	<a class="btn-modifica" href="libroServlet?action=modifica&id=${libro.id}">
								   		&#9998; Modifica
									</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

    </main>

    <footer id="footer">
        <p>Biblioteca Molinari &mdash; Sistema di gestione catalogo</p>
        <p class="footer-dedica">&#9733; Dedicata a Thomas Sankara &#9733;</p>
    </footer>

</body>
</html>
