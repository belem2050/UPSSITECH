function b=beta(listecontour,img,indice)
s=size(listecontour);

% on recupere les coordonnées des points situés avant et apres sur le
% contour
if indice==1
    xprev=listecontour(s(1),1);
    yprev=listecontour(s(1),2);
else
    xprev=listecontour(indice-1,1);
    yprev=listecontour(indice-1,2);
end
if indice==s(1)
    xsuiv=listecontour(1,1);
    ysuiv=listecontour(1,2);
else
    xsuiv=listecontour(indice+1,1);
    ysuiv=listecontour(indice+1,2);
end

% On calcule l'angle de la tangente
if yprev==ysuiv
    angle=pi/2;
else
    angle=atan((xsuiv-xprev)/(ysuiv-yprev));
end

% On calcule l'angle de la perpendiculaire à la tangente vers l'interieur
% de la forme

if (img(listecontour(indice,1)+round(sin(angle+pi/2)),listecontour(indice,2)+round(cos(angle+pi/2)))==1)
    b=mod(angle+pi/2,2*pi);
else
    b=mod(angle-pi/2,2*pi);
end