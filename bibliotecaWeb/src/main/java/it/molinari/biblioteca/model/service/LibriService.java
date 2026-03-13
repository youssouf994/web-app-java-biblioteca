package it.molinari.biblioteca.model.service;

import java.util.ArrayList;
import java.util.List;

import it.molinari.biblioteca.model.dao.OperazioniCrud;
import it.molinari.biblioteca.model.dto.LibroDto;
import it.molinari.biblioteca.model.po.LibroPo;

public class LibriService 
{
	OperazioniCrud dbManage;
	
	public LibriService()
	{
		this.dbManage=new OperazioniCrud();
	}
	
	public List<LibroDto> serviceGetById(String id)
	{
		List<LibroDto> listaDto = new ArrayList<LibroDto>();
		List<LibroPo> listaPo = new ArrayList<LibroPo>();
		
		if(id.equals("collezione"))
		{
			listaPo=dbManage.getCollezione();
			
			for(LibroPo po : listaPo)
			{
				LibroDto dto = new LibroDto();
				dto.setId(po.getId());
				dto.setTitolo(po.getTitolo());
				dto.setAutore(po.getAutore());
				
				listaDto.add(dto);
			}
		}
		else
		{
			listaPo=dbManage.getById(Integer.parseInt(id));
			
			for(LibroPo po : listaPo)
			{
				LibroDto dto = new LibroDto();
				dto.setId(po.getId());
				dto.setTitolo(po.getTitolo());
				dto.setAutore(po.getAutore());
				
				listaDto.add(dto);
			}
		}
		
		return listaDto;
	}
}
