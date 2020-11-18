clear all

M = 104; N = M+1;


Omega_p = 4; Omega_r = 4.2; Omega_s = 10;

kp = floor(N*Omega_p/Omega_s);
kr = floor(N*Omega_r/Omega_s);

A = [ones(1,kp+1) zeros(1,M/2-kr+1)];

if mod(kp+kr,2)==0
    A = [A 0];
end

k = 1:M/2;

for n=0:M
    h(n+1) = A(1) + 2*sum((-1).^k.*A(k+1).*cos(pi.*k*(1+2*n)/N));
end

h = h./N;


a = 1;
fvtool(h,a)