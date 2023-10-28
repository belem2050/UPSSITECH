

## Author: groth <groth@BELEMMOUMOUNI>
## Created: 2022-11-29

function lbp = LBP (Point)

  s =size(img);
 % descripteurs = [];
  p = 3;
  I = img;
   %lbp =0;

  descripteurs = [];
  signe = zeros(p,p);

  for ligne= int8(p/2) :s(1)-int8(p/2)+1

    for colonne =int8(p/2):s(2)- int8(p/2)+1
      %A = [i-int8(p/2)+1:i+ int8(p/2)-1]
      %B = [j-int8(p/2)+1:j+ int8(p/2)-1]
     % B = [j-p/2:j-1, j+1 :j+p/2]
      %ponderations(i,j) =0;

      vecteurs = []
      for ligne = A

        for colonne = B
            if Point <  Point(ligne,colonne);
              signe(ligne,colonne) = 1
            elseif Point == Point(ligne,colonne);
             signe(ligne,colonne) = 1;
            else
             signe(ligne,colonne) = 0;
            end
          %signe(ligne,colonne) = img(ligne, colonne);
         end
       endfor


        si = size(signe);

        vecteurs = [ signe(1,:), rot90(signe(2:si(1), si(2))), rot90(rot90(signe(si(1),1:si(2)-1))), rot90(rot90(signe(2:si(1)-1,1)))]

        for k =1:p
          vecteurs = [vecteurs signe(k,:)]
        endfor



        vecteurs = [vecteurs(1,1:int8(p*p/2)-1),vecteurs(1,int8(p*p/2)+1:p*p)]
        %vecteurs =[vecteurs 0]
         for indice = 1:p*p-1
           descripteurs =  [descripteurs, 2^(indice-1)* vecteurs(1,indice)]
         endfor
         lbp = sum(descripteurs);

      %I(i/2,j/2) = lbp
      %return lbp
     endfor
   endfor

endfunction
