%Animering jupiter_movie.m

%Ställ in toleransnivåerna för ODE beräkning

OPTIONS=odeset('AbsTol',1e-10,'RelTol',1e-7);

%Begynnelsevillkor

v=0.95;
alfa=137;
raknare=1;

%Beräkna ODE
t=50;
for t=1:50
    [t,xyv]=ode45('jupiter_f', [0,t], [1, 0, 0, 1, 2,0,v*cosd(alfa),v*sind(alfa)],OPTIONS);
       
%Beräkning av energin

i=1;
for s=2:length(xyv)
    rsk=sqrt(xyv(s,5).^2+xyv(s,6).^2);
    rjk=sqrt((xyv(s,1)-xyv(s,4)).^2+(xyv(s,2)-xyv(s,5)).^2);
    E=(xyv(s,7).^2+xyv(s,8).^2)/2-1/rsk-0.001/rjk;
    Ey(i,1)=E;
    i=i+1;
end
Ex=(1:length(Ey));

%Plotta kometens bana och energin

subplot(1,2,1);
plot(xyv(:,1),xyv(:,2),xyv(:,5),xyv(:,6),'-',0.0761,0.9971,'ob',xyv(end,1),xyv(end,2),'ob',xyv(end,5),xyv(end,6),'ob',xyv(1,1),xyv(1,2),'om',xyv(1,5),xyv(1,6),'oc',0,0,'*y','MarkerSize',10, 'MarkerFaceColor','yellow');

title(['En komet fångas av Jupiter', num2str(alfa)]);
set(gca,'YTickLabel',[],'XTickLabel',[],'Color',[0.8 0.8 0.8])
hleg1 = legend('jupiter','komet');
grid off
axis equal
subplot(1,2,2)
plot(Ex,Ey)

M(raknare)=getframe;
raknare=raknare+1;
end


E_total=sum(Ey)/length(xyv);

%Visa den totala energin

disp(['Den totala energin är ', num2str(E_total), ' energienheter']);