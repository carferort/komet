%Funktion jupiter_f.m

function xyvprim=jupiter_f(t,xyv);
%xyv=[xj,yj,vxj,vyj; xk,yk,vxk,vyk]
%xprim=vx; yprim=vy  vxprim=-x; vyprim=-y

xj=xyv(1,1);
yj=xyv(2,1);
vxj=xyv(3,1);
vyj=xyv(4,1);
xk=xyv(5,1);
yk=xyv(6,1);
vxk=xyv(7,1);
vyk=xyv(8,1);

rsk=sqrt(xk^2+yk^2);
rjk=sqrt((xj-xk)^2+(yj-yk)^2);

xyvprim(1,1)=vxj;
xyvprim(2,1)=vyj;
xyvprim(3,1)=-xj;
xyvprim(4,1)=-yj;
xyvprim(5,1)=vxk;
xyvprim(6,1)=vyk;
xyvprim(7,1)=(-xk)/(rsk^3)+0.001*(xj-xk)/(rjk^3);
xyvprim(8,1)=(-yk)/(rsk^3)+0.001*(yj-yk)/(rjk^3);
