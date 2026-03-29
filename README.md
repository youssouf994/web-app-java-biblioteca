# 📚 Biblioteca Molinari — Web App Java

Applicazione web Java EE per la gestione di un catalogo bibliotecario, sviluppata con Servlet, JSP e MySQL.

---

## 🗂️ Struttura del progetto

```
bibliotecaWeb/
├── src/main/java/
│   └── it/molinari/biblioteca/
│       ├── controller/          → Servlet HTTP (LibroServlet)
│       ├── model/
│       │   ├── dto/             → Data Transfer Object (LibroDto)
│       │   ├── po/              → Persistence Object (LibroPo)
│       │   ├── service/         → Logica di business (LibriService)
│       │   └── dao/             → Data Access Object, CRUD (OperazioniCrud)
│       └── view/                → Componenti di visualizzazione
├── src/main/webapp/
│   ├── css/                     → Fogli di stile
│   ├── js/                      → Script JavaScript
│   ├── libriview.jsp            → Lista libri
│   └── modifica.jsp             → Form modifica libro
└── pom.xml
```

---

## 🧱 Classi principali

### `LibroDto` — `model/dto`
Data Transfer Object per lo scambio dati (form, JSON).

```java
public class LibroDto {
    private int id;
    private String titolo;
    private String autore;

    // costruttore vuoto, getter/setter, toString()
}
```

### `LibroPo` — `model/po`
Persistence Object per la rappresentazione interna del modello.

```java
public class LibroPo {
    private int id;
    private String titolo;
    private String autore;

    // costruttore vuoto, getter/setter, toString()
}
```

### `LibriService` — `model/service`
Logica di business: chiama il DAO, gestisce le validazioni.

```java
public class LibriService {
    public List<LibroDto> serviceGetById(String id) { ... }
    public String serviceInsert(String autore, String titolo) { ... }
    public void doAggiorna(String id, String titolo, String autore) { ... }
    public String doElimina(String id) { ... }
}
```

### `OperazioniCrud` — `model/dao`
Data Access Object: esegue le operazioni CRUD sul database MySQL.

```java
public class OperazioniCrud {
    public List<LibroPo> getById(int id) { ... }
    public boolean insertLibro(String titolo, String autore) { ... }
    public boolean updateLibro(int id, String titolo, String autore) { ... }
    public boolean deleteLibro(int id) { ... }
}
```

---

## 🌐 API REST — `LibroServlet`

Servlet mappata su `/libroServlet`.

| Metodo | URL | Descrizione | Input | Output |
|--------|-----|-------------|-------|--------|
| `GET` | `/libroServlet` | Lista tutti i libri | — | HTML (JSP) |
| `GET` | `/libroServlet?id=123` | Recupera libro per ID | `id` (int) | HTML (JSP) |
| `POST` | `/libroServlet` | Inserisce nuovo libro | `titolo`, `autore` (form body) | Redirect lista |
| `PUT` | `/libroServlet?id=123&titolo=...&autore=...` | Modifica libro esistente | `id`, `titolo`, `autore` (query string) | `200 OK` JSON |
| `DELETE` | `/libroServlet?id=123` | Cancella libro per ID | `id` (int) | `200 OK` JSON |

### Esempio risposta PUT / DELETE

```json
{ "success": true }
```

---

## 🖥️ Frontend

Le pagine JSP usano **JSTL** per il rendering dinamico e **JavaScript (Fetch API)** per le operazioni asincrone `PUT` e `DELETE`.

```javascript
// Esempio DELETE asincrona
fetch('libroServlet?id=' + id, { method: 'DELETE' })
    .then(response => {
        if (response.ok) btn.closest('tr').remove();
    });

// Esempio PUT asincrona
fetch('libroServlet?id=' + id + '&titolo=' + encodeURIComponent(titolo)
        + '&autore=' + encodeURIComponent(autore), { method: 'PUT' })
    .then(response => {
        if (response.ok) window.location.href = 'libroServlet';
    });
```

---

## 🗄️ Database

```sql
CREATE TABLE libri (
    idLibro INT PRIMARY KEY AUTO_INCREMENT,
    titolo  VARCHAR(255) NOT NULL,
    autore  VARCHAR(255) NOT NULL
);
```

---

## ⚙️ Requisiti

| Componente | Versione |
|------------|----------|
| Java | 17+ |
| Jakarta EE | 10 |
| Apache Tomcat | 10.1 |
| MySQL | 8.0+ |
| IDE | Eclipse (Dynamic Web Project) |

---

## 🚀 Avvio

1. Clona il repository
   ```bash
   git clone https://github.com/youssouf994/web-app-java-biblioteca.git
   ```
2. Importa il progetto in Eclipse come **Dynamic Web Project**
3. Configura la connessione al database in `DbConnection.java`
4. Crea la tabella `libri` con lo script SQL sopra
5. Fai il deploy su Tomcat e apri `http://localhost:8080/bibliotecaWeb/libroServlet`

---

## 👤 Autore

**Youssouf A. Toure** — Milano 2026 

