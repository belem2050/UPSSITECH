#include "AgendaP.h"

Agenda ::Agenda(const Tableau& tableau) {
    this->tableau = new Tableau();
    *this->tableau = tableau;
}

Agenda::Agenda(const Agenda &copie) {
    this->tableau = new Tableau();
    *this->tableau = *copie.tableau;
}
Agenda::~Agenda(){
    delete tableau;
}

Agenda Agenda::concat(Agenda agenda1) {
    Agenda agenda3(agenda1.tableau->getNbElements() + this->tableau->getNbElements());
    for(int i = 0; i < agenda1.tableau->getNbElements(); i++){
        agenda3.tableau->ajouter(agenda1.tableau->entree[i].nom, agenda1.tableau->entree[i].numero );
    }
    agenda3.tableau->afficher();
    for(int i = 0; i < this->tableau->getNbElements(); i++){
        agenda3.tableau->ajouter(this->tableau->entree[i].nom, this->tableau->entree[i].numero);
    }
    return agenda3;
}

void Agenda::ajouter(string nom, string numero) {
    this->tableau->ajouter(nom, numero);
}

void Agenda::supprimer(string nom) {
    tableau->supprimer(nom);
}

void Agenda::supprimer(string nom, string numero) {
    tableau->supprimer(nom,numero);
}

void Agenda::afficher() {
    this->tableau->afficher();

}

Agenda & Agenda::operator=(const Agenda & copie) {
    if (this != &copie) {
        delete tableau;
        this->tableau = new Tableau();
        *this->tableau = *copie.tableau;
    }
    return *this;
}

ostream  & operator<<(ostream& out , Agenda&  agenda){
    out << (*agenda.tableau)<<endl;
    return out;
}

void Agenda::operator+=(Entree & entree) {
    this->ajouter(entree.nom, entree.numero);
}

Agenda Agenda::operator+(Agenda & agenda) {
    return (this->concat(agenda));

}
void Agenda::operator+=(Agenda&  agenda) {
    for(int i = 0; i < agenda.tableau->getNbElements(); i++){
       this->ajouter(agenda.tableau->entree[i].nom, agenda.tableau->entree[i].numero);
    }
}

Entree Agenda::operator[](string& nom) {
    for (int i=0; i< this->tableau->getNbElements();i++){
        if(this->tableau->entree[i].nom == nom){
            return this->tableau->entree[i];
        }
    }
}
void Agenda::operator-=(string & nom) {
    for (int i=0; i< this->tableau->getNbElements();i++){
        if(this->tableau->entree[i].nom == nom){
            this->supprimer(nom);
        }
    }
}

bool Agenda::operator==(Agenda & agenda) {
    int nombre = 0;
    if (this->tableau->getNbElements() == agenda.tableau->getNbElements()){
        for (int i=0; i< this->tableau->getNbElements();i++){
            if (this->tableau->entree[i].nom == agenda.tableau->entree[i].nom && (this->tableau->entree[i].numero == agenda.tableau->entree[i].numero)){
                nombre++;
            }
        }
        if (nombre == this->tableau->getNbElements()){
            return true;
        }else{
            return false;
        }

    } else{
        return false;
    }
}

bool operator/(string & nom, Agenda & agenda){
      return (nom / *agenda.tableau);
}

void Agenda::operator()(char &c ) {
    for(int i = 0; i < this->tableau->getNbElements(); i++){
        if(this->tableau->entree[i].nom.at(0) == c){
            cout << this->tableau->entree[i].nom;
        }
    }
}

