function h = ellipse(mx,Px,color)
%ELLIPSE
%  Trace l'ellipse contenant 99% des réalisations d'une variable aléatoire
%  Gaussienne 2D de moyenne mx et de covariance Px.
%  -> color = 'b' ou 'g' ou 'r' ou 'm' ou ...
%     (cf. options de couleur dans plot par exemple)

k = 9.21;
%cf. sqrt(k)=1:39.4% , sqrt(k)=2:86.5% , sqrt(k)=2.447:95% , sqrt(k)=3:98.9%

Px = (Px+Px')/2;

[V,D]=eig(Px);

t=0:0.1:2*pi+0.1;

xx(1,:)=sqrt(k*D(1,1))*cos(t);
xx(2,:)=sqrt(k*D(2,2))*sin(t);

X=zeros(size(xx));
for i=1:length(xx)
    X(:,i)=V*xx(:,i)+mx;
end

h = patch(X(1,:),X(2,:),color,'edgecolor','none','facealpha',.2);
end
