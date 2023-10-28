clc;
clear;
%%
I1 = double(imread('C:\Users\blm2844a\Documents\MATLAB\TP3\TP3I01.jpg'));

%image((I1))
coins = edge(I1,'Prewitt',10);
%coins = edge(I1);


s = size(coins);
figure;
imagesc(coins);
%image(uint8(I1))
ro =628;
%theta =628;

R = zeros(ro,theta);
error= 0.1;
vecteurs =[0];



for  p =1:ro
    for teta = 1:628
        for x=1:s(1)
            for y=1:s(2)
                if coins(x,y)~=0
                sigma = (x*cos(teta/100)+y*sin(teta/100) -p);
                if abs(sigma) < error
                    sigma =1;
                else
                    sigma =0;
                end
                vecteurs = [vecteurs sigma];
                end
            end
        end
        
           R(p,teta) = sum(vecteurs);
           vecteurs =[0];
                                  
    end
end

figure;
imagesc(log(R+1));
colormap(gray(256));

%%
% Reco





%% 
for rho =1:ro
    for theta =1:628
        for x=1:s(1)
            for y=1:s(2)
                if coins(x,y) ==1 && x ~=x1 && y ~=y1
                    if abs(x.cos(theta/100) + y.sin(theta/100) - rho) < error
                        x2,y2 = x,y ;
                        hold on;
                        plot([y1 y2],[x1 x2],'-w');
                    end
  
                end
      
            end
            
        end       
    end
        
end
    
%%
Random = double(imread('C:\Users\blm2844a\Documents\MATLAB\TP3\TP3I02.png'));


       
figure;
imagesc(Random);
colormap(gray(256));

s2 = size(Random);

Image =zeros(468,500);

vecteurs =[0];

for x=1:468
    for y =1:500
       
            for t=1:s2(2)
                if round(x*cos(t/100)+y*sin(t/100)) < s2(1)-1
                    if round(x*cos(t/100)+y*sin(t/100)) >1
                        vecteurs = [vecteurs, Random(round(x*cos(t/100)+y*sin(t/100)),t)];
                    end
                
                end
            end
                    
       
        Image(x,y) = sum(vecteurs);
        vecteurs =[0];
    end
end


figure;
imagesc(Image);
colormap(gray(256));

%% IV













