

public class EqPecheur extends Equipe {

	public EqPecheur(int idEq, Nature n) {
		super(n);
		this.ident=idEq;
		this.myStatut = Statut.NEUTRE;
	}

}