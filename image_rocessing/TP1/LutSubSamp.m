function LUT=LutSubSamp(N)
L=[0 255 0 255 0 255];
n=1;
while n<N
    % search for the largest subspace
    volume=0;
    ibest=0;
    for i=1:n
        v=(L(i,2)-L(i,1))*(L(i,4)-L(i,3))*(L(i,6)-L(i,5));
        if v>volume
            volume=v;
            ibest=i;
        end
    end
    % Subspace extraction from the list
    SBS = L(ibest,:);
    if (n>1)
        if (ibest==1)
            L=L(2:n,:);
        else if (ibest==n)
                L=L(1:n-1,:);
            else L=[L(1:ibest-1,:) ; L(ibest+1:n,:)];
            end
        end
    else L=[];
    end
    % Search for the longest side
    dim = 1;
    if ((SBS(4)-SBS(3))>=(SBS(2)-SBS(1))) && ((SBS(4)-SBS(3))>=(SBS(6)-SBS(5)))
        dim = 2;
    end
    if ((SBS(6)-SBS(5))>=(SBS(2)-SBS(1))) && ((SBS(6)-SBS(5))>=(SBS(4)-SBS(3)))
        dim = 3;
    end
    % split in 2 and list update
    SBS1=SBS;
    SBS2=SBS;
    if dim==1
        SBS1(2)=round((SBS(1)+SBS(2))/2);
        SBS2(1)=SBS1(2);
    else if dim== 2
        SBS1(4)=round((SBS(3)+SBS(4))/2);
        SBS2(3)=SBS1(4);
        else 
        SBS1(6)=round((SBS(5)+SBS(6))/2);
        SBS2(5)=SBS1(6);
        end
    end
    L=[L ; SBS1 ; SBS2];
    % counter update
    n=n+1;
end
% LUT creation
LUT=zeros(N,3);
for i=1:N
    LUT(i,:)=[round((L(i,1)+L(i,2))/2) round((L(i,3)+L(i,4))/2) round((L(i,5)+L(i,6))/2)];
end



            
    
    
        