function [L,compteur]=partageEaux(G)
s = size(G);
L = ones(s(1)+2, s(2)+2); %matrice à remplir de partage des eaux % On fait +2 car on ajoute une ligne et une colonne de chaque coté pour que quand on fasse le traitmeent du filtre 8 voisins on aille déjà qqchose, car sinon on a rien.

compteur = 2;

for N=0:max(max(G)) % N = niveau
    [X Y V] = find(G == N); %% determiner les coordonnees X Y
    d = size(X);
    for z=1:d
        x = X(z);
        y = Y(z);
        voisins = reshape(L(x:x+2, y:y+2), 1, []);  %une seule colonne avec les 9 valeurs
        voisins = [voisins(1:4), voisins(6:9)]; % On s'en fiche de la valeur d'au milieu, on prend les 8 voisins

        T = sum(unique(voisins)>1); % pas 0 car 0 c'est partage des eaux, et 1 pixel non traité
        % unique renvoie une liste avec les valuers sans repeter.
        if T==0
            L(x+1,y+1) = compteur;
            compteur = compteur+1;
        end
        if T==1 % On a que 1 seule valeur partageé dans les 8 voisins
            L(x+1, y+1) = max(voisins);
        end
        if T>1
         L(x+1, y+1) = 0;
        end
    end
end
             
                 
               
               
                
