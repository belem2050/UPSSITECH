import java.awt.*;



public class Navire {
	protected int ident;
	protected TypeNav myType;
	protected String strAffichage;
	protected int etat;
	protected int numEq;
	protected int vitesse;
	//
	public int rang;
	protected int portee;
	protected Point position;
	
	public Navire(int rang, TypeNav t, int numEq) {
		this.myType = t;
		this.numEq = numEq;
		this.rang = rang;	
	}
	
	public int getIdent() {
		return ident;	
	}
	
	public int getNumEq() {
		return numEq;	
	}
	public void setPosition(Point point) {
        this.position = point;
    }
	
	public Point getPosition() {	
		return position;
	}
	
	public TypeNav getType() {	
		return this.myType;	
	}
	
	public boolean estValide() {
		return this instanceof SousMarin ? this.etat == 2 : this.etat == 1;
			
	}
	
	public boolean estCoule() {
		if(etat==0) {
			return true;
		}
		return false;
		
	}
	
	public void seDeplacer(Point position2) {
		
		 this.setPosition(position2);	
	}
	
	public int getPortee() {
		
		return this.portee;
		
	}
	
	public int getVitesse() {	
		return this.vitesse;	
	}
	
	public void setCoule() {
		this.etat=0;		
	}
	
	public String toString() {
		return "Navire{" +"ident=" + ident +", myType=" + myType +", numEq=" + numEq +", etat=" + etat +", portee=" + portee +", vitesse=" + vitesse +", position=" + position +'}'	;	
		
	}

	
	}

	

	
	

