function N = compConexes(img) 
%img = image binaire
t = 0;
NCC1 = bweuler(img);
N = [];
while NCC1>0
    SE = strel('diamond', t);
    imgErode = imerode(img, SE);
    I = imreconstruct(imgErode, img);
    NCC2 = bweuler(I);
    t = t + 1;
    N(t) = NCC1 - NCC2;
    NCC1 = NCC2;
end
end