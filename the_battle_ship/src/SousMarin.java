
public class SousMarin extends NavireProfondeur {

	public SousMarin(int rang, int numEq) {
		super(rang,TypeNav.SOUSMARIN, numEq);
		
	}
	 public void setEndommage() {
	        this.etat = 1;
	    }
	
	
}

