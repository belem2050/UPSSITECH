import java.awt.Point;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;




public class Jeu {
	
	
    public static void main(String[] args) {
        try {
            Jeu jeu = new Jeu(7);
            jeu.jouer();
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Erreur");
        }
       /* System.out.println("<Appuyez sur EntrÃ©e pour quitter>");
        Scanner scanner = new Scanner(System.in);
        scanner.nextLine();*/
    }

    private boolean fini;
    private final ArrayList<Joueur> listeJoueurs;
    private final Random rd;
    private final Plateau plateau;
    private final Scanner scanner;

    public Jeu(int taille) {
        this.fini = false;
        this.listeJoueurs = new ArrayList<>();
        this.rd = new Random();
        this.plateau = new Plateau(taille);
        this.scanner = new Scanner(System.in);
    }

    public void jouer() {
     
    	
       System.out.println("PRET?\t ON Y VA ");
        
      
        choixJoueur();
        attributionNavire();
        positionnementNavire();
        
        while (!fini) {
            for (Joueur joueur : this.listeJoueurs) {
                for (Joueur joueur1: this.listeJoueurs) {
                    System.out.println("Eq :" + joueur1.getId() + ", STATUT: " + joueur1.getStatut() + ", NATURE: " + joueur1.getNature());
                }
                this.plateau.affichage();
                System.out.println("Equipe " + joueur.getId() + "\n A vous de jouer");
                majJeuAvCommande(joueur.getCommande());
                
                fini = majListeNavire();
                if (fini) {
                    break;
                }
                System.out.println("Jeu non terminé, continuez en tapant le clavier");
                scanner.nextLine();
                
               
            }
        }
        finDePartie();
    }

   
//
    private void finDePartie() {
        System.out.println("Game over");
        int[] points = new int[this.listeJoueurs.size()];

        for (int i = 0; i < this.listeJoueurs.size(); i++) {
            for (Navire navire : this.listeJoueurs.get(i).getListeNavire()) {
                if (navire.estValide()) {
                	points[i]++;
                }
            }
        }

        ArrayList<Joueur> vainqueurs = new ArrayList<>();
        for (Joueur joueur : this.listeJoueurs) {
            if (vainqueurs.isEmpty()) {
            	vainqueurs.add(joueur);
            } else {
                if (points[vainqueurs.get(0).getId()] < points[joueur.getId()]) {
                	vainqueurs.clear();
                	vainqueurs.add(joueur);
                } else if (points[vainqueurs.get(0).getId()] == points[joueur.getId()]) {
                	vainqueurs.add(joueur);
                }
            }
        }
        if (vainqueurs.size() > 1) {
            System.out.println("Pas d'unique Vainqueur!!");
            System.out.print("Les vainqueurs sont ");
            for (Joueur joueur : vainqueurs) {
                if (joueur.getId() == vainqueurs.get(vainqueurs.size()-1).getId()) {
                    System.out.println("E " + joueur.getId());
                } else {
                    System.out.print("E " + joueur.getId());
                }
            }
        } else {
            System.out.println("Le vainquer est E " + vainqueurs.get(0).getId() + " !!");
        }
    }

    private boolean majListeNavire() {
        for (Joueur joueur : this.listeJoueurs) {
            boolean vivant = false;
            for (Navire navire : joueur.getListeNavire()) {
                if (!navire.estCoule()) {
                    vivant = true;
                    break;
                }
            }
            if (!vivant) {
                return true;
            }
        }
        return false;
    }

    private void majJeuAvCommande(Commande myCommande) {
        Joueur joueur = myCommande.getEquipe();
        int idNavire = myCommande.getIdNavire();
        Navire navire = joueur.getListeNavire().get(idNavire);

        if (!navire.estCoule()) {
            if (myCommande.getActionChoisie()== Action.DEPLACEMENT) {
                    try {
                        majJeuCasDeplacement(myCommande);
                    } catch (OccupException | LimiteException ignored){}
                    	
                    
            }
                          
           if(myCommande.getActionChoisie()==Action.TIR) {
            	   majJeuCasTir(myCommande);
              }
           if(myCommande.getActionChoisie()==Action.PECHE) {
            	  majJeuCasPeche(myCommande);
              }
            
        else {
            System.out.println("Impossible de jouer avec ce navire");
        
          }
        }
    }

    private void majJeuCasPeche(Commande myCommande) {
        Joueur joueur = myCommande.getEquipe();
        int idNavire = myCommande.getIdNavire();
       // Point position ;
        Point position = joueur.getListeNavire().get(idNavire).getPosition();
        
        CasePlateau casePlateau = this.plateau.getCasePlateau((Point) position);

        if (casePlateau.estOccupee(TypeNav.SOUSMARIN)) {
            for (Navire navire : casePlateau.getLesOccupants()) {
                if (navire.getType().equals(TypeNav.SOUSMARIN)) {
                    ((SousMarin) navire).setEndommage();
                    System.out.println("Navire de N " + navire.getNumEq() + " endommagé!");
                }
            }
        } else {
            System.out.println("Peche effectuée");
        }
    }

    
    private void majJeuCasTir(Commande myCommande) {
        Joueur joueur = myCommande.getEquipe();
        int idNavire = myCommande.getIdNavire();
        Navire navire = joueur.getListeNavire().get(idNavire);
        Point position = navire.getPosition();
        
        
        Direction direction = myCommande.getDirectionChoisie();
        CasePlateau casePlateau;

        int taille = this.plateau.getTaille();
        boolean atteint = false;
        for (int i = 0; i < navire.getPortee() && !atteint; i++) {
            position = direction.getPointSuivant(position);
            if (position.x < taille && position.y < taille && position.x >= 0 && position.y >= 0) {
                casePlateau = this.plateau.getCasePlateau(position);
                for (Navire navire2 : casePlateau.getLesOccupants()) {
                    navire2.setCoule();
                    
                    atteint = true;
                    System.out.println("Navire " + navire2.getIdent() + " de E " + navire2.getNumEq() + " coulé !");
                }
            }
        }
        if (!atteint) {
            System.out.println("Tir à vide");
        }
    }

    
    private void majJeuCasDeplacement(Commande myCommande) throws OccupException, LimiteException {
        Joueur joueur = myCommande.getEquipe();
        int idNavire = myCommande.getIdNavire();
        Navire navire = joueur.getListeNavire().get(idNavire);
        Point position = navire.getPosition();
        Direction direction = myCommande.getDirectionChoisie();
        CasePlateau casePlateau = this.plateau.getCasePlateau(position);

        if (!navire.estValide()) {
            System.out.println("Selectionner un autre, il ce navire n'est pas vamlide.");
            return;
        }

        int taille = this.plateau.getTaille();
        for (int i = 0; i < navire.getVitesse(); i++) {
            position = direction.getPointSuivant(position);
            if (position.x < taille && position.y < taille && position.x >= 0 && position.y >= 0) {
                CasePlateau casePlateau2 = this.plateau.getCasePlateau(position);
                if (!casePlateau2.estOccupee(navire.getType())) {
                    navire.seDeplacer(position);
                    casePlateau.removeUnOccupant(navire);
                    casePlateau2.addUnOccupant(navire);
                    casePlateau = casePlateau2;
                    System.out.println("Nouvelle position " + position.x + ";" + position.y);
                } else {
                    System.out.println("Impossible");
                }
            } 
        }
    }
    private void choixJoueur() {
        int idEquipeIA = this.rd.nextInt(3);
        int idPecheur = this.rd.nextInt(3);
        for (int i = 0; i < 3; i++) {
            Nature nature = i == idEquipeIA ? Nature.IA : Nature.HUMAIN;
            Joueur joueur = i == idPecheur ? new EqPecheur(i, nature) : new EqBataillon(i, nature);
            this.listeJoueurs.add(joueur);
        }
    }

    private void positionnementNavire() {
        for (Joueur joueur : this.listeJoueurs) {
            for (Navire navire : joueur.getListeNavire()) {
                int taille = this.plateau.getTaille();
                int x;
                int y;
                do {
                    x = this.rd.nextInt(taille);
                    y = this.rd.nextInt(taille);
                } while (this.plateau.getCasePlateau(x, y).estOccupee(navire.getType()));
                navire.setPosition(new Point(x, y));
                this.plateau.getCasePlateau(x, y).addUnOccupant(navire);
            }
        }
    }

    private void attributionNavire() {
    	//System.out.println("Combien de navires voulez-vous par équipe?");
    	
        for (Joueur joueur : listeJoueurs) {
            for (int i = 0; i < 3 ; i++) {
                Navire navire;
                if (joueur.getStatut() == Statut.NEUTRE) {
                    navire = new Chalutier(i, joueur.getId());
                } else {
                    navire = i >= 2 ? new SousMarin(i, joueur.getId()) : new Destroyer(i, joueur.getId());
                }
                joueur.addNavire(navire);
            }
        }
    }

    
}






