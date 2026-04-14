package dao;
import java.util.ArrayList;
import java.util.List;
import dao.Produit;
import dao.ProduitDAO;



public class ProduitImpl implements ProduitDAO {
	
	
	private List<Produit> Produits = new ArrayList<Produit>();
        private long currentId = 0;

        public void init() {


                System.out.println("systeme fonctionne");

                addProduit(new Produit("Camera 1","Canon r5",23000.0));
                addProduit(new Produit("Camera 2","Sony A6400",9000.0));        

        }


                public void addProduit(Produit p) {
                        currentId++;
                        p.setIDproduit(currentId);
                        Produits.add(p);
                }

                public void deleteProduit(Long Id) {
                        Produits.remove(getProduitById(Id));
                }

                public Produit getProduitById(Long Id) {
                        Produit produit = null;
                        for (Produit p : Produits) {
                                if(p.getIDproduit().equals(Id)) {
                                        produit = p;
                                }
                        }
                        return produit;
                }
		public List<Produit> getAllProducts(){
			return Produits;
		}
		
		
		public void updateProduit(Produit p) {
			for(int i = 0;i<Produits.size();i++) {
				Produit ProduitActuelle = Produits.get(i);
				if(ProduitActuelle.getIDproduit().equals(p.getIDproduit())) {
					
					ProduitActuelle.setNom(p.getNom());
					ProduitActuelle.setDescription(p.getDescription());
					ProduitActuelle.setPrix(p.getPrix());
					break;
					
					
				}
			}
			
		}
		
	}
	
	
	
	
	
	
	
