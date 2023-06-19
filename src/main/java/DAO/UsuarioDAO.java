package DAO;
import Models.UsuarioDTO;

public interface UsuarioDAO {

	public int registrar(UsuarioDTO u);

	public UsuarioDTO validar(String usuario, String clave);

    public int actualizarUsuario(UsuarioDTO a); //Humberto

	public int ModificarContrasenia(UsuarioDTO m);  //Humberto
	
	
}
