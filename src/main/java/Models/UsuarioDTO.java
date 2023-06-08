package Models;

public class UsuarioDTO {

	private int idUsuario;
	private String nombreUsu,apellidoUsu,correoUsu;
	private String contraseniaUsu,paisUsu,ciudadUsu,generoUsu;
	
	//Getters y Setters
	
	public UsuarioDTO(String nombreUsu, String apellidoUsu, String correoUsu, String contraseñaUsu, String paisUsu,
			String ciudadUsu, String generoUsu) {
		this.nombreUsu = nombreUsu;
		this.apellidoUsu = apellidoUsu;
		this.correoUsu = correoUsu;
		this.contraseniaUsu = contraseñaUsu;
		this.paisUsu = paisUsu;
		this.ciudadUsu = ciudadUsu;
		this.generoUsu = generoUsu;
	}
	
	
	public UsuarioDTO() {
	}


	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getNombreUsu() {
		return nombreUsu;
	}
	public void setNombreUsu(String nombreUsu) {
		this.nombreUsu = nombreUsu;
	}
	public String getApellidoUsu() {
		return apellidoUsu;
	}
	public void setApellidoUsu(String apellidoUsu) {
		this.apellidoUsu = apellidoUsu;
	}
	public String getCorreoUsu() {
		return correoUsu;
	}
	public void setCorreoUsu(String correoUsu) {
		this.correoUsu = correoUsu;
	}
	public String getContraseniaUsu() {
		return contraseniaUsu;
	}
	public void setContraseniaUsu(String contraseñaUsu) {
		this.contraseniaUsu = contraseñaUsu;
	}
	public String getPaisUsu() {
		return paisUsu;
	}
	public void setPaisUsu(String paisUsu) {
		this.paisUsu = paisUsu;
	}
	public String getCiudadUsu() {
		return ciudadUsu;
	}
	public void setCiudadUsu(String ciudadUsu) {
		this.ciudadUsu = ciudadUsu;
	}
	public String getGeneroUsu() {
		return generoUsu;
	}
	public void setGeneroUsu(String generoUsu) {
		this.generoUsu = generoUsu;
	}
	
	
}
