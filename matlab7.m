%  x=[0:20];
%  y1=sin(x/20*2*pi);
%  x2=[0:79];
%  y2=[y1 y1 y1 y1];
% % p=showDiscr(x,y1); zeros
% iks=[0:3];
% % x=[1 1 -1 -1];
% subplot(3,1,1);
% showDiscr(x,y1+zeros(1,1));
% y=fft(y1);
% a=fftshift(y);
% title sygnał;
% subplot(3,1,2);
% showDiscr(x,abs(a));
% title fft;
% z=ifft(y);
% subplot(3,1,3);
% showDiscr(x,z);
% title inv;

f=[1 1 -1 -1];
g=[-2 0 1];
h=conv(f,g);
i=conv(g,f);
