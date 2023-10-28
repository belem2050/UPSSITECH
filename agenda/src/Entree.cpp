#include "Entree.h"
#include <istream>
void Entree::afficher(){
    cout << nom;
    cout << " ";
    cout << numero;
    cout << "  ";
}

Entree::Entree(string name, string num){
    this->nom = name;
    this->numero = num;
}

ostream  & operator<<(ostream& out , Entree&  entree) {
    out << "Nom : " << entree.nom << " Telephone: " << entree.numero << endl;
    return out;
}
bool operator/(string & nom, Entree & entree) {
    return (entree.nom == nom);
}