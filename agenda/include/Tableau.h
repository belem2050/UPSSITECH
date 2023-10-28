#ifndef TABLEAU_H
#define TABLEAU_H
#include<string>
#include"Entree.h"

using namespace std;

class Tableau{
private:
    int tailletotale;
    Entree *entree;
    int nombreElements;
public:
    Tableau(int tailletotale=100);
    ~Tableau();
    Tableau(const Tableau &copie);
    void afficher();
    void ajouter(string nom, string num);
    void supprimer(string nom, string numero);
    void supprimer(string nom);
    int getTaille();
    int getNbElements();
    void setTaille(int tailleTotale);
    void setNbElements(int nbElements);
    Tableau & operator=(const Tableau & copie);
    friend class Agenda;
    friend ostream & operator<<(ostream&, Tableau& );
    friend bool operator/(string &, Tableau&);

};
#endif