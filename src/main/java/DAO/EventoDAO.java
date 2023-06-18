package DAO;

import java.io.InputStream;
import java.util.ArrayList;

import Models.EventoDTO;

public interface EventoDAO {
	public int registrar(EventoDTO u);
	
	public ArrayList<EventoDTO> listarEvento();

	
	public EventoDTO UltimoCodigo( ); 
	
	public ArrayList<EventoDTO> listarEventoPorId(int id);
	public EventoDTO buscarEvento(int id) ;
	
	
	public String ConvertirIMG(InputStream imagenInputStream);
}
