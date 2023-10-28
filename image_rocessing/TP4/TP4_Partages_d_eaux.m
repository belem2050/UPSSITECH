close all;
clear;

img = double(imread('G:\Mon Drive\UPSSITECH\S8\TI\TP4\image0.bmp')); %Double car sinon erreurs car imread matrice non signé
gris = double(rgb2gray(uint8(img)));

%% Prewitt estimation du gradient
Gx = conv2(gris, [1 1 1; 0 0 0; -1 -1 -1], 'same');
Gy = conv2(gris, [1 0 -1;1 0 -1; 1 0 -1], 'same');
G = abs(Gx) + abs(Gy); %% gradient

figure(); 
image(uint8(G));
colormap(gray(256));
title('Estimateur du gradient PREWITT');
%% Segmentation à l'aide de l'algorithme de partage des eaux
[L, compteur]=partageEaux(G);
compteur;

figure();
image(mod(L,256));
colormap(colorcube(256));
title('Ligne de partage des eaux');

%% FUSION HORIZONTAL
H = L(300:450,50:200);

FH=fusionH(H);
figure();
image(mod(FH,256));
colormap(colorcube(256));
title('Fusion Horizontal');
%% FUSION VERTICAL

FV = fusionV(FH);

figure();
image(mod(FV,256));
colormap(colorcube(256));
title('Fusion vertical');

%%
FH=fusionH(FV);
figure();
image(mod(FH,256));
colormap(colorcube(256));
title('Fusion Horizontal');
%%
FV = fusionV(FH);

figure();
image(mod(FV,256));
colormap(colorcube(256));
title('Fusion vertical');