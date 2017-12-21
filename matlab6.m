% kp=2349000;
% ki=200;
% kd=20;
% 
% A = [kd kp ki];
% B = [0.5 6+kd 10.01+kp ki];
% 
% C = [0.5 6 10.01 0];
kd=200;
A=[1 10 20 10];
C=[kd];
B=[1 10 20 10+kd];
% Odpowiedz(A,B); %skokowa
 Odpowiedz(A,B); %skokowa
