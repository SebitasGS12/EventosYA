package DAO;

import java.util.ArrayList;

import Models.CiudadDTO;

public interface CiudadDAO {
	public ArrayList<CiudadDTO> buscarCiudadPorIdPais(int id);
}
