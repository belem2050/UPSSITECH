function [x0,y0] = barycentre(img)

s =size(img);

x0 = sum([1:s(1)])/s(1);
y0 = sum(1:s(2))/s(2);

end

