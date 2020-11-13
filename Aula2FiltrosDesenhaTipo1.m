%
% Exemplo retirado do Livro de Paulo Diniz.
% Desenha a resposta ao impulso h(n) e a resposta em frequência
% do filtro tipo 1
%

clear all

M = 52; N = M+1;

Omega_p = 4; Omega_r = 4.2; Omega_s = 10;

kp = floor(N*Omega_p/Omega_s);
kr = floor(N*Omega_r/Omega_s);

A = [ones(1,kp+1) zeros(1,M/2-kr+1)];

k = 1:M/2;

for n=0:M
    h(n+1) = A(1) + 2*sum((-1).^k.*A(k+1).*cos(pi.*k*(1+2*n)/N));
end

h = h./N;

subplot(3,1,1)
stem(h);

subplot(3,1,2)
plot(abs(fft(h,1024)))

subplot(3,1,3)

%fase = atan2(imag(fft(h,1024)),real(fft(h,1024)));

% Eh necessário "desborar a fase para evitar os saltos a cada vez que os
% ângulos consecutivos atingem pi (característca da tangente). 
% Para isso usa-se a função urwrap

fase = unwrap(atan2(imag(fft(h,1024)),real(fft(h,1024))));
plot(fase)
%a = 1;
%fvtool(h,a)