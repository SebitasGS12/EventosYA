package mantenimiento;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Coneccion.MysqlConector;
import DAO.EventoDAO;
import Models.CiudadDTO;
import Models.EventoDTO;

import java.io.ByteArrayOutputStream;
import java.io.IOException;



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
				p.setFechaIncio(rs.getDate(6).toString());
				p.setFechaFin(rs.getDate(7).toString());
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

	@Override
	public EventoDTO UltimoCodigo() {
		ArrayList<EventoDTO> lista = listarEvento();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		
		EventoDTO ultimovalor = lista.get( lista.size()-1 );
		
		
		
		return ultimovalor;
		
		
		
	}

	public ArrayList<EventoDTO> listarEventoPorId(int id) {
		
		// TODO Auto-generated method stub

		ArrayList<EventoDTO> lista = new ArrayList<EventoDTO>();
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pst = null;
		
		try {
			con = MysqlConector.getConexion();
			String sql = " select idEvento, nombreEvento,descripcionEvento,ubicacionEvento,imagenEvento,fechaInicio,fechaFin,idCategoria  from evento where idEvento =  ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);

			
			rs=pst.executeQuery();	
			while (rs.next()) {
		 
				 
				EventoDTO p = new EventoDTO();		
				
				p.setIdEvento(rs.getInt(1)); 
				p.setNombreEvento(rs.getString(2));
				p.setDescripcionEvento(rs.getString(3));
				p.setUbicacionEvento(rs.getString(4));
				p.setImagenEvento(rs.getBinaryStream(5));
				p.setFechaIncio(rs.getDate(6).toString());
				p.setFechaFin(rs.getDate(7).toString());
				p.setIdCategoria(rs.getInt(8));				
				
				lista.add(p);
			}
			
		} catch (Exception e) {
			
			  System.out.println("Error al buscar Evento > en la sentencia "+e.getMessage());
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

	public EventoDTO buscarEvento(int id) {
			
			// TODO Auto-generated method stub
			EventoDTO p = null;
			ResultSet rs = null;
			Connection con = null;
			PreparedStatement pst = null;
			
			try {
				con = MysqlConector.getConexion();
				String sql = " select idEvento, nombreEvento,descripcionEvento,ubicacionEvento,imagenEvento,fechaInicio,fechaFin,idCategoria  from evento where idEvento =  ? ";
				pst = con.prepareStatement(sql);
				pst.setInt(1, id);
	
				
				rs=pst.executeQuery();	
				
				while (rs.next()) {
					 
					  p= new EventoDTO(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getBinaryStream(5),
						rs.getDate(6).toString(),
						rs.getDate(7).toString(),
						rs.getInt(8));		 
				}
				


				
			} catch (Exception e) {
				
				  System.out.println("Error al buscar Evento > en la sentencia "+e.getMessage());
			}finally {
				try {
					if(pst!=null)pst.close();
					if(rs!=null)rs.close();
					if(con!=null)con.close();
				} catch (SQLException e2) {
					System.out.println("Error al cerrar "+e2.getMessage());
				}
			}
		
			
			
			return p;
			
		}

	@Override
	public String ConvertirIMG(InputStream imagenInputStream) {
		
		String imagenBase64= "";
		
		 if(imagenInputStream != null){
			 ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			 byte[] buffer = new byte[4096];
			 int bytesRead;
			 try {
				while ((bytesRead = imagenInputStream.read(buffer)) != -1) {
				     byteArrayOutputStream.write(buffer, 0, bytesRead);
				 }
				 byte[] imagenBytes = byteArrayOutputStream.toByteArray();
				 
				 // Convertir los bytes de la imagen a una cadena Base64
				 imagenBase64 = "data:image/jpeg;base64,"+java.util.Base64.getEncoder().encodeToString(imagenBytes);
				 
				 // Cerrar el InputStream y el ByteArrayOutputStream
				 imagenInputStream.close();
				 byteArrayOutputStream.close();
				 
				 if (imagenBase64.equals("data:image/jpeg;base64,")) {
					 imagenBase64 = "/EventosYa/imgs/imagenEditarEvento.png";
				 }
				 
				 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		 }else {
			 imagenBase64 = "/EventosYa/imgs/imagenEditarEvento.png";
			 
			 
		 }
		 
		 
		 
		 return imagenBase64;
		
	}

	@Override
	public int actualizar(EventoDTO u) {

		int rs = 0;
		PreparedStatement pst = null;
		Connection con = null;
		try {
			con = MysqlConector.getConexion();
			String sql = " UPDATE evento SET nombreEvento= ?, descripcionEvento= ?, ubicacionEvento= ?, imagenEvento = ? , fechaInicio = ? ,fechaFin = ? , idCategoria = ? WHERE idEvento = ? ";
			pst = con.prepareStatement(sql);
			
			pst.setString(1, u.getNombreEvento());
			pst.setString(2, u.getDescripcionEvento());
			pst.setString(3, u.getUbicacionEvento());
			pst.setBlob(4, u.getImagenEvento());
			pst.setString(5, u.getFechaIncio());
			pst.setString(6, u.getFechaFin());
			pst.setInt(7, u.getIdCategoria());
			pst.setInt(8, u.getIdEvento());
			
			
			
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

		
	
}	
