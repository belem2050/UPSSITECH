function [listecontour, nbpoints]=contour(img)

% ALGORITHME  DE LA TORTUE

% 1. Initialisation
direction=1; % vers la droite
nbpoints=0;  % Nombre de points sur le contour

% 2. Recherche du premier pixel noir - on suppose qu'il y en a au moins 1
s=size(img);
imgcontour=img;
i=1;
j=1;
while (img(i,j)~=0)
   i=i+1;
   if i>s(1)
      i=1;
      j=j+1;
   end
end

% 3. Reperage du point_depart
p(1)=i;
p(2)=j;
point_depart(1)=i;
point_depart(2)=j;

% 4. direction_courante = direction
direction_courante = direction;

% 5. Sélectionner le voisin q de p dans la direction_courante indiquée par le code de freeman - on suppose qu'il existe
boucle=0;
while (~boucle)
   boucle=1;
   voisin=0;
   while (~voisin)
      voisin=1;
      q(1)=p(1);
      q(2)=p(2);
      switch direction_courante
      case 0
         q(2)=q(2)+1;
      case 1
         q(1)=q(1)-1;
         q(2)=q(2)+1;
      case 2
         q(1)=q(1)-1;
      case 3
         q(1)=q(1)-1;
         q(2)=q(2)-1;
      case 4
         q(2)=q(2)-1;
      case 5
         q(1)=q(1)+1;
         q(2)=q(2)-1;
      case 6
         q(1)=q(1)+1;
      case 7
         q(1)=q(1)+1;
         q(2)=q(2)+1;
      end  
     
      % 6. si q n'est pas un point de la région ou s'il n'est pas voisin d'un pixel blanc (connexité 4 V) ou s'il a deja ete identifie comme un point du contour alors
      if (double(img(q(1)-1,q(2)))+double(img(q(1)+1,q(2)))+double(img(q(1),q(2)-1))+double(img(q(1),q(2)+1))==0) | (img(q(1),q(2))~=0) | (imgcontour(q(1),q(2))==128)
        
         % Si ce n'est le point de depart alors changement de direction et retour en 5
         if ~((q(1)==point_depart(1)) & (q(2)==point_depart(2)))
            direction_courante = mod(direction_courante + 7 , 8); % On tourne dans le sens des aiguilles d'une montre
            voisin=0;
         end
      end
   end
 
   % 7. Marquer p comme etant un point du contour
   nbpoints=nbpoints+1;
   listecontour(nbpoints,1)=p(1);
   listecontour(nbpoints,2)=p(2);
 
   imgcontour(listecontour(nbpoints,1),listecontour(nbpoints,2))=128;
 
   % 8. direction = direction_courante
   direction = direction_courante;
   direction_courante=mod(direction_courante+3,8); % On cherchera le voisin suivant le plus "a gauche"
 
   % 9. p = q
   p(1)=q(1);
   p(2)=q(2);
 
   % 10. tant que p est different de point_depart alors retourner en 5
   boucle = (p(1)==point_depart(1))*(p(2)==point_depart(2));
end
