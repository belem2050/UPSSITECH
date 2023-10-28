clear;
close all;

I1 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP2\I1.jpg')); %Double car sinon erreurs car imread matrice non signé
I2 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP2\I2.bmp'));
I3 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP2\I3.bmp'));

hist1 = histogramme(I1);
hist2 = histogramme(I2);
hist3 = histogramme(I3);


dynI1 = dynamique(I1);
dynI2 = dynamique(I2);
dynI3 = dynamique(I3);

histDynI1 = histogramme(dynI1);
histDynI2 = histogramme(dynI2);
histDynI3 = histogramme(dynI3);


egalI1 = egalisation(I1);
egalI2 = egalisation(I2);
egalI3 = egalisation(I3);

histEgalI1 = histogramme(egalI1);
histEgalI2 = histogramme(egalI2);
histEgalI3 = histogramme(egalI3);

%% FONCTION TRANSFERT
% figure()
% image(I1);
% colorbar;
% transfert(double([0:255]'));

%% FONCTION TRANSFERT 2
% % IMAGE 1
% a=1.8;
% palette=uint8(((double([0:255]')./255).^(1/a)).*255)
% image(I1);
% transfert(palette);
% hist1 = histogramme(I1);
% % IMAGE 2
% a=4;
% palette=uint8(((double([0:255]')./255).^(1/a)).*255)
% image(I2);
% transfert(palette);
% % IMAGE 3
% a=4;
% palette=uint8(((double([0:255]')./255).^(1/a)).*255)
% image(I3);
% transfert(palette);

%% FONCTION DE TRANSFER - IMPLEMENTATION DE LA DYNAMIQUE
% IMAGE 1
figure();
a=1.8;
palette=uint8(((double([min(min(I1)):max(max(I1))]')./255).^(1/a)).*255)
image(I1);
transfertDyn(palette);

figure();
image(I1);
transfert(palette);

a=4;
palette=uint8(((double([min(min(I2)):max(max(I2))]')./255).^(1/a)).*255)
figure();
image(I2);
transfertDyn(palette);

figure();
image(I2);
transfert(palette);

palette=uint8(((double([min(min(I3)):max(max(I3))]')./255).^(1/a)).*255)
figure();
image(I3);
transfertDyn(palette);

figure();
image(I3);
transfert(palette);


%% EXPANSION DE LA DYNAMIQUE
%-------------------------------------------------------------------------
% figure();
% 
% subplot(341);
% image(uint8(I1)); %Cette partie nous affiche une image en couleurs de la LUT par défaut de Matlab
% colormap(gray(256)); %Pour afficher en noir et gris on change la LUT par défaut et on met le même couleur dans les 3 couleurs RGB
% 
% subplot(342);
% bar(hist1);
% 
% subplot(343);
% bar(histDynI1)
% 
% subplot(344);
% image(uint8(dynI1));
% colormap(gray(256));
% 
% subplot(345);
% image(uint8(I2));
% colormap(gray(256));
% 
% subplot(346);
% bar(hist2);
% 
% subplot(347);
% bar(histDynI2);
% 
% subplot(348);
% image(uint8(dynI2));
% colormap(gray(256));
% 
% subplot(349);
% image(uint8(I3));
% colormap(gray(256));
% 
% subplot(3,4,10);
% bar(hist3);
% 
% subplot(3,4,11);
% bar(histDynI3);
% 
% subplot(3,4,12);
% image(uint8(dynI3));
% colormap(gray(256));

%% EGALISATION
%--------------------------------------------------------------------------
% % EGALISATION
% figure();
% subplot(321);
% image(uint8(egalI1));
% colormap(gray(256));
% 
% subplot(323);
% image(uint8(egalI2));
% colormap(gray(256));
% 
% subplot(325);
% image(uint8(egalI3));
% colormap(gray(256));
% 
% %---------------------------------------------------------------------
% % HISTOGRAMMES
% subplot(322);
% bar(histEgalI1);
% 
% subplot(324);
% bar(histEgalI2);
% 
% subplot(326);
% bar(histEgalI3);
