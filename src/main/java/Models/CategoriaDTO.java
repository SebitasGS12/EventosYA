package Models;

public class CategoriaDTO {

	private int idCategoria;
	private String nombreCategoria,descripcionCategoria;
	
	//Constructor
	
	public CategoriaDTO(int idCategoria, String nombreCategoria, String descripcionCategoria) {
		this.idCategoria = idCategoria;
		this.nombreCategoria = nombreCategoria;
		this.descripcionCategoria = descripcionCategoria;
	}
	
	
	public CategoriaDTO( String nombreCategoria, String descripcionCategoria) {
		this.nombreCategoria = nombreCategoria;
		this.descripcionCategoria = descripcionCategoria;
	}
	
	
	
	public CategoriaDTO() {
		
	}
	
	//Getters and Setters
	
	
	
	
	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	public String getNombreCategoria() {
		return nombreCategoria;
	}
	public void setNombreCategoria(String nombreCategoria) {
		this.nombreCategoria = nombreCategoria;
	}
	public String getDescripcionCategoria() {
		return descripcionCategoria;
	}
	public void setDescripcionCategoria(String descripcionCategoria) {
		this.descripcionCategoria = descripcionCategoria;
	}
	
	
	
}
