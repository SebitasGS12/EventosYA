package DAO;

import mantenimiento.MySQLUsuarioDAO;

public class MySQLDAOFactory extends DAOFactory {

	@Override
	public UsuarioDAO getUsuarioDAO() {
		// TODO Auto-generated method stub
		return new MySQLUsuarioDAO() ;
	}
}
