package Models;

public class EventoDTO {
	//Atributos de Evento
	private int idEvento;
	private String nombreEvento,descripcionEvento,ubicacionEvento,imagenEvento;
	private String fechaIncio,fechaFin;
	private int idCategoria;
	
	
	//Getters and Setters
	
	public int getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}
	public String getNombreEvento() {
		return nombreEvento;
	}
	public void setNombreEvento(String nombreEvento) {
		this.nombreEvento = nombreEvento;
	}
	public String getDescripcionEvento() {
		return descripcionEvento;
	}
	public void setDescripcionEvento(String descripcionEvento) {
		this.descripcionEvento = descripcionEvento;
	}
	public String getUbicacionEvento() {
		return ubicacionEvento;
	}
	public void setUbicacionEvento(String ubicacionEvento) {
		this.ubicacionEvento = ubicacionEvento;
	}
	public String getImagenEvento() {
		return imagenEvento;
	}
	public void setImagenEvento(String imagenEvento) {
		this.imagenEvento = imagenEvento;
	}
	public String getFechaIncio() {
		return fechaIncio;
	}
	public void setFechaIncio(String fechaIncio) {
		this.fechaIncio = fechaIncio;
	}
	public String getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	public int getIdCategoria() {
		return idCategoria;
	}
	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	
	


}
