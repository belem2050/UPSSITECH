/*
 * Enumération de a Machine à Etats (Finite State Machine)
 *
 *
 */
 
public enum FSM {
  INITIAL, /* Etat Initial */
  ATTENTE_ACTION,
  
  CREER,
  ATTENTE_FORME,
  ATTENTE_COULEUR,
  ATTENTE_LIEU,
  CREATION_FORME,
  
  DEPLACER,
  DEPLACER_FORMES_SELECTION,
  DEPLACER_FORMES_DESTINATION,
  
  MODIF_COULEUR,
  ATTENTE_MODIF_COULEUR,
  
  SUPPRIMER_FORME,
  
  QUITTER,
  
  
  
}
