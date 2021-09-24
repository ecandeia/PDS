
% MATLAB PROGRAM ECGS.m
% Use this program to read the files ECG3.dat, ECG4.dat, ECG5.dat, and ECG6.dat (one at a time)
% Run the program by entering at the MATLAB command line
% ECGS
% and provide the name of the input file to be read in response to the prompt

%clear all           % clears all active variable
close all

%% Loading the ECG file  %%
fnam = 'ecg_60Hz_200.dat';%input('Enter the ECG file name :','s');
fid = fopen(fnam);
ecg = fscanf(fid,'%f ');
fs = 200; %sampling rate
sze = length(ecg);
necg = ecg/max(ecg); % normalize the maximum value to unity
time = [1 : sze]/fs;
figure;
plot(time,necg);
axis tight;
ylabel('ECG');
xlabel('Tempo (segundos)');
grid on

N = 512;
ECG_k = fft(necg,N);

figure
k = 0:N-1;
stem(k,abs(ECG_k))
xlabel('k')
ylabel('|X(k)|')

%% Removendo a média

media = sum(ecg);

sze = length(ecg);
necg = ecg/max(ecg); % normalize the maximum value to unity
time = [1 : sze]/fs;
figure;
plot(time,necg);
axis tight;
ylabel('ECG');
xlabel('Tempo (segundos)');
grid on

N = 512;
ECG_k = fft(necg,N);

figure
k = 0:N-1;
stem(k,abs(ECG_k))
xlabel('k')
ylabel('|X(k)|')

%% Filtrando

necg_filtrado = doFilter(necg);


figure
plot(time,necg_filtrado);
axis tight;
ylabel('ECG');
xlabel('Tempo (segundos)');
grid on

necg_filtrado_k = fft(necg_filtrado,N);

figure
stem(k,abs(necg_filtrado_k))
xlabel('k')
ylabel('|X(k)|')
