package DAO;

public abstract class DAOFactory {

	public static final int MySQL =1;
	public static final int SQL =2;
	
	//Metodos de las DTO Models
	public abstract UsuarioDAO getUsuarioDAO();
	public abstract PaisDAO getPaisDAO();
	public abstract CiudadDAO getCiudadDAO();
	
	public static  DAOFactory getDaoFactory(int qBD) {
		
		switch (qBD) {
		case MySQL: {
			return new MySQLDAOFactory();
		}
		default:
			return null;
		}
	}
	
}
