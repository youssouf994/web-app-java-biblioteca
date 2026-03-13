package it.molinari.biblioteca.model.dto;

public class LibroDto 
{
	int id;
	String titolo;
	String autore;
	
	public LibroDto()
	{
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getAutore() {
		return autore;
	}

	public void setAutore(String autore) {
		this.autore = autore;
	}

	@Override
	public String toString() {
		return "libroDto [id=" + id + ", titolo=" + titolo + ", autore=" + autore + "]";
	}
	
	
}
