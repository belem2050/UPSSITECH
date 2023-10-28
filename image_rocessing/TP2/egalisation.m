function egal = egalisation(img)
S= size(img);
egal = img;
Nbpixels = S(1) *S(2);
h = histogramme(img);
hc = zeros(1,256);
hc(1)=h(1);
for k=2:256
    hc(k) = hc(k-1)+ h(k);
end
    for i =1: S(1)
        for j = 1:S(2)
            egal(i,j) = floor(255*hc(img(i,j)+1)/(Nbpixels));
            
        end
    end
