package it.molinari.biblioteca.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import it.molinari.biblioteca.model.dto.LibroDto;
import it.molinari.biblioteca.model.service.LibriService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/libroServlet")
public class LibroServlet extends HttpServlet
{
	private static final long serialVersionUID= 1L;
	
	public LibroServlet()
	{
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException
	{
	    String id     = request.getParameter("id");
	    if (id == null) id = "";
	    String action = request.getParameter("action");
	    LibriService service = new LibriService();

	    if ("modifica".equals(action) && id != null) {
	        // Carica il singolo libro e vai alla pagina di modifica
	        LibroDto libro = service.serviceGetById(id).get(0);
	        request.setAttribute("libro", libro);
	        request.getRequestDispatcher("/modifica.jsp").forward(request, response);
	    } else {
	        // Lista completa
	        List<LibroDto> listaDto = service.serviceGetById(id);
	        request.setAttribute("libri", listaDto);
	        request.getRequestDispatcher("/libriview.jsp").forward(request, response);
	    }
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			String autore=request.getParameter("autore");
			String titolo = request.getParameter("titolo");
			LibriService service = new LibriService();
			
			String risposta=service.serviceInsert(autore, titolo);
			List<LibroDto> listaDto=service.serviceGetById("");
			
			request.setAttribute("risposta", risposta);
			request.setAttribute("libri", listaDto);
			request.getRequestDispatcher("/libriview.jsp").forward(request, response);
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id = request.getParameter("id");
		LibriService service = new LibriService();
		
		String risposta= service.doElimina(id);
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.setContentType("application/json");
		response.getWriter().write("{\"success\": true}");
	}
	
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException
	{
	    String queryString = request.getQueryString();
	    // queryString = "id=7&titolo=Foo&autore=Bar"

	    Map<String, String> params = new HashMap<>();
	    for (String param : queryString.split("&")) {
	        // split con limite 2 — divide solo al primo "="
	        // così "titolo=Il=Signore" non rompe nulla
	        String[] coppia = param.split("=", 2);
	        if (coppia.length == 2) {
	            params.put(coppia[0], java.net.URLDecoder.decode(coppia[1], "UTF-8"));
	        } else {
	            // parametro senza valore, metti stringa vuota
	            params.put(coppia[0], "");
	        }
	    }

	    String id     = params.get("id");
	    String titolo = params.get("titolo");
	    String autore = params.get("autore");

	    LibriService service = new LibriService();
	    service.doAggiorna(id, titolo, autore);

	    response.setStatus(HttpServletResponse.SC_OK);
	    response.setContentType("application/json");
	    response.getWriter().write("{\"success\": true}");
	}
}
