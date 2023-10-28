function Q=bruit(Img, N)
Q = Img;
s = size(Img);
lignes=s(1)-1;
colonnes =s(2)-1;

for x=1:N
    Q((round(rand(1)*lignes))+1,(round(rand(1)*colonnes))+1) = 255;
    Q((round(rand(1)*lignes))+1,(round(rand(1)*colonnes))+1) = 0;   
end
end