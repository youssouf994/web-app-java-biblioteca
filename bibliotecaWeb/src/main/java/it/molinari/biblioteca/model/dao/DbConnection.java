
package it.molinari.biblioteca.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	private static final String URL="jdbc:mysql://localhost:3306/bibliotecaWeb";
	private static final String USER="root";
	private static final String PASSWORD="";
	
	public DbConnection()
	{
		
	}
	
	static
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(ClassNotFoundException e)
		{
			throw new RuntimeException("Driver non trovato", e);
		}
	}
	
	public static Connection getConnessione() throws SQLException
	{
		return DriverManager.getConnection(URL, USER, PASSWORD);//sonar: riempi la password
	}
}
