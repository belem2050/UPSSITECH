function hist=histogramme(Img)
hist = (1:256);
for k=1:256 %intensité
    hist(k) = sum(sum(Img==k));

end

            
            