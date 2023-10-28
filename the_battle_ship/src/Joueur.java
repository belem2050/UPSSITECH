import java.util.ArrayList;

public interface Joueur {
	//
	/*
	public Statut statut;
	private ArrayList<Navire>listNavire;
	private int Id;
	*/
	//
	
	Commande getCommande();
	
	Statut getStatut();
	
	 void addNavire(Navire nav);
	
	 ArrayList<Navire> getListeNavire();
		
	 int getId();

	//setter
	// void setId(int Id);
		
	 //getter
	 Nature getNature();
}