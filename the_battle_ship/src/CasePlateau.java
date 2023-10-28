import java.util.ArrayList;


import java.awt.*;


public class CasePlateau {

	//
	private ArrayList<Navire>listNavireOccupant;
	
	public CasePlateau() {
		
		//private final ArrayList<Navire> listNavireOccupant;
	    
	        this.listNavireOccupant = new ArrayList<>();
	 
	}
	
	public ArrayList<Navire> getLesOccupants() {
		return this.listNavireOccupant;
		/*
		ArrayList<Navire>Nav; 
		
		for(Navire r : this.listNavireOccupant) {
			if(r.getPosition()== c.getPosition()) {
				Nav.add(r);
			}	
		}
		
		return Nav;	*/
	}
	
	public void addUnOccupant(Navire nouvelOccupant) {
		
		this.listNavireOccupant.add(nouvelOccupant);	
	}
	
	
	public String toString() {
		String strTop = "       ";
        String strBot = "       ";
        for (Navire navire : this.getLesOccupants()) {
            if (navire.getType().equals(TypeNav.SOUSMARIN)) {
                strBot = "Eq." + navire.getNumEq() + ",N" + navire.getIdent();
            } else {
                strTop = "Eq." + navire.getNumEq() + ",N" + navire.getIdent();
            }
        }
        return strTop + "|" + strBot;
    }
		

	public boolean estPleine() {
		if(this.listNavireOccupant.size() >= 2) {
			return true;
		}
		return false;
		
		
	}
	 boolean estOccupee(TypeNav typeNav) {
	        if (this.estPleine()) {
	            return true;
	        }
	        if (this.listNavireOccupant.isEmpty()) {
	            return false;
	        }
	        if (typeNav == TypeNav.SOUSMARIN) {
	            return this.listNavireOccupant.get(0).getType() == TypeNav.SOUSMARIN;
	        }
	        return this.listNavireOccupant.get(0).getType() != TypeNav.SOUSMARIN;
	    }
	 
	
	public void removeUnOccupant(Navire n) {
		listNavireOccupant.remove(n);
	}
	
}
