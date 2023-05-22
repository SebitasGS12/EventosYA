package DAO;

public abstract class DAOFactory {

	public static final int MySQL =1;
	public static final int SQL =2;
	
	//Metodos de las DTO Models
	
	
	public static  DAOFactory geDaoFactory(int qBD) {
		
		switch (qBD) {
		case MySQL: {
			return new MySQLDAOFactory();
		}
		default:
			return null;
		}
	}
	
}
