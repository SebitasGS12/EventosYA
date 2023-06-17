package Models;

public class OrganizadorDTO {

	
	
	
	private int idOrganizador,idUsuario,idEvento;

	public OrganizadorDTO(int idOrganizador, int idUsuario, int idEvento) {
		this.idOrganizador = idOrganizador;
		this.idUsuario = idUsuario;
		this.idEvento = idEvento;
	}

	public OrganizadorDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdOrganizador() {
		return idOrganizador;
	}

	public void setIdOrganizador(int idOrganizador) {
		this.idOrganizador = idOrganizador;
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
	
	
	
}
