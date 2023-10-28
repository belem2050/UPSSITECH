
function Img =fusion(I)
  Img = I;
  s = size(I);
  
  for i=2: s(1)-1
    for j =2:s(2)-1
      p1 = I(i,j-1);
      p2 = I(i,j);
      p3 = I(i,j+1);
      moy1 = moyenne(Img,p1);
      moy3 = moyenne(Img,p3);
      moy = abs(moy1-moy3);
      if ((p1 ~=0) && (p3 ~=0)) && (p1 ~= p3) && (moy <20)
        [X Y V] = find(I==p3);
        for k=1:length(X)
            Img(X(k),Y(k)) = p1;
        end
      end
      
      p1 = I(i-1,j);
      p2 = I(i,j);
      p3 = I(i+1,j);
      moy1 = moyenne(Img,p1);
      moy3 = moyenne(Img,p3);
      moy = abs(moy1-moy3);
      if ((p1 ~=0) && (p3 ~=0)) && (p1 ~= p3) && (moy <20)
        [X Y V] = find(I==p3);
        for k=1:length(X)
            Img(X(k),Y(k)) = p1;
        end
      end
    end
  end
