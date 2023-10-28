function dyn=dynamique(Img)
imin=min(min(Img));
imax=max(max(Img));
S= size(Img);
dyn = Img;
for i =1: S(1)
    for j = 1:S(2)
        dyn(i,j) = floor(((Img(i,j) -imin)/(imax-imin)) *255);
    end
end
