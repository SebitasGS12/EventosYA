package Coneccion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConector{
	public static Connection getConexion() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/eventosya"; 
			String usr = "root";
			String psw = "mysql";

			con = DriverManager.getConnection(url, usr, psw);
		} catch (ClassNotFoundException ex) {
			System.out.println("Error >> Driver no Instalado!! " + ex.getMessage());
		} catch (SQLException ex) {
			System.out.println("Error >> de conexión con la BD "+ex.getMessage());
		}catch(Exception ex) {
			System.out.println("Error >> general "+ex.getMessage());
		}
		return con;
	}

}