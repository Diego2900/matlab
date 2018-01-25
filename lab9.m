 w=logspace(-2,2,10000);
% for n=1:5
% [a b] = cheby1(n,3,1,'high', 's');
% h=freqs(a,b,w);
% hold on
% grid on
% loglog(w,abs(h));
% end
% 
% for n=1:5
% w_s1 = [0.01 0.02 0.1];
% [h,w]=freqs(b,a,w_s1);
% L=-20*log10(abs(h));
% x(n)=L(3)-L(1);
% y(n)=L(2)-L(1);
% end
wp=[2 4];
ws=[1 8];
ap=3;
as=50;
n1=buttord(wp,ws,ap,as,'s');
n2=cheb1ord(wp,ws,ap,as,'s');
n3=cheb2ord(wp,ws,ap,as,'s');
n4=ellipord(wp,ws,ap,as,'s');
[a b] = butter(n1,wp,'s');
h=freqs(a,b,w);
grid on
loglog(w,abs(h));
hold on
[a b] = cheby1(n2,ap,wp,'s');
h=freqs(a,b,w);
loglog(w,abs(h));
[a b] = cheby2(n3,as,ws,'s');
h=freqs(a,b,w);
loglog(w,abs(h));
[a b] = ellip(n4,ap,as,wp,'s');
h=freqs(a,b,w);
loglog(w,abs(h));
x=[0.01,ws(1),ws(1)];
y=[10^(as/(-20)),10^(as/(-20)),100000];
plot(x,y,'r','LineWidth',2);
x=[wp(1),wp(1),wp(2),wp(2)];
y=[0.0000001,10^(ap/(-20)),10^(ap/(-20)),0.0000001];
plot(x,y,'r','LineWidth',2);
x=[ws(2),ws(2),100];
y=[100000,10^(as/(-20)),10^(as/(-20))];
plot(x,y,'r','LineWidth',2);

