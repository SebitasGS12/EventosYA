package DAO;

import mantenimiento.MySQLCiudadDAO;
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
}
