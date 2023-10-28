close all;
clear;
I1 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP3\image1.jpg')); %Double car sinon erreurs car imread matrice non signé
I2 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP3\I2.jpg')); %Double car sinon erreurs car imread matrice non signé
I2 = I2(:,:,1);
I3 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP3\I3.jpg')); %Double car sinon erreurs car imread matrice non signé
I4 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP3\I4.jpg')); %Double car sinon erreurs car imread matrice non signé

%% IMAGE BRUITEE
% I1bruit = bruit(I1, 10000);
% figure();
% image(uint8(I1bruit));
% colormap(gray(256)); %Pour afficher en noir et gris on change la LUT par défaut et on met le même couleur dans les 3 couleurs RGB

%% FILTRE MEDIAN
% I1filtreMed = filtreMedian(I1bruit);
% 
% figure();
% image(uint8(I1filtreMed));
% colormap(gray(256));

%% EXEMPLE AVEC UNE AUTRE IMAGE (BRUIT + FILTRE MEDIAN)
% I2bruit = bruit(I2, 10000);
% figure();
% image(uint8(I2bruit));
% colormap(gray(256)); %Pour afficher en noir et gris on change la LUT par défaut et on met le même couleur dans les 3 couleurs RGB
% 
% I2filtreMed = filtreMedian(I2bruit);
% figure();
% image(uint8(I2filtreMed));
% colormap(gray(256));

%% EERREURS QUADRATIQUES
% EQMimgBruitee = immse(I1, I1bruit)
% EQMimgFiltree = immse(I1, I1filtreMed)
% 
% EQMimgBruitee2 = immse(I2, I2bruit)
% EQMimgFiltree2 = immse(I2, I2filtreMed)

%-------------------------------------------------------------------------

% Pour N = 10'000 l'EQM de limage original et l'image bruitee est trop
% grande et l'EQM de limage original et filtree est plus petit, alors ça
% veut dire qu'on garde l'image filtree
% 
% Pour N = 1'000 l'EQM de limage original et l'image bruitee est trop
% petit et l'EQM de limage original et filtree est plus grande, alors ça
% veut dire qu'on garde l'image bruitee
% 
% On s'interese à l'EQM pour faire le choix
% Le filtre median c'est plutôt pour identifier les contours et après faire
% une extraction des objets. Même s'ils ne sont pas nitides, les contours on
% peut bien les identifier. 
% 

%% MASQUE FLOU
% I3mf5 = masqueflou(I3,5);
% I3mf20 = masqueflou(I3,20);
% 
% figure()
% subplot(121)
% image(uint8(I3mf5));
% colormap(gray(256));
% title('COEF = 5')
% 
% subplot(122)
% image(uint8(I3mf20));
% colormap(gray(256));
% title('COEF = 20')

%% MASQUE FLOU COULEUR
I4mf = masqueflou(I4(:,:,1),30);
I4mf2 = masqueflou(I4(:,:,2),30);
I4mf3 = masqueflou(I4(:,:,3),30);

I4mf(:,:,2) = I4mf2;
I4mf(:,:,3) = I4mf3;
size(I4mf)

figure()
subplot(121)
image(uint8(I4));
title('Image original');

subplot(122);
image(uint8(I4mf));
title('Image masque flou');

%%
N = 1000:1000:10000;
EQMBruite = [];
EQMFiltree = [];

EQMBruite = [];
EQMFiltree = [];
for i=N
  ImageBruitee = bruit(I1,i);
  EQMBruite = [EQMBruite, immse(I1,ImageBruitee)];

  ImageFiltree = filtreMedian(ImageBruitee);
  EQMFiltree = [EQMFiltree, immse(I1, ImageFiltree)];

end
% EQMimgBruitee2 = immse(I2, I2bruit)

figure;
plot(EQMBruite, N)
hold on;
plot(EQMFiltree, N);
xlabel('EQM');
ylabel('N');
title("EQM");
legend('Image bruitée', 'Image filtrée');



