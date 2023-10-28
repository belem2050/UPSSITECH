#include <iostream>
#include "Entree.h"
#include "Tableau.h"
#include "AgendaP.h"

using namespace std;

int main() {
    cout <<1542;
    Entree entre;
    Entree entree("Mamamam", "11111111");
    Tableau tableau1(5);
    cout <<1545;
    Tableau tableau2(4);
    cout <<1543;
    Agenda agenda3;
    Agenda  agenda4;
    cout <<1544;

    tableau1.ajouter("bel", "12548");
    cout <<1545;
    tableau1.ajouter("Afsa", "25487");
    tableau1.ajouter("Awa", "2457");
    tableau1.ajouter("Awa", "2458");

    cout << "Tableau 1";
    cout << endl;
    tableau1.afficher();
    cout << endl;

    tableau2.ajouter("Zalle","12548");
    tableau2.ajouter("Z","48");
    tableau2.ajouter("Madi","25848");
    tableau2.ajouter("Medon","36258");
    Agenda agenda1(tableau1);
    Agenda agenda2(tableau2);

    cout << "Tableau 2";
    cout << endl;
    tableau2.afficher();
    cout << endl;

    cout << "Agenda1";
    cout << endl;
    agenda1.afficher();
    cout << endl;
    cout << "Agenda2";
    cout << endl;
    agenda2.afficher();
    cout << endl;

    cout << "Agenda1 concat a 2";
    cout << endl;
    agenda3 = agenda1.concat(agenda2);
    cout << endl;
    agenda3.afficher();
    cout << "Suppression";
    cout << endl;
    agenda3.supprimer("Zalle");
    cout << endl;
    agenda3.afficher();
    cout << endl;

    cout << "Agenda avec operateur" << endl;
    cout << agenda3;
    cout << endl;
    agenda1+=entree;
    agenda1.afficher();
    cout << endl;
    cout << (agenda1 == agenda2);
    cout << endl;
    agenda4 = agenda1 + agenda2;
    cout << endl;
    cout << agenda4;
    string f = "Z";
    entre = agenda4[f] ;
    cout << entre;
    cout << "END CHECKING" <<endl;


   return 0;
}

