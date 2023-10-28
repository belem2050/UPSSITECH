import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
            Jeu jeu = new Jeu(5);
            jeu.jouer();
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("******************************************\nErreur imprévu, contactez le créateur du jeu");
        }
        System.out.println("<Appuyez sur Entrée pour quitter>");
        Scanner sc = new Scanner(System.in);
        sc.nextLine();
    }
}
