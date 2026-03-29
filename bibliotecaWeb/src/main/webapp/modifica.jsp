<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica Libro — Biblioteca Molinari</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;0,900;1,400&family=DM+Mono:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/templates.css">
    <script src="${pageContext.request.contextPath}/js/doDelete.js" defer></script>
</head>

<body>

    <!-- HEADER -->
    <header id="header">
        <div id="header-noise"></div>
        <div id="header-content">
            <div id="header-label">Sistema Bibliotecario</div>
            <h1 id="titolo-principale">Biblioteca<br><em>Molinari</em></h1>
            <p id="header-sub">Modifica libro &mdash; Catalogo</p>
        </div>
        <div id="header-deco">&#10070;</div>
    </header>

    <main id="main">

        <!-- BREADCRUMB -->
        <nav id="breadcrumb">
            <a href="libroServlet" id="link-back">&#8592; Torna al catalogo</a>
        </nav>

        <!-- FORM MODIFICA -->
        <section id="sezione-inserimento">
            <h2 class="sezione-titolo">
                <span class="sezione-numero">01</span>
                Modifica libro
            </h2>

            <form id="form-modifica" method="post" action="libroServlet?id=">

                <!-- ID nascosto — serve al servlet per sapere quale libro aggiornare -->
                <input type="hidden" id="libro-id" name="id" value="${libro.id}">

                <div class="campo-gruppo">
                    <label class="campo-label" for="titolo">Titolo</label>
                    <input class="campo-input"
                           type="text"
                           id="titolo"
                           name="titolo"
                           value="${libro.titolo}"
                           required>
                </div>

                <div class="campo-gruppo">
                    <label class="campo-label" for="autore">Autore</label>
                    <input class="campo-input"
                           type="text"
                           id="autore"
                           name="autore"
                           value="${libro.autore}"
                           required>
                </div>

                <div id="form-azioni">
                    <button class="btn-invia" type="button" onclick="modificaLibro()">
                        <span class="btn-icona">&#9998;</span>
                        Salva modifiche
                    </button>
                    <a href="libroServlet" class="btn-annulla">Annulla</a>
                </div>

            </form>

            <!-- Messaggio di feedback -->
            <div id="messaggio" class="messaggio-nascosto"></div>

        </section>

    </main>

    <footer id="footer">
        <p>Biblioteca Molinari &mdash; Sistema di gestione catalogo</p>
        <p class="footer-dedica">&#9733; Dedicata a Thomas Sankara &#9733;</p>
    </footer>

    <script>
        function modificaLibro() {
            const id     = document.getElementById('libro-id').value;
            const titolo = document.getElementById('titolo').value.trim();
            const autore = document.getElementById('autore').value.trim();

            if (!titolo || !autore) {
                mostraMessaggio('Compila tutti i campi.', 'errore');
                return;
            }

            fetch('libroServlet?id=' + id
                    + '&titolo=' + encodeURIComponent(titolo)
                    + '&autore=' + encodeURIComponent(autore), {
                method: 'PUT'
            })
            .then(response => {
                if (response.ok) {
                    mostraMessaggio('Libro aggiornato con successo!', 'successo');
                    // Torna al catalogo dopo 1.5 secondi
                    setTimeout(() => {
                        window.location.href = 'libroServlet';
                    }, 1500);
                } else {
                    mostraMessaggio('Errore durante la modifica.', 'errore');
                }
            })
            .catch(e => {
                console.error('Errore:', e);
                mostraMessaggio('Errore di rete.', 'errore');
            });
        }

        function mostraMessaggio(testo, tipo) {
            const div = document.getElementById('messaggio');
            div.textContent = testo;
            div.className = 'messaggio-' + tipo;
        }
    </script>

</body>
</html>
