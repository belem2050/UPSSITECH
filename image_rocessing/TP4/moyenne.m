function moy = moyenne(I,p)
s = size(I);
somme =0;
cpt =0;
for i=1: s(1)
    for j=1:s(2)
        if I(i,j) == p
            somme = somme + I(i,j);
            cpt =cpt +1;
        end
    end
end
moy = somme /cpt;
end
            
            
