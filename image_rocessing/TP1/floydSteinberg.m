function B = floydSteinberg(Img, LUT, nbCouleurs)
Q = Img;
s = size(Img);
B = Img;
for i=2:s(1)-1
    for j=2:s(2)-1
        d=inf;
        for k=1:nbCouleurs %couleurs de la LUT
            d2=abs(Img(i,j,1)-LUT(k,1)) + abs(Img(i,j,2)-LUT(k,2)) + abs(Img(i,j,3)-LUT(k,3));
            if d2<d
                d=d2;
                indice=k;
            end
        end
        Q(i,j,:)=LUT(indice,:);
        
        erreur = Img(i,j,:)-Q(i,j,:);
        
    %if i<s(1)-1 && j<s(2)-1 && j>2
        B(i,j+1,:)= B(i,j+1,:)+erreur*7/16 ;
        B(i+1,j-1,:)= B(i+1,j-1,:)+erreur*3/16 ; 
        B(i+1,j,:)= B(i+1,j,:)+erreur*5/16 ; 
        B(i+1,j+1,:)= B(i+1,j+1,:)+erreur*1/16 ;
    %end
    end
end



