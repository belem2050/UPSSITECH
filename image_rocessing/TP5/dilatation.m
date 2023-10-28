function Img = dilatation(I)
% I = image
% S= [ 0 1 0 ; 
%     1 1 1 ;
%     0 1 0 ];
s=size(I);
Img = I;
for i=2:s(1)-1
  for j=2:s(2)-1
      resultat = 0;
      %Structurant
      r1 = I(i-1,j);
      r2 =I(i,j-1);
      max1 = max(r1,r2);
      r3 = I(i+1,j);
      r4 = I(i,j+1);
      max2 = max(r3,r4);
      resultat2 = max(max1, max2);
      resultat = max(resultat, resultat2);
      Img(i,j) = resultat;
  end
end

