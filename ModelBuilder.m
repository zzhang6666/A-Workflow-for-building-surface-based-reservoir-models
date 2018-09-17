% Construction of a bilinearly blended Coons surface 
% 
 
%  D.M. Spink 
%  Copyright (c) 2000. 

%for the 20 connection nodes:
x1=0; y1=0; z1=2*5;
x2=1000; y2=0; z2=0;
x3=0; y3=500; z3=0;
x4=1000; y4=500; z4=0;
x5=0; y5=0; z5=100*5;
x6=1000; y6=0; z6=100*5;
x7=0; y7=500; z7=100*5;
x8=1000; y8=500; z8=100*5;
x9=0; y9=0; z9=60*5;
x10=1000; y10=0; z10=60*5;
x11=0; y11=500;z11=70*5;
x12=1000; y12=500;z12=60*5;
x13=300;y13=0;z13=60*5;
x14=1000;y14=0;z14=20*5;
x15=300;y15=500;z15=60*5;
x16=1000; y16=500;z16=20*5;
x17=700;y17=0;z17=60*5;
x18=1000;y18=0;z18=40*5;
x19=700;y19=500;z19=60*5;
x20=1000;y20=500;z20=40*5;
% Boundary curve 1 
pnts = [ x1  200  400  600 800 x2; 
         y1  0  0  0 0 y2;  
         z1  4*5  10*5  8*5 14*5  z2];    
crv1 = nrbmak(pnts, [0 0 0 1/3 0.5 2/3 1 1 1]); 
nrbplot(crv1,48); 
hold on;
% Boundary curve 2 
pnts= [ x3  250  500  750 x4; 
        y3 500 500 500 y4; 
        z3  10*5  16*5  12*5 z4]; 
crv2 = nrbmak(pnts, [0 0 0 1/3 2/3 1 1 1]); 
nrbplot(crv2,48); 
% Boundary curve 3 
pnts= [ x1 0 0 x3; 
        y1 200 400 y3; 
        z1 0 10*5 z3]; 
crv3 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv3,48);  
% Boundary curve 4 
pnts= [ x2 1000 1000 1000 x4; 
        y2   150  250  400 y4; 
        z2   6*5  6*5 10*5 z4]; 
crv4 = nrbmak(pnts, [0 0 0 0.25 0.75 1 1 1]); 
nrbplot(crv4,48);  

% Boundary curve 5 
pnts = [ x5  200  400  600 800 x6; 
         y5  0  0  0 0 y6;  
         z5  100*5  100*5  90*5 110*5  z6];    
crv5 = nrbmak(pnts, [0 0 0 1/3 0.5 2/3 1 1 1]); 
nrbplot(crv5,48); 

% Boundary curve 6 
pnts= [ x7  250  500  750 x8; 
        y7 500 500 500 y8; 
        z7  100*5  120*5  120*5 z8]; 
crv6 = nrbmak(pnts, [0 0 0 1/3 2/3 1 1 1]); 
nrbplot(crv6,48); 
% Boundary curve 7 
pnts= [ x5 0 0 x7; 
        y5 200 400 y7; 
        z5 110*5 100*5 z7]; 
crv7 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv7,48);  
% Boundary curve 8 
pnts= [ x6 1000 1000 1000 x8; 
        y6   150  250  400 y8; 
        z6   90*5  110*5 90*5 z8]; 
crv8 = nrbmak(pnts, [0 0 0 0.25 0.75 1 1 1]); 
nrbplot(crv8,48); 
% Boundary curve 9 
pnts= [ x9 100 200 x13; 
        y9 0 0 y13; 
        z9 70*5 66*5 z13]; 
crv9 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv9,48); 
% Boundary curve 10 
pnts= [ x11 100 200 x15; 
        y11 500 500 y15; 
        z11 66*5 70*5 z15]; 
crv10 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv10,48);  
% Boundary curve 11 
pnts= [ x9 x9 x9 x9 x11; 
        y9   150  250  400 y11; 
        z9   70*5  80*5 70*5 z11]; 
crv11 = nrbmak(pnts, [0 0 0 0.25 0.75 1 1 1]); 
nrbplot(crv11,48); 
% Boundary curve 12 
pnts= [ x13 x13 x13 x15; 
        y13   200  400  y15; 
        z13  70*5  60*5 z15]; 
crv12 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv12,48); 
% Boundary curve 13 
pnts= [ x13 450 600 x17; 
        y13 0 0 y17; 
        z13 50*5 50*5 z17]; 
crv13 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv13,48); 
% Boundary curve 14
pnts= [ x15 450 600 x19; 
        y15 500 500 y19; 
        z15 60*5 64*5 z19]; 
crv14 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv14,48); 
% Boundary curve 15
pnts= [ x17 x17 x17 x19; 
        y17 250 350 y19; 
        z17 64*5 64*5 z19]; 
crv15 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv15,48); 
% Boundary curve 16
pnts= [ x17 800 900 x10; 
        y17 0 0 y10; 
        z17 58*5 62*5 z10]; 
crv16 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv16,48); 
% Boundary curve 17
pnts= [ x19 800 900 x12; 
        y19 500 500 y12; 
        z19 58*5 56*5 z12]; 
crv17 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv17,48); 
% Boundary curve 18
pnts = [ x10  1000 1000 1000 1000 x12; 
         y10  100  200  300 400 y12;  
         z10  70*5 50*5 70*5 50*5  z12];    
crv18 = nrbmak(pnts, [0 0 0 1/3 0.5 2/3 1 1 1]); 
nrbplot(crv18,48); 
% Boundary curve 19
pnts= [ x17 800 900 x18; 
        y17 0 0 y18; 
        z17 56*5 42*5 z18]; 
crv19 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv19,48); 
% Boundary curve 20
pnts= [ x19 800 900 x20; 
        y19 500 500 y20; 
        z19 46*5 44*5 z20]; 
crv20 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv20,48); 
% Boundary curve 21
pnts= [ x18 x18 x18 x20; 
        y18 200 350 y20; 
        z18 44*5 36*5 z20]; 
crv21 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv21,48); 
% Boundary curve 22
pnts= [ x13 500 800 x14; 
        y13 0 0 y14; 
        z13 30*5 25*5 z14]; 
crv22 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv22,48); 
% Boundary curve 23
pnts= [ x15 500 800 x16; 
        y15 500 500 y16; 
        z15 58*5 46*5 z16]; 
crv23 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv23,48); 
% Boundary curve 24
pnts= [ x14 x14 x14 x16; 
        y14 200 400 y16; 
        z14 18*5 24*5 z16]; 
crv24 = nrbmak(pnts, [0 0 0 0.5 1 1 1]); 
nrbplot(crv24,48); 

srf1 = nrbcoons(crv1, crv2, crv3, crv4); 
srf2 = nrbcoons(crv5, crv6, crv7, crv8); 
srf3 = nrbcoons(crv9, crv10, crv11, crv12); 
srf4 = nrbcoons(crv13, crv14, crv12, crv15); 
srf5 = nrbcoons(crv16, crv17, crv15, crv18); 
srf6 = nrbcoons(crv22, crv23, crv12, crv24); 
srf7 = nrbcoons(crv19, crv20, crv15, crv21); 

%Draw the surfaces
nu=10;
nu2=20;
nv=20;
nrbplot(srf1,[nu2 nv]);
nrbplot(srf2,[nu2 nv]);
nrbplot(srf3,[nu nv]);
nrbplot(srf4,[nu nv]);
nrbplot(srf5,[nu nv]);
nrbplot(srf6,[nu2 nv]);
nrbplot(srf7,[nu nv]);

xh=xlabel('X (m)');
yh=ylabel('Y (m)');
zh=zlabel('Z (m)');
set([xh,yh, zh],'fontweight','bold','fontsize',18);

set(gca, 'FontSize', 18);
%title('Curves');
title('Surfaces');
 

%export the surface points

fileID = fopen('surfaces_papermesh.txt','w');

ut=linspace(0.0,1.0,nu);
ut2=linspace(0.0,1.0,nu2);
vt=linspace(0.0,1.0,nv);

fprintf(fileID,'%i \n', 7);


p=nrbeval(srf1,{ut2 vt});
fprintf(fileID, '%i %i \n', nu2, nv);
for j=1:nv
    for i=1:nu2
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end

p=nrbeval(srf2,{ut2 vt});
fprintf(fileID, '%i %i \n', nu2, nv);
for j=1:nv
    for i=1:nu2
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end

p=nrbeval(srf3,{ut vt});
fprintf(fileID, '%i %i \n', nu, nv);
for j=1:nv
    for i=1:nu
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end

p=nrbeval(srf4,{ut vt});
fprintf(fileID, '%i %i \n', nu, nv);
for j=1:nv
    for i=1:nu
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end

p=nrbeval(srf5,{ut vt});
fprintf(fileID, '%i %i \n', nu, nv);
for j=1:nv
    for i=1:nu
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end

p=nrbeval(srf6,{ut2 vt});
fprintf(fileID, '%i %i \n', nu2, nv);
for j=1:nv
    for i=1:nu2
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end

p=nrbeval(srf7,{ut vt});
fprintf(fileID, '%i %i \n', nu, nv);
for j=1:nv
    for i=1:nu
       fprintf(fileID, '%6.3f %6.3f %6.3f\n', p(:,i,j));
    end
end
% export PSLG for front: (assemble segments left->right, bottom->top
xvec=[x1 x2 x5 x6 x9 x14 x18 x10 x13 x17];
yvec=[y1 y2 y5 y6 y9 y14 y18 y10 y13 y17];
zvec=[z1 z2 z5 z6 z9 z14 z18 z10 z13 z17];
nnode=length(xvec);
seg=[1 5 5 3 2 6 6 7 7 8 8 4];

p=nrbeval(crv1,ut2);
for i=2:nu2-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,1]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu2-1
         seg=[seg,nnode];
         seg=[seg,2];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end


p=nrbeval(crv5,ut2);
for i=2:nu2-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,3]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu2-1
         seg=[seg,nnode];
         seg=[seg,4];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv9,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,5]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,9];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv13,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,9]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,10];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv16,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,10]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,8];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv19,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,10]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,7];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv22,ut2);
for i=2:nu2-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,9]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu2-1
         seg=[seg,nnode];
         seg=[seg,6];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end
nseg=length(seg)/2;
fileID = fopen('pslg.txt','w');
fprintf(fileID,'%i \n', 4);
fprintf(fileID, '%i %i \n', nnode, nseg);
for i=1:nnode
    fprintf(fileID, '%6.3f %6.3f %6.3f\n', xvec(i), yvec(i), zvec(i));
end
for i=1:nseg
    fprintf(fileID, '%i %i\n', seg(i*2-1), seg(i*2));
end


% export PSLG for back: (assemble segments left->right, bottom->top
xvec=[x3 x4 x7 x8 x11 x16 x20 x12 x15 x19];
yvec=[y3 y4 y7 y8 y11 y16 y20 y12 y15 y19];
zvec=[z3 z4 z7 z8 z11 z16 z20 z12 z15 z19];
nnode=length(xvec);
seg=[1 5 5 3 2 6 6 7 7 8 8 4];

p=nrbeval(crv2,ut2);
for i=2:nu2-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,1]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu2-1
         seg=[seg,nnode];
         seg=[seg,2];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end


p=nrbeval(crv6,ut2);
for i=2:nu2-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,3]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu2-1
         seg=[seg,nnode];
         seg=[seg,4];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv10,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,5]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,9];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv14,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,9]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,10];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv17,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,10]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,8];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv20,ut);
for i=2:nu-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,10]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nu-1
         seg=[seg,nnode];
         seg=[seg,7];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv23,ut2);
for i=2:nu2-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,9]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1]; 
     elseif i==nu2-1
         seg=[seg,nnode];
         seg=[seg,6];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end
nseg=length(seg)/2;

fprintf(fileID, '%i %i \n', nnode, nseg);
for i=1:nnode
    fprintf(fileID, '%6.3f %6.3f %6.3f\n', xvec(i), yvec(i), zvec(i));
end
for i=1:nseg
    fprintf(fileID, '%i %i\n', seg(i*2-1), seg(i*2));
end


% export PSLG for left: (assemble segments left->right, bottom->top
xvec=[x1 x3 x9 x11 x5 x7];
yvec=[y1 y3 y9 y11 y5 y7];
zvec=[z1 z3 z9 z11 z5 z7];
nnode=length(xvec);
seg=[1 3 3 5 2 4 4 6];

p=nrbeval(crv3,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)]; %#ok<*AGROW>
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,1]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,2];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end


p=nrbeval(crv11,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,3]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,4];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv7,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,5]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,6];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end


nseg=length(seg)/2;

fprintf(fileID, '%i %i \n', nnode, nseg);
for i=1:nnode
    fprintf(fileID, '%6.3f %6.3f %6.3f\n', xvec(i), yvec(i), zvec(i));
end
for i=1:nseg
    fprintf(fileID, '%i %i\n', seg(i*2-1), seg(i*2));
end

% export PSLG for right: (assemble segments left->right, bottom->top
xvec=[x2 x4 x14 x16 x18 x20 x10 x12 x6 x8];
yvec=[y2 y4 y14 y16 y18 y20 y10 y12 y6 y8];
zvec=[z2 z4 z14 z16 z18 z20 z10 z12 z6 z8];
nnode=length(xvec);
seg=[1 3 3 5 5 7 7 9 2 4 4 6 6 8 8 10];

p=nrbeval(crv4,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,1]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,2];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end


p=nrbeval(crv24,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,3]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,4];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv21,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,5]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,6];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv18,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,7]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,8];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

p=nrbeval(crv8,vt);
for i=2:nv-1
     xvec=[xvec,p(1,i)];
     yvec=[yvec,p(2,i)];
     zvec=[zvec,p(3,i)];
     nnode=nnode+1;
     if i==2
         seg=[seg,9]; 
         seg=[seg,nnode];
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     elseif i==nv-1
         seg=[seg,nnode];
         seg=[seg,10];
     else
         seg=[seg,nnode];
         seg=[seg,nnode+1];
     end
end

nseg=length(seg)/2;

fprintf(fileID, '%i %i \n', nnode, nseg);
for i=1:nnode
    fprintf(fileID, '%6.3f %6.3f %6.3f\n', xvec(i), yvec(i), zvec(i));
end
for i=1:nseg
    fprintf(fileID, '%i %i\n', seg(i*2-1), seg(i*2));
end