clc;
close all;

I1 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP1\couleurs.bmp')); %Double car sinon erreurs car imread matrice non signé
I2bn = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP1\feuilles bn.jpg'));
%I2 image en noir et gris, on fait une autre image en 3 couleurs et on copy
%paste le mêmes valeurs de l'image
I2(:,:,1) = I2bn(:,:);
I2(:,:,2) = I2bn(:,:);
I2(:,:,3) = I2bn(:,:);

I3 = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP1\feuilles couleur.jpg'));
LUT=LutSubSamp(32) %nombre de couleurs de la LUT 8 exo1, 32 exo11, 8 exo2.
nbCouleurs = 32;

% %------------------------------------------------
% % QUANTIFICATION EXO 1
% %------------------------------------------------
% tic % compter le temps de traitement
% I1quantif = quantif(I1, LUT, nbCouleurs);
% toc % Elapsed time is 0.016537 seconds.
% tic
% I2quantif = quantif(I2, LUT, nbCouleurs);
% toc
% tic
% I3quantif = quantif(I3, LUT, nbCouleurs);
% toc

%------------------------------------------------
% QUANTIFICATION EXO 2 FLOYD ET STEINBERG
%------------------------------------------------
tic
I1Floyd = floydSteinberg(I1, LUT, nbCouleurs);
toc
tic
I2Floyd = floydSteinberg(I2, LUT, nbCouleurs);
toc
tic
I3Floyd = floydSteinberg(I3, LUT, nbCouleurs);
toc

subplot(3,2,1);
image(uint8(I1));

subplot(3,2,2);
image(uint8(I1Floyd));

subplot(323);
image(uint8(I2));

subplot(324)
image(uint8(I2Floyd));

subplot(325);
image(uint8(I3));

subplot(326)
image(uint8(I3Floyd));

EQMimgOrig_I1 = immse(I1, I1Floyd);
EQMimgOrig_I2 = immse(I2, I2Floyd);
EQMimgOrig_I3 = immse(I3, I3Floyd);

fprintf('EQM imgOrig1 - I1 :  %d\n',EQMimgOrig_I1);
fprintf('EQM imgOrig2 - I2 :  %d\n',EQMimgOrig_I2);
fprintf('EQM imgOrig3 - I3 :  %d\n',EQMimgOrig_I3);




% %-------------------------------------------------------
% % VISUALISATION EXO 1 LUT (Config 8 ou 32 couleurs)
% %-------------------------------------------------------
% subplot(3,2,1);
% image(uint8(I1));
% 
% subplot(3,2,2);
% image(uint8(I1quantif)); %NOT imshow(I) TOUJOURS caster in uint8
% 
% subplot(323);
% image(uint8(I2));
% 
% subplot(324)
% image(uint8(I2quantif));
% 
% subplot(325);
% image(uint8(I3));
% 
% subplot(326)
% image(uint8(I3quantif));

% EQMimgOrig_I1 = immse(I1, I1quantif);
% EQMimgOrig_I2 = immse(I2, I2quantif);
% EQMimgOrig_I3 = immse(I3, I3quantif);
% 
% fprintf('EQM imgOrig1 - I1 :  %d\n',EQMimgOrig_I1);
% fprintf('EQM imgOrig2 - I2 :  %d\n',EQMimgOrig_I2);
% fprintf('EQM imgOrig3 - I3 :  %d\n',EQMimgOrig_I3);


