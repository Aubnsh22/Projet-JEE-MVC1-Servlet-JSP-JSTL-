package web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.Produit;
import services.ProduitMetier;
import services.ProduitMetierImpl;


public class AddProduitServlet extends HttpServlet {

    
    private static final ProduitMetier metier = ProduitMetierImpl.getinstance();

    
    List<Produit> produits = new ArrayList<Produit>();
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        String nom = req.getParameter("nom");
        String description = req.getParameter("description");
        Double prix = Double.parseDouble(req.getParameter("prix")); // conversion String -> Double

        
        Produit p = new Produit(nom, description, prix);
        
        metier.addProduit(p);
        
        produits.add(p);
        
        req.setAttribute("listeProduits", metier.getAllProduits());
        
        req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
    }
}
    
