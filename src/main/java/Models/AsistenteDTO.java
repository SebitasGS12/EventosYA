package Models;

public class AsistenteDTO {

	private int idAsistente ,idUsuario,idEvento;
	private String fechaAsistencia;
	
	
	
	//Getters and Setters
	
	public AsistenteDTO(int idAsistente, int idUsuario, int idEvento, String fechaAsistencia) {
		
		this.idAsistente = idAsistente;
		this.idUsuario = idUsuario;
		this.idEvento = idEvento;
		this.fechaAsistencia = fechaAsistencia;
	}
	
	public AsistenteDTO( int idUsuario, int idEvento, String fechaAsistencia) {
		
	
		this.idUsuario = idUsuario;
		this.idEvento = idEvento;
		this.fechaAsistencia = fechaAsistencia;
	}
	
	
	public AsistenteDTO( ) {

	}
	
	public int getIdAsistente() {
		return idAsistente;
	}
	public void setIdAsistente(int idAsistente) {
		this.idAsistente = idAsistente;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}
	public String getFechaAsistencia() {
		return fechaAsistencia;
	}
	public void setFechaAsistencia(String fechaAsistencia) {
		this.fechaAsistencia = fechaAsistencia;
	}

	
	
	
}
