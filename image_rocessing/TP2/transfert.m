function transfert(t)
s=size(t);
m=double(zeros(s(1),3));
m(:,1)=t(:);
m(:,2)=t(:);
m(:,3)=t(:);
m=m/255
colormap(m);
