close all; 
clear;

I2 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP6\I2.jpg')); %Double car sinon erreurs car imread matrice non signé
I2 = I2(:,:,1)>128;

I3 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP6\I3.jpg')); %Double car sinon erreurs car imread matrice non signé
I3 = I3(:,:,1)>128;

%% Appliquez une binarisation pour retenir les régions correspondant graines en éliminant un maximum de pixels de l'arrière-plan.
img = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP6\image1.jpg')); %Double car sinon erreurs car imread matrice non signé
seuil = 128;
bin = img(:,:,1)>seuil; %car image en 3 composants et on la veut en 1 (noir et blanc) gris = double(rgb2gray(uint8(img)));

figure()
subplot(121)
imagesc(img);
colormap(gray(256));
title('Image de depart');

subplot(122)
imagesc(bin);
colormap(gray(256));
title('Binarisation avec seuil=128');

%% POUR LE TP5--- DEBRUITAGE - Filtre median ( pour le bruit de type sel et poivre) Les contours sont bien preservées

% figure()
% imgSansBruit = medianFiltre(bin,3,3);
% imagesc(imgSansBruit);
% colormap(gray(256));


%% IMAGE DEBRUITEE
SE = strel('diamond', 1) %flat strucutring element 
ouverture = imopen(bin, SE);
fermeture = imclose(ouverture, SE);

figure()
subplot(121)
imagesc(bin);
colormap(gray(256));
title('Image binarisé');

subplot(122)
imagesc(fermeture);
colormap(gray(256));
title('Debruitage');
%% COMPOSANTES CONNEXES IMAGE DONNEE
bin = fermeture;
Nt = compConexes(bin);

figure();
bar(Nt);
title('Composantes connexes');

% diametre X
% nombre d'occurrence Y

%% COMPOSANTES CONNEXES IMAGE GENEREE PAINT
Nt2 = compConexes(I2);
Nt3 = compConexes(I3);

maxLocaux= find(islocalmax(Nt));
maxLocaux1 = find(islocalmax(Nt3));
maxLocaux2= find(islocalmax(Nt2));


figure();
subplot(221)
imagesc(I3);
colormap(gray(256));
title('Image binarisé');

subplot(222)
bar(Nt3);
hold on;
xline([maxLocaux1], 'r');
hold off;
title('Composantes connexes');

subplot(223)
imagesc(I2);
colormap(gray(256));

subplot(224)
bar(Nt2);
hold on;
xline([maxLocaux2],'r');
hold off;

%% MAXIMUMS LOCAUX
figure();
subplot(131)
bar(Nt);
hold on;
xline([maxLocaux],'r');
hold off;
title('Image 1');

subplot(132)
bar(Nt2);
hold on;
xline([maxLocaux1],'r');
hold off;
title('Image 2');


subplot(133)
bar(Nt3);
hold on;
xline([maxLocaux2],'r');
hold off;
title('Image 3');

%%
figure()
imagesc(bin);
colormap(gray(256));


%% MINIMUM LOCAUX

minLocaux = find(islocalmin(Nt));

imgBinDepart = fermeture;

% IMAGE DEBRUITEE
SE12 = strel('disk', 11) % diametre 12, radio 6
SE17 = strel('disk', 13) 


imgBinErodee12 = imerode(bin,SE12);
 figure()
 imagesc(bin)
 colormap(gray(256));
% figure()
% imagesc(imgBinErodee12)
% colormap(gray(256));
%
imgBinErodee17 = imerode(bin,SE17);

I12 = imreconstruct(imgBinErodee12,bin);
I17 = imreconstruct(imgBinErodee17,bin);
I1217 = I12 - I17;

RniveauGris12 = imreconstruct(I12*255, img);
RniveauGris17 = imreconstruct(I17*255, img);
RniveauGris1217 = imreconstruct(I1217*255, img);


figure();
imagesc(I12);
colormap(gray(256));
%%
figure();
subplot(131)
image(RniveauGris12);
colormap(gray(256));

subplot(132)
image(RniveauGris17);
colormap(gray(256));

subplot(133)
image(RniveauGris1217);
colormap(gray(256));

figure();
imagesc(bin);
colormap(gray(256));