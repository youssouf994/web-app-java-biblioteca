package it.molinari.biblioteca.controller;

import java.io.IOException;
import java.util.List;

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
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			String id=request.getParameter("id");
			LibriService service = new LibriService();
			List<LibroDto> listaDto = service.serviceGetById(id);
			
			request.setAttribute("libri", listaDto);
			request.getRequestDispatcher("/libriview.jsp").forward(request, response);
		
		}catch(IOException e)
		{
			e.printStackTrace();
		}
	}
}
