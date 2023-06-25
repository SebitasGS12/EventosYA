package Models;

public class ComentarioDTO {
	private int idComentario,idEvento,idUsuario;
	private String contenido,fechaHora;
	
	
	
	
	public ComentarioDTO( int idEvento, int idUsuario, String contenido, String fechaHora) {
		this.idEvento = idEvento;
		this.idUsuario = idUsuario;
		this.contenido = contenido;
		this.fechaHora = fechaHora;
	}
	
	
	public ComentarioDTO(int idComentario, int idEvento, int idUsuario, String contenido, String fechaHora) {
		this.idComentario = idComentario;
		this.idEvento = idEvento;
		this.idUsuario = idUsuario;
		this.contenido = contenido;
		this.fechaHora = fechaHora;
	}
	//Getters and Setters
	
	
	
	public ComentarioDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getIdComentario() {
		return idComentario;
	}
	public void setIdComentario(int idComentario) {
		this.idComentario = idComentario;
	}
	public int getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	public String getFechaHora() {
		return fechaHora;
	}
	public void setFechaHora(String fechaHora) {
		this.fechaHora = fechaHora;
	}
	
	
	
	
}
