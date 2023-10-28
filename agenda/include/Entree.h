//
// Created by utilisateur on 09/11/2021.
//

#ifndef ENTREE_H
#define ENTREE_H
#include <string>
#include <iostream>
using namespace std;

class Entree{
private:
    string nom;
    string numero;
public:
    void afficher();
    Entree(string nom = "", string numero = "");
    friend class Agenda;
    friend class Tableau;
    friend ostream & operator<<(ostream&, Entree& );
    friend bool operator/(string &, Entree&);
};
#endif