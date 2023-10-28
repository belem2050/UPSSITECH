/*
 * Classe Losange
 */ 
 
public class Losange extends Forme {
  Point A, B,C,D;
  
  public Losange(Point p) {
    super(p);
    // placement des points
    A = new Point();    
    A.setLocation(p);
    B = new Point();    
    B.setLocation(A);
    C = new Point();  
    C.setLocation(A);
    D = new Point();
    D.setLocation(A);
    B.translate(40,60);
    D.translate(-40,60);
    C.translate(0,120);
  }
  
  void setLocation(Point p) {
      super.setLocation(p);
      // redéfinition de l'emplacement des points
      A.setLocation(p);   
      B.setLocation(A);  
      C.setLocation(A);
      D.setLocation(A);
      B.translate(40,60);
      D.translate(-40,60);
      C.translate(0,120);   
  }
  
  public void update() {
    fill(this.c);
    quad((float) A.getX(), (float) A.getY(), (float) B.getX(), (float) B.getY(), (float) C.getX(), (float) C.getY(),  (float) D.getX(),  (float) D.getY());
  }  
  
  boolean isClicked(Point M) {
    // vérifier que le losange est cliqué
    // aire du rectangle AMD + AMB + BMC + CMD = aire losange  
    if (round( (float) (aire_triangle(A,M,D) + aire_triangle(A,M,B) + aire_triangle(B,M,C) + aire_triangle(C,M,D))) == round((float) aire()))
      return(true);
    else 
      return(false);  
  }
  
  protected double perimetre() {
    //
    PVector AB= new PVector( (int) (B.getX() - A.getX()),(int) (B.getY() - A.getY())); 
    PVector BC= new PVector( (int) (C.getX() - B.getX()),(int) (C.getY() - B.getY())); 
    PVector CD= new PVector( (int) (D.getX() - C.getX()),(int) (D.getY() - C.getY())); 
    PVector DA= new PVector( (int) (A.getX() - D.getX()),(int) (A.getY() - D.getY())); 
    return( AB.mag()+BC.mag()+CD.mag()+DA.mag()); 
  }
  
  protected double aire(){
    PVector AC= new PVector( (int) (C.getX() - A.getX()),(int) (C.getY() - A.getY())); 
    PVector BD= new PVector( (int) (D.getX() - B.getX()),(int) (D.getY() - B.getY())); 
    return((AC.mag()*BD.mag())/2);
  } 
  
  private double perimetre_triangle(Point I, Point J, Point K) {
    //
    PVector IJ= new PVector( (int) (J.getX() - I.getX()),(int) (J.getY() - I.getY())); 
    PVector JK= new PVector( (int) (K.getX() - J.getX()),(int) (K.getY() - J.getY())); 
    PVector KI= new PVector( (int) (I.getX() - K.getX()),(int) (I.getY() - K.getY())); 
    
    return( IJ.mag()+JK.mag()+KI.mag()); 
  }
   
  // Calcul de l'aire d'un triangle par la méthode de Héron 
  private double aire_triangle(Point I, Point J, Point K){
    double s = perimetre_triangle(I,J,K)/2;
    double aire = s*(s-distance(I,J))*(s-distance(J,K))*(s-distance(K,I));
    return(sqrt((float) aire));
  }
}
