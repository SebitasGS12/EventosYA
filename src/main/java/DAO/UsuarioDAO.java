package DAO;
import Models.UsuarioDTO;

public interface UsuarioDAO {

	public int registrar(UsuarioDTO u);

	public UsuarioDTO validar(String usuario, String clave); 
	
	
}
