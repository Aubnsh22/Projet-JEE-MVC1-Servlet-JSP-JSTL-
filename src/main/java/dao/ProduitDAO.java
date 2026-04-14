package dao;

import java.util.List;


public interface ProduitDAO {
	
	
	public void addProduit(Produit P);
	
	
	public void deleteProduit(Long Id);
	
	
	public Produit getProduitById(Long Id);
	
	
	public List<Produit> getAllProducts();
	
	
	public void updateProduit(Produit p);
	
	

    
}