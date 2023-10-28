function Q=quantif(Img, LUT, nbCouleurs)
Q = Img;
s = size(Img);
for i=1:s(1)
    for j=1:s(2)
        d=inf;
        for k=1:nbCouleurs %couleurs de la LUT
            d2=abs(Img(i,j,1)-LUT(k,1)) + abs(Img(i,j,2)-LUT(k,2)) + abs(Img(i,j,3)-LUT(k,3));
            if d2<d
                d=d2;
                indice=k;
            end
        end
        Q(i,j,1)=LUT(indice,1);
        Q(i,j,2)=LUT(indice,2);
        Q(i,j,3)=LUT(indice,3);
    end
end

