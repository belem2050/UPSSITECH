/*
 * Classe Cercle
 */ 
 
public class Cercle extends Forme {
  
  int rayon;
  
  public Cercle(Point p) {
    super(p);
    this.rayon=80;
  }
   
  public void update() {
    fill(this.c);
    circle((int) this.origin.getX(),(int) this.origin.getY(),this.rayon);
  }  
   
  boolean isClicked(Point p) {
    // vérifier que le cercle est cliqué
   PVector OM= new PVector( (int) (p.getX() - this.origin.getX()),(int) (p.getY() - this.origin.getY())); 
   if (OM.mag() <= this.rayon/2)
     return(true);
   else 
     return(false);
  }
  
  protected double perimetre() {
    return(2*PI*this.rayon);
  }
  
  protected double aire(){
    return(PI*this.rayon*this.rayon);
  }
}
