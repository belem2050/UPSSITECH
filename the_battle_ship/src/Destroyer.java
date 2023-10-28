
public class Destroyer extends NavireSurface {
	
	public Destroyer(int rang, int numEq) {
		super(rang,TypeNav.DESTROYER,numEq);
				
	}
	
	public String toString() {
		return "Destroyer{" +"ident=" + ident +", myType=" + myType +", strAffichage='" + strAffichage + '\'' +", numEq=" + 
	            numEq +", etat=" + etat + ", portee=" + portee +", vitesse=" + vitesse + ", position=" + position + '}';
		
	}

}
