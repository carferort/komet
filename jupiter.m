%Program jupiter.m

%v=kometens begynnelsehastighet

v=input('v? (tips 0.95?): ');
alfa=input('Kometens begynnelsevinkel? (tips 137): ');
t=input('Hur lång tid ska simuleras? (tips 50): ');

%Ställ in toleransnivåerna för ODE beräkning
OPTIONS=odeset('AbsTol',1e-10,'RelTol',1e-7);

%Beräkna ODE
[t,xyv]=ode45('jupiter_f', [0,t], [1, 0, 0, 1, 2,0,v*cosd(alfa),v*sind(alfa)],OPTIONS);

%Beräkning av energin
i=1;
for s=2:length(xyv)
    rsk=sqrt(xyv(s,5).^2+xyv(s,6).^2);
    rjk=sqrt((xyv(s,1)-xyv(s,5)).^2+(xyv(s,2)-xyv(s,6)).^2);
    E=(xyv(s,7).^2+xyv(s,8).^2)/2-1/rsk-0.001/rjk;
    Ey(i,1)=E;
    i=i+1;
end
Ex=(1:length(Ey));

%Plotta kometens bana och energin

subplot(1,2,1);
plot(xyv(:,1),xyv(:,2),xyv(:,5),xyv(:,6),'-',xyv(end,1),xyv(end,2),'or',xyv(end,5),xyv(end,6),'og',0,0,'*y','MarkerSize',10);
title('En komet fångas av Jupiter');
set(gca,'YTickLabel',[],'XTickLabel',[],'Color',[0.8 0.8 0.8]) 
hleg1 = legend('jupiter','komet');
grid off
axis equal
subplot(1,2,2)
plot(Ex,Ey)

E_total=sum(Ey)/length(xyv);

%Visa den totala energin

disp(['Den totala energin är ', num2str(E_total), ' energienheter']);