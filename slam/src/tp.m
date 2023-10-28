clear all
close all
%% Initilisation
[N1,T,Z,F,Hfull,mX0,PX0,Qw,Rv,X] = simulationDonnees(0);
nbParticules = 100;

%% SIS
[X_estime, W_estime, P] = SIS1(N1,T,Z,F,Hfull,mX0,PX0,Qw,Rv,X, nbParticules);
%% AFFICHAGE

figure(1);

for i=1:N1
  axis([-6 6 -6 6]); hold on

  h(1)=ellipse(X_estime{1,i}(1:2,:),P{1,i}(1:2,1:2),'r');
    h(2)=plot(X_estime{1,i}(1,1),X_estime{1,i}(2,1),'+');
    h(3)=plot(X(1,i),X(2,i),'o');

    h(4)=ellipse(X_estime{1,i}(3:4,:),P{1,i}(3:4,3:4),'r');
    h(5)=plot(X_estime{1,i}(3,1),X_estime{1,i}(4,1),'+');
    h(6)=plot(X(3,i),X(4,i),'o');

    h(7)=ellipse(X_estime{1,i}(5:6,:),P{1,i}(5:6,5:6),'r');
    h(8)=plot(X_estime{1,i}(5,1),X_estime{1,i}(6,1),'+');
    h(9)=plot(X(5,i),X(6,i),'o');




    
    pause(0.3);delete(h)
   
end