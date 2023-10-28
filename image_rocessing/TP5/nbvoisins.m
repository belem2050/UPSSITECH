function combien = nbvoisins(squelette1,x,y)
voisins = reshape(squelette1(x-1:x+1,y-1:y+1),1,[]);
voisins = [voisins(1:4), voisins(6:9)]; % On s'en fiche de la valeur d'au milieu, on prend les 8 voisins
combien = sum(voisins==1);