package DAO;

import mantenimiento.MySQLAsistenteDAO;
import mantenimiento.MySQLCategoriaDAO;
import mantenimiento.MySQLCiudadDAO;
import mantenimiento.MySQLComentarioDAO;
import mantenimiento.MySQLEventoDAO;
import mantenimiento.MySQLOrganizadorDAO;
import mantenimiento.MySQLPaisDAO;
import mantenimiento.MySQLUsuarioDAO;

public class MySQLDAOFactory extends DAOFactory {

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return new MySQLUsuarioDAO() ;
	}

	@Override
	public PaisDAO getPaisDAO() {
		// TODO Auto-generated method stub
		return new MySQLPaisDAO();
	}

	@Override
	public CiudadDAO getCiudadDAO() {
		// TODO Auto-generated method stub
		return new MySQLCiudadDAO();
	}

	@Override
	public OrganizadorDAO getOrganizadorDAO() {
		// TODO Auto-generated method stub
		return new MySQLOrganizadorDAO();
	}

	@Override
	public EventoDAO getEventoDAO() {
		// TODO Auto-generated method stub
		return new MySQLEventoDAO();
	}

	@Override
	public CategoriaDAO getCategoriaDAO() {
		// TODO Auto-generated method stub
		return new MySQLCategoriaDAO();
	}

	@Override
	public AsistenteDAO getAsistenteDAO() {
		// TODO Auto-generated method stub
		return new MySQLAsistenteDAO();
	}

	@Override
	public ComentarioDAO getComentarioDAO() {
		// TODO Auto-generated method stub
		return new MySQLComentarioDAO();
	}
}
