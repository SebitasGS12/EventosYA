package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.ComentarioDAO;
import Models.ComentarioDTO;

public class MySqlComentarioDAO implements ComentarioDAO{
	
	public int registrar(ComentarioDTO com) {
		int rs = 0;
		PreparedStatement pst = null;
		Connection con = null;
		try {
			con = MysqlConector.getConexion();
			String sql = "insert into comentario values (null,default,default,?,?)";
			pst = con.prepareStatement(sql);
			pst.setInt(1, com.getIdEvento());
			pst.setInt(2, com.getIdAsistente());
			pst.setString(3, com.getContenido());
			pst.setString(4, com.getFechaHora());
			
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
	public int editar(ComentarioDTO com) {
		int rs = 0;
		PreparedStatement pst = null;
		Connection con = null;
		try {
			con = MysqlConector.getConexion();
			String sql = "UPDATE comentario SET contenido = ?, fechaHora = ? WHERE idComentario ";
			pst = con.prepareStatement(sql);
			
			pst.setString(1, com.getContenido());
			pst.setString(2, com.getFechaHora());
			
			rs =pst.executeUpdate();
		} catch (Exception e) {
			
			  System.out.println("Error al actualizar Evento -> en la sentencia "+e.getMessage());
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
	public int eliminar(int idComentario) {
		int rs=0;
		Connection con= null;
		PreparedStatement pst=null;
		try {
			String sql="DELETE FROM comentario WHERE idComentario = ?";
			pst=con.prepareStatement(sql);
			pst.setInt(1,idComentario);
			rs=pst.executeUpdate();	
		} catch (Exception e) {
		  System.out.println("Error en la sentencia "+e.getMessage());
		}finally{
			try {
				if(pst!=null)pst.close();
				if(con!=null)con.close();
			} catch (SQLException e2) {
				System.out.println("Error al cerrar "+e2.getMessage());
			}	
		}
			con=MysqlConector.getConexion();
		return rs;
	}
	
	
	@Override
	public ArrayList<ComentarioDTO> listarComentario() {
	    ArrayList<ComentarioDTO> lista = new ArrayList<ComentarioDTO>();
	    ResultSet rs = null;
	    Connection con = null;
	    PreparedStatement pst = null;

	    try {
	        con = MysqlConector.getConexion();
	        String sql = "SELECT idComentario, idEvento, idAsistente, Contenido, fechaHora FROM comentario";
	        pst = con.prepareStatement(sql);
	        rs = pst.executeQuery();

	        while (rs.next()) {
	            ComentarioDTO com = new ComentarioDTO();
	            com.setIdComentario(rs.getInt("idComentario"));
	            com.setIdEvento(rs.getInt("idEvento"));
	            com.setIdAsistente(rs.getInt("idAsistente"));
	            com.setContenido(rs.getString("Contenido"));
	            com.setFechaHora(rs.getDate("fechaHora").toString());

	            lista.add(com);
	        }
	    } catch (Exception e) {
	        System.out.println("Error al buscar comentarios: " + e.getMessage());
	    } finally {
	        try {
	            if (pst != null) pst.close();
	            if (rs != null) rs.close();
	            if (con != null) con.close();
	        } catch (SQLException e2) {
	            System.out.println("Error al cerrar la conexión: " + e2.getMessage());
	        }
	    }

	    return lista;
	}

}
