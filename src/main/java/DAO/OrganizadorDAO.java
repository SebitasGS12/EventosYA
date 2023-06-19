
package DAO;

import java.util.ArrayList;

import Models.EventoDTO;
import Models.OrganizadorDTO;
import Models.UsuarioDTO;

public interface OrganizadorDAO {

	
	public int registrar(UsuarioDTO u,EventoDTO eve  );

	public int eliminar(int codigo  );

	
	public ArrayList<OrganizadorDTO> listarOrganizadorPorUsuario(int id);
	
	
	public OrganizadorDTO buscarOrganizador(int codigo);
	
	
}
