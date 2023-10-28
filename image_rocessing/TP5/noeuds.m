function noeuds1 = noeuds(squelette1)
 sizeSq1 = size(squelette1);
 
 noeuds1=[];
 voisinsTout=[];
 [X Y V] = find(squelette1 == 1);
 d = size(X);
 for z=1:d
     x = X(z);
     y = Y(z);
     voisins = reshape(squelette1(x-1:x+1,y-1:y+1),1,[]);
     voisins = [voisins(1:4), voisins(6:9)]; % On s'en fiche de la valeur d'au milieu, on prend les 8 voisins
     combien = sum(voisins==1);
     
     if combien>2 % is noeud
         noeuds1 = [noeuds1; [x y]];
     end
 end
 