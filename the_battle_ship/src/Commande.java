
public class Commande {
	private int idNavire;
	private Action actionChoisie;
	private Direction directionChoisie;
	
	//
	
	private Equipe equipe;
	
	public Commande(Equipe eq, int id, int a, int d) {
		
		this.equipe = eq ;
		this.idNavire = id;
		this.directionChoisie= Direction.values()[a];
		this.actionChoisie=Action.values()[d];
			
	}
	
	public Commande(Equipe eq, String strldNav, String strAction, String strDirection) {
		
		
		 
		this.equipe = eq;
		this.idNavire = Integer.parseInt(strldNav);;
		this.actionChoisie= Action.valueOf(strAction);
		this.directionChoisie = Direction.valueOf(strDirection);
		
		
		
		
	}
	
	public Equipe getEquipe() {	
		return this.equipe;	
	}
	
	public int getIdNavire() {	
		return this.idNavire;	
	}
	
	public void setIdNavire(int iNavire) {
		this.idNavire = iNavire;
		
	}
	public Action getActionChoisie() {	
		
		return this.actionChoisie;	
	}
	
	public Direction getDirectionChoisie() {
		return this.directionChoisie;		
	}
	
	public void setDirectionChoisie(Direction directionChoisie) {
		
		directionChoisie= this.directionChoisie;
		
	}
	
	public String toString() {
		
		        return "Commande{" + "idNavire=" + idNavire + ", action=" + actionChoisie + ", direction=" + directionChoisie +", equipe=" + equipe + '}';
		    }
		
	}


