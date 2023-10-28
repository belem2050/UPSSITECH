
function matrix = medianFiltre(img, M, N) 
%M-N = toujours impaires
s = size(img);

matrix = img;

for i=1:s(1)-((M+1)/2)
    for j=1:s(2)-((N+1)/2)
        intensitesOrdonees = sort(reshape(img(i:i+M-1, j:j+N-1), 1, []));
        valueMedian = intensitesOrdonees(((length(intensitesOrdonees)+1)/2));
        
        matrix(i+round(M/2), j+round(N/2))= valueMedian;
    end
end
        
        

