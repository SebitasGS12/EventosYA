
package DAO;

import java.util.ArrayList;

import Models.AsistenteDTO;
import Models.EventoDTO;
import Models.OrganizadorDTO;
import Models.UsuarioDTO;

public interface OrganizadorDAO {

	
	public int registrar(UsuarioDTO u,EventoDTO eve  );

	public int eliminar(int codigo  );

	public OrganizadorDTO validarOrganizador(int idUsuario,int idEvento);

	public ArrayList<OrganizadorDTO> listarOrganizadorPorUsuario(int id);
	

	public ArrayList<OrganizadorDTO> buscarPorFiltro(String filtro);

	
	public OrganizadorDTO buscarOrganizador(int codigo);
	
	public OrganizadorDTO buscarOrganizadorPorEvento(int codigo);
	
	public ArrayList<OrganizadorDTO> listarOrganizador();
	
}
