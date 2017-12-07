%  p=[4 1 1];
%  r = roots(p);
 
 t=[0:0.1:30];
%  h=1/4*t.*exp(-t/2);
%  plot(t,h);
%  hold on;
%  g=1/3*(exp(-t/4)-exp(-t));
%  plot(t,g);
%  hold off;
 l=[1 6 8];
  l2=[1 -2 -8];
   l3=[1 -6 8];
    l4=[1 2 -8];
 m=[1 2 3];  %l/m to transmitancja (H(s)
 x=roots(l);
 plot(real(x), imag(x), 'x');
 hold on;
 y=roots(l2);
 plot(real(y), imag(y), 'o');
 z=roots(l3);
 plot(real(z), imag(z), '+');
 a=roots(l4);
 plot(real(a), imag(a), 'p');
 hold off;
%  w=logspace(-2,2,1000);
 %  figure(3);
% freqs(l,m,w);
%a=Odpowiedz(l,m);
% b=BiegunyZera(l,m);



-----------------------------------------------------------------------------------------



%Funkcja wykresla odpowiedz impulsowa ukladu o zadanych liczniku i
%mianowniku transmitancji.
%
%  wywolanie: [f,ze,bi]=Odpowiedz(B,A)

%    B oraz A to wektory zawierajace kolejne wspolczynniki wielomianow
%    licznika i mianownika transmitancji, rozpoczynajace sie od
%    wspolczynnika przy najwyzszej potedze zmiennej s
%
%                                       B(s)  
%     gdzie transmitancja ukladu H(s)= ------
%                                       A(s)
%
%    Jako wynik funkcja daje: f - wektor odpowiedzi impulsowej
%                             ze - zera transmitancji
%                             bi - bieguny transmitancji

function [f,ze,bi]=Odpowiedz(a,b)
% Krzysztof Klimaszewski, 2006


% zmienna osie wybiera sposob skalowania osi wykresu polozenia zer i biegunow. Mozliwe
% wartosci: 0 - staly zakres x -10:10 i y -10:10
%           1 - zakres dopasowywany do danych, podaje wspolrzedne punktow
%           na wykresie
osie=0;

[A,B,C,D]=tf2ss(a,b)
t=0:0.001:50;
f=zeros(1,length(t));
for i=1:length(t)
    f(i)=C*expm(A*t(i))*B;
end
f(1)=f(1)+D;

%f - odpowiedz impulsowa

clf
subplot(2,1,1)
plot(t,f)
grid
xlabel('t')
title('ODPOWIEDZ IMPULSOWA')
subplot(2,1,2)
if ~isempty(roots(b))
    plot(real(roots(b)),imag(roots(b)),'rx')
    hold on
end
if ~isempty(roots(a))
    plot(real(roots(a)),imag(roots(a)),'bo')
end

disp('Zera transmitancji:')
ze=roots(a);
if isempty(ze)
    disp('Nie ma')
else
    disp(ze)
end

disp('Bieguny transmitancji:')
bi=roots(b);
disp(bi)


%set(gca,'XMinorTick','on')
%set(gca,'YMinorTick','on')

%set(gca,'XMinorGrid','on')
%set(gca,'YMinorGrid','on')

xlabel('Re')
ylabel('Im')
set(gca,'GridLineStyle','-')

if osie==1
    wart=[roots(a) ; roots(b)];
    set(gca,'Xtick',unique(sort([0 real(wart)'])))
    set(gca,'Ytick',unique(sort([0 imag(wart)'])))
    odstx=max(real(wart))-min(real(wart));
    odsty=max(imag(wart))-min(imag(wart));
    if (odstx~=0)&&(odsty~=0)
        axis([min(real(wart))-0.1*odstx max(real(wart))+0.1*odstx min(imag(wart))-0.1*odsty max(imag(wart))+0.1*odsty])
    elseif(odstx==0)&&(odsty~=0)
        if max(real(wart))==0
            axis([min(imag(wart))-0.1 max(imag(wart))+0.1 min(imag(wart))-0.1*odsty max(imag(wart))+0.1*odsty])
        else
            axis([min(real(wart))-0.1*abs(min(real(wart))) max(real(wart))+0.1*abs(max(real(wart))) min(imag(wart))-0.1*odsty max(imag(wart))+0.1*odsty])
        end
    elseif(odsty==0)&&(odstx~=0)
        if max(imag(wart))==0
            axis([min(real(wart))-0.1*odstx max(real(wart))+0.1*odstx min(real(wart))-0.1 max(real(wart))+0.1])
        else
            axis([min(real(wart))-0.1*odstx max(real(wart))+0.1*odstx min(imag(wart))-0.1*abs(min(imag(wart))) max(imag(wart))+0.1*abs(max(imag(wart)))])
        end
    else
        axis([min(real(wart))-0.1 max(real(wart))+0.1 min(imag(wart))-0.1 max(imag(wart))+0.1])
    end
else
    set(gca,'Xtick',[0])
    set(gca,'Ytick',[0])
    axis([-10 10 -10 10])
end
grid
title('POLOZENIE BIEGUNOW I ZER')
legend('biegun','zero',-1)



-----------------------------------------------------------------------------------------


% wywolanie: BiegunyZera(licznik transmitancji,mianownik transmitancji)
function q=BiegunyZera(licz,mian)
max=300
q=zeros(max,max);
a=10*([1:max]-max/2)/max;
b=10*([1:max]-max/2)/max;
for i=1:max
    c(:,i)=a';
end
for i=1:max
    c(i,:)=c(i,:)+j*b;
end
q=log(abs(polyval(licz,c)./polyval(mian,c)));
mesh(a,b,q)
ylabel('Re')
xlabel('Im')
pause
plot(a(max/2:max),q(max/2,max/2:max))
title('Charakterystyka amplitudowa')



