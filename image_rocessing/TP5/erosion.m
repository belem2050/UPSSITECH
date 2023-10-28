function Img = erosion(I)
% I = image
% S= [ 0 1 0 ; 
%     1 1 1 ;
%     0 1 0 ];

s=size(I);
Img = I;
for i=2:s(1)-1
  for j=2:s(2)-1
      resultat = 255;
      %Structurant 
      r1 = I(i-1,j);
      r2 =I(i,j-1);
      min1 = min(r1,r2);
      r3 = I(i+1,j);
      r4 = I(i,j+1);
      min2 = min(r3,r4);
      resultat2 = min(min1, min2);
      resultat = min(resultat, resultat2);
      Img(i,j) = resultat;
  end
end

