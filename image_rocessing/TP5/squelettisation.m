function squelette = squelettisation(img, S)
 s = size(img);
 squelette = zeros(s(1), s(2));
 while sum(sum(img))~=0
     erosion = imerode(img, S);
     dilatation =  imdilate(erosion, S);
     res = img - dilatation;
     img = erosion;
     squelette = squelette + res;
 end

end