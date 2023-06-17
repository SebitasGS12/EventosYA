package DAO;

import java.util.ArrayList;

import Models.EventoDTO;

public interface EventoDAO {
	public int registrar(EventoDTO u);
	
	public ArrayList<EventoDTO> listarEvento();

	
	public EventoDTO UltimoCodigo( ); 
}
