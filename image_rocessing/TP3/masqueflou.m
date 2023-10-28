function I5 = masqueflou(Img,coef)

I1 = Img;                %initialisation
I2 = filtreMedian(I1);    % Filtrage passe-bas (CONVOLUTION)
I3 = I1 - I2;              % Images des hautes fréquences (MASQUE FLOU)
I4 = I3 * coef;              % Amplification des hautes freq par un coef multiplicatif (AMPLIF PARTIE NETTE)
I5 = I1 + I4;              % Image d'origine avec amplification des hautes freq (REPORT ELEM NETTES SUR L'IMAGE DE DEPART)

%Image final doit être compris entre 0 et 255
%On choisit de saturer

[largeur, hauteur] = size(I5);
for x=1:largeur
    for y=1:hauteur
        if I5(x,y)>255
            I5(x,y) = 255;
        end
        if I5(x,y)<0
            I5(x,y) = 0;
        end
    end
end

figure();
subplot(151)
image(uint8(I1));
colormap(gray(256));
title('Image de départ COEF = ', coef);


subplot(152);
image(uint8(I2));
colormap(gray(256));
title('Filtrage passe bas');


subplot(153);
image(uint8(I3));
colormap(gray(256));
title('Image haut frequences');

subplot(154)
image(uint8(I4));
colormap(gray(256));
title('Amplification parties nettes');


subplot(155);
image(uint8(I5));
colormap(gray(256));
title('Image final');
