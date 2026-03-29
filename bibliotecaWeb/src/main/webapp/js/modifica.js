function modificaLibro()
{
    const id     = document.getElementById('id').value;
    const titolo = document.getElementById('titolo').value.trim();
    const autore = document.getElementById('autore').value.trim();

    fetch('libroServlet?id=' + id
            + '&titolo=' + encodeURIComponent(titolo)
            + '&autore=' + encodeURIComponent(autore), {
        method: 'PUT'
    })
    .then(response => {
        if (response.ok) {
            alert('libro aggiornato');
			window.location.href = 'libroServlet?id=';
        } else {
            alert('errore durante la modifica');
			window.location.href = 'libroServlet?id=';
        }
    })
    .catch(e => {
        console.error('errore:', e);
        alert('errore di rete');
    });
}