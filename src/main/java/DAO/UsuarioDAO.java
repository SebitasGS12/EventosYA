package DAO;
import Models.EventoDTO;
import Models.UsuarioDTO;
import jakarta.servlet.http.HttpServletRequest;

public interface UsuarioDAO {

	public int registrar(UsuarioDTO u);

	public UsuarioDTO validar(String usuario, String clave);

    public int actualizarUsuario(UsuarioDTO a); //Humberto

	public int ModificarContrasenia(UsuarioDTO m);  //Humberto
	
	public UsuarioDTO buscarUsuario(int id) ; //Humberto
	
	
}
