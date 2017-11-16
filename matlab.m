# matlab
% subplot(2,1,1);
% x=[0:0.1:4*pi];
% y=sin(x+pi/4);
% funkcja(x,y);
% subplot(2,1,2);
% a=[0:0.1:10];
% b=a*a;
% plot(a,b,'c');

% 
% rownomierny=rand(100000,1);
% hist((rownomierny*2)-1,50);

% gauss=randn(100000,1);
% subplot(2,1,1);
% hist((gauss-2),10000);
% subplot(2,2,3);
% hist(0.5*gauss-2,10000);
% c=[0:0.1:5];
% d=2*c;
% subplot(2,2,4);
% plot(c,d);

a=[1 1 -1 0 -1];
b=[1 0 -1 1];
c=[1 -1 1 0 0 -1];
e=deconv(conv(a,c),b);
f=polyder(e);
h=[1 0 0 0];
g=max([length(f), length(a), length(h)]);
x=[zeros(1,g-length(f)) f];
y=[zeros(1,g-length(a)) a];
z=[zeros(1,g-length(h)) h];
g=x+y-z;
t=[-1:0.1:1];
r=polyval(g,t);
plot(t,r);


%funkcja.m
function [] = funkcja(x,y)
%FUNKCJA Summary of this function goes here
%   Detailed explanation goes here
i=(max(x)-min(x))/10;
j=(max(y)-min(y))/10;
plot(x,y,'m');
title sinus;
xlabel w;
ylabel sin(w+pi/4);
axis([min(x)-i, max(x)+i, min(y)-j, max(y)+j]);
end

