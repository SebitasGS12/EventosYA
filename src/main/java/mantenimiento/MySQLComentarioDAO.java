package mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.ComentarioDAO;
import Models.ComentarioDTO;

public class MySQLComentarioDAO implements ComentarioDAO{
	
	public int registrar(ComentarioDTO com) {
		int rs = 0;
		PreparedStatement pst = null;
		Connection con = null;
		try {
			con = MysqlConector.getConexion();
			String sql = "insert into comentario values (null,?,?,?,?)";
			pst = con.prepareStatement(sql);
			pst.setInt(1, com.getIdEvento());
			pst.setInt(2, com.getIdUsuario());
			pst.setString(3, com.getContenido());
			pst.setString(4, com.getFechaHora());
			
			rs =pst.executeUpdate();
		} catch (Exception e) {
			
			  System.out.println("Error al agregar Comentario -> en la sentencia "+e.getMessage());
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
			
			  System.out.println("Error al actualizar Comentario -> en la sentencia "+e.getMessage());
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
			con = MysqlConector.getConexion();
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
	        String sql = "SELECT idComentario, idEvento, idUsuario, Contenido, fechaHora FROM comentario";
	        pst = con.prepareStatement(sql);
	        rs = pst.executeQuery();

	        while (rs.next()) {
	            ComentarioDTO com = new ComentarioDTO();
	            com.setIdComentario(rs.getInt(1));
	            com.setIdEvento(rs.getInt(2));
	            com.setIdUsuario(rs.getInt(3));
	            com.setContenido(rs.getString(4));
	            com.setFechaHora(rs.getDate(5).toString());

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

	@Override
	public ArrayList<ComentarioDTO> listarComentarioPorEvento( int codigoEvento) {
		 ArrayList<ComentarioDTO> lista = new ArrayList<ComentarioDTO>( );
		    ResultSet rs = null;
		    Connection con = null;
		    PreparedStatement pst = null;

		    try {
		        con = MysqlConector.getConexion();
		        String sql = "SELECT idComentario, idEvento, idUsuario, Contenido, fechaHora FROM comentario where idEvento = ?  ";
		        pst = con.prepareStatement(sql);
		        pst.setInt(1,codigoEvento);
		        
		        rs = pst.executeQuery();

		        while (rs.next()) {
		            ComentarioDTO com = new ComentarioDTO();
		            com.setIdComentario(rs.getInt(1));
		            com.setIdEvento(rs.getInt(2));
		            com.setIdUsuario(rs.getInt(3));
		            com.setContenido(rs.getString(4));
		            com.setFechaHora(rs.getDate(5).toString());

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
