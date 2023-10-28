close;

imageInit = double(imread('\TP1\data\image1.jpg'));
%%
figure;
title('Lena Image');
% subplot(3,3,1);
% image(uint8(imageInit));
% colormap(gray(256));

spectre = fft2(imageInit);
repConv = fftshift(spectre);

%affichage
% subplot(3,3,2);
 imagesc(log(abs(repConv)));
% 
spectreInv = ifft2(fftshift(repConv));
imageFinale = abs(spectreInv);
colormap(gray(256));
% subplot(3,3,3);
image(uint8(imageFinale));
 colormap(gray(256));

EQM2 = EQM(imageInit, imageFinale);
%%
%3

s = size(imageInit);
n = 1;
EQMT = [];
PourcentCoefficients = [];
nombretotatCoef = s(1) *s(2);
while n < s(2)/2-1
    repConv(n,:) = 0;
    repConv(:,n) = 0;

    repConv(:,end - n+1)=0;
    repConv(end - n+1,:)=0;
    imageFiltre = ifft2(fftshift(repConv));

    EQM3 = EQM(abs(imageInit),abs(imageFiltre));
    EQMT = [EQMT EQM3];

    nbCoef = (nombretotatCoef - (s(1)- 2*n +1) * (s(2) - 2*n+1)) / s(1)*s(2);

    pourcentageCoef = nbCoef /nombretotatCoef;


    PourcentCoefficients = [PourcentCoefficients pourcentageCoef]
    n = n +1;
end
figure

subplot(1,2,1)
title('EQM %');

plot(EQMT);
subplot(1,2,2);
plot(PourcentCoefficients);

%%%2 1

%image01 = double(imread('bibimage\01.jpg'));
%%%2 2
%%
nbimg=50;
chemin='C:\Users\blm2844a\Documents\src\TraitementImage\TP1\bibimage\';
signature = zeros(nbimg,18);

for i=1:nbimg
   unite=num2str(mod(i,10));
   centaine=floor(i/100);
   dizaine=num2str(floor((i-centaine*100)/10));
   fichier=strcat(chemin,dizaine,unite)
   clear img;
   img = double(imread(fichier,'jpg'));

   imageGray = rgb2gray(img);
   repConv = fftshift(fft2(imageGray));
   coeffs = abs(repConv);
   vecteurImage = caracterisation(coeffs);
   signature(i,:) = vecteurImage;
end

 vecteurImage01 = signature(1,:);
 vecteurImage001 = vecteurImage01'
 distances = zeros(1,50);
 %% Image1
ImageChoisie = 46;

 for i = 1:50
     distance = sum(abs(signature(ImageChoisie,:)-signature(i,:)));
     distances(i) = distance;
 end
distanceMinimale = min([distances(:,1:ImageChoisie-1), distances(:,ImageChoisie+1:50)]);
indice =0;
for i =1:50
  if distanceMinimale == distances(1,i)
     indice = i;
  end
end
