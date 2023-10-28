/*
 * Classe Rectangle
 */ 
 
public class Rectangle extends Forme {
  
  int longueur;
  
  public Rectangle(Point p) {
    super(p);
    this.longueur=60;
  }
   
  public void update() {
    fill(this.c);
    square((int) this.origin.getX(),(int) this.origin.getY(),this.longueur);
  }  
  
  boolean isClicked(Point p) {
    int x= (int) p.getX();
    int y= (int) p.getY();
    int x0 = (int) this.origin.getX();
    int y0 = (int) this.origin.getY();
    
    // vérifier que le rectangle est cliqué
    if ((x>x0) && (x<x0+this.longueur) && (y>y0) && (y<y0+this.longueur))
      return(true);
    else  
      return(false);
  }
  
  // Calcul du périmètre du carré
  protected double perimetre() {
    return(this.longueur*4);
  }
  
  protected double aire(){
    return(this.longueur*this.longueur);
  }
}
