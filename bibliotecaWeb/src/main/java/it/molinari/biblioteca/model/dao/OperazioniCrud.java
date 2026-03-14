package it.molinari.biblioteca.model.dao;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import it.molinari.biblioteca.model.po.LibroPo;

public class OperazioniCrud 
{
	public OperazioniCrud()
	{
		
	}
	
	public List<LibroPo>  getById(int id)
	{
		String query="select *" + "from libri where idLibro =?";
		List<LibroPo> listaPo= new ArrayList<LibroPo>();
		
		try(Connection connessione = DbConnection.getConnessione();
			PreparedStatement stmt = connessione.prepareStatement(query))			
		{
			stmt.setInt(1, id);
			
			try(ResultSet rs = stmt.executeQuery())
			{
				if (rs.next())
				{
					LibroPo po = new LibroPo();
					po.setId(rs.getInt("idLibro"));
					po.setTitolo(rs.getString("titolo"));
					po.setAutore(rs.getString("autore"));
					listaPo.add(po);
				}
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return listaPo;
	}
	
	public List<LibroPo>  getCollezione()
	{
		String query="select *" + "from libri";
		List<LibroPo> listaPo= new ArrayList<LibroPo>();
		
		try(Connection connessione = DbConnection.getConnessione();
			PreparedStatement stmt = connessione.prepareStatement(query);		
			ResultSet rs = stmt.executeQuery())
		{
			
			
			while(rs.next())
			{
				LibroPo po = new LibroPo();
				po.setId(rs.getInt("idLibro"));
				po.setTitolo(rs.getString("titolo"));
				po.setAutore(rs.getString("autore"));
				listaPo.add(po);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return listaPo;
	}
	
	public boolean insertLibro(String autore, String titolo)
	{
		boolean check= false;
		String query="insert into libri (autore, titolo) values (?, ?)";
		
		try(Connection connessione = DbConnection.getConnessione();
			PreparedStatement ps = connessione.prepareStatement(query))
		{
			ps.setString(1, autore);
			ps.setString(2, titolo);
			
			int righeInserite= ps.executeUpdate();
			
			check=(righeInserite > 0) ?  true :  false;
		
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return check;
	}
}
