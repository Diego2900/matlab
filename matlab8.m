xC=1;
xL=1;
xR=1;
A=[0, 1/xC;(-1/xL), -xR/xL];
B=[0 ; 1/xL];
C=[-1, -xR];
D=[1];
%zmienne(A,B,C,D,2);

z=[1 1 1];
wynik = roots(z);
