package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	@Override
	public ArrayList<EventoDTO> listarEvento() {
		ArrayList<EventoDTO> lista = new ArrayList<EventoDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idEvento, nombreEvento,descripcionEvento,ubicacionEvento,imagenEvento,fechaInicio,fechaFin,idCategoria from evento  ";
			pst = con.prepareStatement(sql);
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				EventoDTO p = new EventoDTO();				
				p.setIdEvento(rs.getInt(1)); 
				p.setNombreEvento(rs.getString(2));
				p.setDescripcionEvento(rs.getString(3));
				p.setUbicacionEvento(rs.getString(4));
				p.setImagenEvento(rs.getBinaryStream(5));
				p.setFechaIncio(rs.getString(6));
				p.setFechaFin(rs.getString(7));
				p.setIdCategoria(rs.getInt(8));				
				
				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al listar Evento -> en la sentencia "+e.getMessage());
		}finally {
			try {
				if(pst!=null)pst.close();
				if(rs!=null)rs.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}
		}
	
		
		return lista;
	}

}
