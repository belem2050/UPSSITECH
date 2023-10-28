#include <iostream>
#include "Tableau.h"
#include "Entree.h"

using namespace std;

Tableau :: Tableau(int taillet){
    this->tailletotale = taillet;
    this->nombreElements = 0;
    this->entree = new Entree[taillet];
}

Tableau::~Tableau(){
    delete [] entree;
}

Tableau::Tableau(const Tableau &copie){
    entree = new Entree[copie.tailletotale];
    for(int i=0; i< copie.nombreElements;i++){
       this->entree[i] = copie.entree[i];
    }
    this->nombreElements = copie.nombreElements;
    this->tailletotale = copie.tailletotale;
}

void Tableau::afficher(){
    if(nombreElements==0){
        cout<< "vide";
    } else{
        for (int i=0; i< this->nombreElements;i++ ){
            entree[i].afficher();
        }
    }

}

void Tableau :: supprimer(string nom, string numero){
    for (int i=0; i< this->nombreElements;i++){
        if(entree[i].nom == nom && entree[i].numero == numero){
            entree[i] = entree[nombreElements-1];
            nombreElements--;
        }

    }
}

void Tableau::supprimer(string nom) {
    int nb =0;
    for(int i=0; i<nombreElements;i++){
        if(entree[i].nom == nom){
            entree[i] = entree[nombreElements-1];
            nombreElements--;
            i--;
            nb++;
        }
    }
    if(nb == 0){
        cout << "Nom non present ";
    }
}

void Tableau::ajouter(string nom, string numero){
    if(nombreElements < tailletotale){
        entree[nombreElements].nom = nom;
        entree[nombreElements].numero = numero;
        nombreElements++;
    }else{
        cout << "Taille max atteinte";
    }
}

int Tableau::getNbElements() {
    return this->nombreElements;
}

int Tableau::getTaille() {
    return this->tailletotale;
}

void Tableau::setTaille(int tailleTotale) {
    this->tailletotale= tailleTotale;
}
void Tableau::setNbElements(int nbElements) {
    this->nombreElements = nbElements;
}


Tableau & Tableau::operator=(const Tableau & copie) {
    if (this != &copie) {
        delete [] entree;
        this->entree = new Entree[copie.tailletotale];
        for(int i=0; i< copie.nombreElements;i++){
            this->entree[i] = copie.entree[i];
        }
        this->nombreElements = copie.nombreElements;
        this->tailletotale = copie.tailletotale;
    }
    return *this;
}

ostream  & operator<<(ostream& out , Tableau&  tableau){
    for(int i = 0; i<tableau.nombreElements; i++){
        out << tableau.entree[i]<<endl;
    }
    return out;

}

bool operator/(string & nom, Tableau & tableau) {

    return (nom / *tableau.entree);
}