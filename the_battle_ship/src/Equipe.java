import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;







public  abstract class Equipe implements JIA, JHumain  {

	protected Statut myStatut;
    protected final Nature myNature;
    protected int ident;

    private final Scanner sc;
    private final Random rd;
    protected final ArrayList<Navire> listNavire;
    protected Commande myCommande;
	
	
	/*
	protected Statut myStatut;
	protected final Nature myNature;
	protected int ident;
	protected Status myStatut;
    protected final Nature myNature;
    protected int ident;

    private final Scanner sc;
    private final Random rd;
    protected final ArrayList<Navire> listeNavire;
    protected Commande myCommande;
	
	//
	//private Navire navire;	
	//private Nature nature;
	/*
	private final ArrayList<Navire>listNavire;
	protected Commande myCommande;
	private final Scanner sc;
    private final Random rd;*/

	
	
	public Equipe(Nature n) {
		this.listNavire = new ArrayList<>();
        this.myNature = n;
        this.rd = new Random();
        this.sc = new Scanner(System.in);
	}
	
	public void setStatut(Statut s) {
		this.myStatut =s;		
	}
	
	public Statut getStatut() {
		return this.myStatut;
	}
	public Nature getNature() {
		return this.myNature;
	}
	
	
    
	public Commande getCommande() {
		if(this.myNature == Nature.HUMAIN) {
			this.tirageAleatoire();
		}
				
		else if(this.myNature== Nature.IA) {
			this.interrogationParClavier();
		}
		return this.myCommande;	
	}
	
	public void interrogationParClavier() {
		String strNavire;
        String strAction;
        String strDirection = "";

        System.out.print("Veuillez saisir le numéro du navire qui va agir (de 0 à " + (this.listNavire.size() - 1) + ") : ");
        int idNavire;
        try {
            idNavire = sc.nextInt();
        } catch (Exception e) {
            sc.next();
            idNavire = -1;
        }
        while (idNavire < 0 || idNavire > this.listNavire.size()-1) {
            System.out.print("ERREUR DE SAISIE: Veuillez saisir le numéro du navire qui va agir (de 0 à " + (this.listNavire.size() - 1) + ") : ");
            try {
                idNavire = sc.nextInt();
            } catch (Exception e) {
                sc.next();
                idNavire = -1;
            }
        }
        strNavire = String.valueOf(idNavire);

        Action action1 = Action.DEPLACEMENT;
        Action action2;
        if (this.myStatut == Statut.MILITAIRE) {
            action2 = Action.TIR;
        } else {
            action2 = Action.PECHE;
        }
        System.out.print("Veuillez saisir l'action à faire (" + action1 + " ou " + action2 + ") : ");
        strAction = sc.next();
        if ("déplacement".equalsIgnoreCase(strAction)) {
            strAction = "deplacement";
        }
        if ("pêche".equalsIgnoreCase(strAction)) {
            strAction = "peche";
        }
        while (!action1.toString().equalsIgnoreCase(strAction) && !action2.toString().equalsIgnoreCase(strAction)) {
            System.out.print("ERREUR DE SAISIE : Veuillez saisir l'action à faire (" + action1 + " ou " + action2 + ") : ");
            strAction = sc.next();
            if ("déplacement".equalsIgnoreCase(strAction)) {
                strAction = "deplacement";
            }
            if ("pêche".equalsIgnoreCase(strAction)) {
                strAction = "peche";
            }
        }

        if (Action.TIR.toString().equalsIgnoreCase(strAction) || Action.DEPLACEMENT.toString().equalsIgnoreCase(strAction)) {
            ArrayList<Direction> directions = new ArrayList<>(Arrays.asList(Direction.values()));
            Direction direction1 = directions.get(0);
            Direction direction2 = directions.get(1);
            Direction direction3 = directions.get(2);
            Direction direction4 = directions.get(3);

            System.out.print("Veuillez saisir la direction dans laquelle agir (" + direction1 + ", " + direction2 + ", " + direction3 + ", " + direction4 + ") : ");
            strDirection = sc.next();
            while (true) {
                try {
                    Direction.valueOf(strDirection.toUpperCase());
                    break;
                } catch (IllegalArgumentException e) {
                    System.out.print("ERREUR DE SAISIE : Veuillez saisir la direction dans laquelle agir (" + direction1 + ", " + direction2 + ", " + direction3 + ", " + direction4 + ") : ");
                    strDirection = sc.next();
                }
            }
        }
        this.myCommande = new Commande(this, strNavire, strAction, strDirection);
		
		
		
	
	}
	
	public void tirageAleatoire() {
		int id;
		id = rd.nextInt(listNavire.size());
        id = listNavire.get(id).getIdent();

        int numAction;
        numAction = rd.nextInt(2);
        if (myStatut == Statut.NEUTRE && numAction == 1)
            numAction++;

        int direction = -1;
        
        if (numAction < 2)
            direction = rd.nextInt(4);
        System.out.println("Navire : " + id);
        System.out.println("Action : " + Action.values()[numAction]);
        if (!Action.values()[numAction].equals(Action.PECHE))
            System.out.println("Direction : " + Direction.values()[direction]);
        this.myCommande = new Commande(this,id, numAction, direction);
	}
	
	
	
	
	
	public String toString() {
		return "Equipe " + this.ident + " (" + this.myStatut + ", " + this.myNature + "), avec " + this.listNavire;	
	}
	
	public void addNavire(Navire nav) {	
		this.listNavire.add(nav);
		
	}
	
	public ArrayList<Navire> getListeNavire(){
		
		return this.listNavire;			
	}
	
	public int getId() {
		
		return this.ident;
		
	}
	
}
