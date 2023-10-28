function a = alpha(listecontour, indice, img)
[xo, yo] = barycentre(img);
xmo=(xo-listecontour(indice, 1));
ymo=(yo-listecontour(indice, 2));
if ymo>0
    a=atan(xmo/ymo);
else
    if ymo<0
        a=-atan(xmo/ymo);
    else
        if xmo>0
            a=pi/2;
        else
            a=-pi/2;
        end
    end
end