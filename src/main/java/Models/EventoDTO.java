package Models;

import java.io.InputStream;

public class EventoDTO {
	//Atributos de Evento
	private int idEvento;
	private String nombreEvento,descripcionEvento,ubicacionEvento;
	private String fechaIncio,fechaFin;
	private int idCategoria;
	private InputStream imagenEvento;
	
	
	//Getters and Setters
	
	public EventoDTO(String nombreEvento, String descripcionEvento, String ubicacionEvento, InputStream imagenEvento,
			String fechaIncio, String fechaFin, int idCategoria) {
		this.nombreEvento = nombreEvento;
		this.descripcionEvento = descripcionEvento;
		this.ubicacionEvento = ubicacionEvento;
		this.imagenEvento = imagenEvento;
		this.fechaIncio = fechaIncio;
		this.fechaFin = fechaFin;
		this.idCategoria = idCategoria;
	}
	
	
	
	
	
	public EventoDTO(int idEvento, String nombreEvento, String descripcionEvento, String ubicacionEvento, InputStream imagenEvento
			,String fechaIncio, String fechaFin, int idCategoria) {
		this.idEvento = idEvento;
		this.nombreEvento = nombreEvento;
		this.descripcionEvento = descripcionEvento;
		this.ubicacionEvento = ubicacionEvento;
		this.fechaIncio = fechaIncio;
		this.fechaFin = fechaFin;
		this.idCategoria = idCategoria;
		this.imagenEvento = imagenEvento;
	}





	public EventoDTO() {
	}





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
	public InputStream getImagenEvento() {
		return imagenEvento;
	}
	public void setImagenEvento(InputStream imagenEvento) {
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
