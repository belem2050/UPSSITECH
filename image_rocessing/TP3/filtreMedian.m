function Q=filtreMedian(Img)
Q = Img;
s = size(Img);
% on applique le filtre dans le miliu de l'image
% Tous les contours de l'image reste bruitées car on ne peux pas les
% traiter

for i=1:s(1)-4 %-4 car on ne peux pas appliquer le filtre sur toute l'image.
    for j=1:s(2)-4
        listDonnesMoy = sort(reshape(Q(i:i+4,j:j+4),[],1)); %sort  ordone de plus petit au plus grand [] jsp lignes,  mais 1 colonne
        Q(i+2,j+2) = listDonnesMoy(13); %car on a un filtre 5*5, 25/2 = int 13 % on change la valeur du centre du filtre
    end
end
end