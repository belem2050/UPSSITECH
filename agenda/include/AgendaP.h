//
// Created by utilisateur on 11/11/2021.
//

#ifndef AGENDAP_H
#define AGENDAP_H

#endif //UNTITLED11_AGENDAP_H

#include <string>
#include "Tableau.h"

class Agenda{
private:
    Tableau *tableau;

public:
    Agenda() {tableau = new Tableau();}
    Agenda(const Tableau& tableau);
    Agenda(const Agenda &copie);
    ~Agenda();
    Agenda concat(Agenda agenda1);
    void ajouter(string nom, string numero);
    void supprimer(string nom, string numero);
    void supprimer(string nom);
    void afficher();
    Agenda & operator=(const Agenda & copie);
    friend ostream & operator<<(ostream&, Agenda& );
    void operator+=(Entree&);
    Agenda operator+(Agenda&);
    void operator+=(Agenda&);
    Entree operator[](string& );
    void operator-=(string&);
    bool operator==(Agenda&);
    friend bool operator/(string &, Agenda&);
    void operator()(char &);



};

