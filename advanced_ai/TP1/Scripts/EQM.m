



function   eqm = EQM(image1,image2)
erreur = mean(((double(image1) - double(image2)).^2));
eqm = mean(erreur);
end

