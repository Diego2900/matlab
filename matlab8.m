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



%Funkcja wykresla odpowiedz skokowa ukladu o zadanych macierzach
%stanu.
%
%  wywolanie: f=zmienne_stanu2(A,B,C,D,ampl)
%   ampl- amplituda skoku jednostkowego
%    
function f=zmienne(A,B,C,D,ampl)
% Krzysztof Klimaszewski, 2006


[b,a]=ss2tf(A,B,C,D);
disp('Transmitancja:')
disp('licznik:')
disp(b)
disp('mianownik:');
disp(a)
t=0:0.01:100;
f=zeros(1,length(t));
for i=1:length(t)
    f(i)=C*(A^-1)*(expm(A*t(i))-eye(length(A)))*B*ampl+D*ampl;
end

----------------------------
zm_stanu=zeros(length(A),length(t));

for z=1:length(A)
        wybor_zmiennej=zeros(1,length(A));
        wybor_zmiennej(z)=1;
        for i=1:length(t)
            zm_stanu(z,i)=wybor_zmiennej*(A^-1)*(expm(A*t(i))-eye(length(A)))*B*ampl;
        end
end


clf
subplot(2,1,1)
plot(t,f)
grid
xlabel('t')
title('ODPOWIEDZ SKOKOWA')
subplot(2,1,2)
plot(t,zm_stanu')
grid
title('ZMIENNE STANU')
xlabel('t')
opisy=[];
for i=1:length(A)
    opisy=[opisy; sprintf('Zmienna %2d',i)];
end
legend(opisy,0)
