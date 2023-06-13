package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Coneccion.MysqlConector;
import DAO.EventoDAO;
import Models.EventoDTO;

public class MySQLEventoDAO implements EventoDAO {

	@Override
	public int registrar(EventoDTO u) {

		int rs = 0;
		PreparedStatement pst = null;
		Connection con = null;
		try {
			con = MysqlConector.getConexion();
			String sql = " insert into evento values (null,?,?,?,?,?,?,?) ";
			pst = con.prepareStatement(sql);
			
			pst.setString(1, u.getNombreEvento());
			pst.setString(2, u.getDescripcionEvento());
			pst.setString(3, u.getUbicacionEvento());
			pst.setBlob(4, u.getImagenEvento());
			pst.setString(5, u.getFechaIncio());
			pst.setString(6, u.getFechaFin());
			pst.setInt(7, u.getIdCategoria());
			
			rs =pst.executeUpdate();
			
			
		} catch (Exception e) {
			
			  System.out.println("Error al agregar Evento -> en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}
		}
		
		return rs;

	}

}
