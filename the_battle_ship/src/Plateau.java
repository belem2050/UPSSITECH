import java.awt.Point;



public class Plateau {
	private int myTaille;
	private CasePlateau[][] plateau;
	
	
	public Plateau(int taille) {
	        this.myTaille = taille;
	        plateau = new CasePlateau[taille][taille];
	        for (int i = 0; i < taille; i++) {
	            for (int j = 0; j < taille; j++) {
	            	plateau[i][j] = new CasePlateau();
	            }
	        }
	    
	}
	
	
	public  String toString() {
		
		StringBuilder affichage = new StringBuilder();

        affichage.append("|");
        affichage.append("-------|".repeat(Math.max(0, this.myTaille)));
        affichage.append("\n");
        

        for (int i = 0; i < this.myTaille; i++) {
            affichage.append("|");
            
            for (int j = 0; j < this.myTaille; j++) {
                affichage.append(this.getCasePlateau(i, j).toString().split("\\|")[0]);
                affichage.append("|");
            }
            affichage.append("\n");

            affichage.append("|");
            for (int j = 0; j < this.myTaille; j++) {
                affichage.append(this.getCasePlateau(i, j).toString().split("\\|")[1]);
                affichage.append("|");
            }
            affichage.append("\n");

            affichage.append("|");
            affichage.append("-------|".repeat(this.myTaille));
            affichage.append("\n");
        }

        return affichage.toString();
	
   }
	
	public void affichage() {
		System.out.println(this.toString());
		
	}
	public int getTaille() {
		return this.myTaille;
		
	}
	
	
	public CasePlateau getCasePlateau(int nl, int nc) {
		return this.plateau[nl][nc];
	}
	
	public CasePlateau getCasePlateau(Point point) {
        return this.plateau[point.x][point.y];
    }
}
