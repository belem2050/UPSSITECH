close all;
clear;
img = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP5\image1.bmp')); %Double car sinon erreurs car imread matrice non signé
img = img(:,:,1)>1; %car image en 3 composants et on la veut en 1 (noir et blanc) gris = double(rgb2gray(uint8(img)));

imgNous = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP5\imageNous.png')); %Double car sinon erreurs car imread matrice non signé
imgNous = imgNous(:,:,1)>1;

I2 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP5\I2.png')); %Double car sinon erreurs car imread matrice non signé
I2 = I2(:,:,1);

%% ALGORITHME DE L'EROSION ULTIMATE (Squelettisation)
% Structurant en croix
S= [ 0 1 0 ; 
     1 1 1 ;
     0 1 0 ];
 figure();
 squelette1 = squelettisation(img, S);
 imagesc(squelette1)
 colormap(gray(256))
 
 figure();
 subplot(121);
 imagesc(imgNous);
 colormap(gray(256))
 title('Image original');
 
 subplot(122);
 squelette2 = squelettisation(imgNous, S);
 imagesc(squelette2)
 colormap(gray(256))
 title('Squelletisation');
 %% Algorithme pour reperer les noeuds et les extremites
coordNoeuds = noeuds(squelette1);
size(coordNoeuds)
 
coordNoeuds2 = noeuds(squelette2);
size(coordNoeuds2)

 
 %% GRADIENTS MORPHOMATEMATIQUES
 SE = strel('cube',3);
 erode = imerode(I2,SE);
 dilate = imdilate(I2,SE);
 Gi = I2-erode;
 Ge = dilate-I2;
 G = Ge + Gi;
 
 figure();
 subplot(141);
 imagesc(I2) 
 colormap(gray(256))
 title('Image de départ');
 
 subplot(142);
 imagesc(Gi);
 colormap(gray(256))
 title('Gradient interne');

 subplot(143);
 imagesc(Ge);
 colormap(gray(256))
 title('Gradient externe');
 
 subplot(144);
 imagesc(G);
 colormap(gray(256))
 title('Gradient symétrisé');

 
%% FONCTIONS ERODE DILATE
 erode = erosion(I2);
 dilate = dilatation(I2);
 Gi = I2-erode;
 Ge = dilate-I2;
 G = Ge + Gi;
 
  figure();
 subplot(141);
 imagesc(I2) 
 colormap(gray(256))
 title('Image de départ');
 
 subplot(142);
 imagesc(Gi);
 colormap(gray(256))
 title('Gradient interne');

 subplot(143);
 imagesc(Ge);
 colormap(gray(256))
 title('Gradient externe');
 
 subplot(144);
 imagesc(G);
 colormap(gray(256))
 title('Gradient symétrisé');
 
 