% Emula a reconsttru��o do sinal anal�gico a partir de suas amostras no
% tempo. Usa a interpola��o por sincs, que corresponde ao uso do filtro
% passa-baixas na frequ�ncia.
% Autor: Edmar Candeia Gurj�o
% Vers�o: 18/04/2019

clear all

% Frequencias do sinal
Fc1 = 10;
Fc2 = 20;

%Frequencia de amostragem
Fs = 120;
T = 1/Fs;

% Frequ�ncia para gerar uma base de tempo bem maior do que a amostragem
% Tem como objetivo mostrar a aproxima��o dos valores fora dos instantes
% de amostragem
F = 10000;
t = 0:1/F:1; % the time-samples for "continuous" plotting

% Instantes de tempo das amostras
ts = 0:T:0.5;  

% Gerando amostras do sinal origianal
x = @(t) sin(2*pi*Fc1*t);% + cos(2*pi*Fc2*t); 
sinal = x(ts);  % a seque�ncia de amostraas

stem(ts, sinal);

%% Usa fun��es sinc para recuperar o sinal original. 
%  Para emular o tempo cont�nuo, s�o geradas v�rias amostras do sinal
%  recuperado pelas sincs. Aumentando F, gera-se mais amostras se
%  aproximando mais do tempo cont�nuo.

interpolado = 0;

for n=1:length(ts)
    % n-1 devido a indexa��o no Matlab iniciar em 1
    interpolado = interpolado + sinal(n) * sinc((t-(n-1)*T)/T);
end

%plot(t, x(t), 'r', 'linewidth', 3); hold on;  % desenha o sinal "continuo"
stem(ts, sinal);  hold on; % Desenha as amostras tomadas em Ts
stem(t, interpolado, 'k') %Desenha as amostras obtidas pelas combina��es
                           % das sincs

%% Usa a fun�o de interpola��o do MATALB para interploar amostras
% 
% tempo = -0.25:1/(4*Fs):0.25;
% 
% sinal_interpolado_linear = interp1(t, sinal, tempo);
% 
% sinal_interpolado_spline = interp1(t, sinal, tempo,'spline');
% 
% stem(tempo, sinal_interpolado_linear)
% 
% hold on
% 
% stem(tempo, sinal_interpolado_spline)
