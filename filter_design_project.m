% Proje: Chebyshev ve Ters Chebyshev Filtre Tasarımı

clc;
clear;
close all;

%% Veriler
epsilon_chebyshev = 0.2; % Chebyshev salınım aralığı
epsilon_inv_chebyshev = 0.13; % Ters Chebyshev salınım aralığı
lpf_wp = 450; % LPF köşe frekansı (rad/s)
hpf_wp = 240; % HPF köşe frekansı (rad/s)
bpf_wc = 480; % BPF merkez frekansı (rad/s)
bpf_bw = 63; % BPF bant genişliği (rad/s)
n = 6; % Filtre derecesi

%% 1. Normalize Filtre Tasarımı
% Butterworth
[z_butter, p_butter, k_butter] = buttap(n); % Butterworth normalize tasarım
[num_butter, den_butter] = zp2tf(z_butter, p_butter, k_butter);

% Chebyshev
[z_cheby, p_cheby, k_cheby] = cheb1ap(n, epsilon_chebyshev); % Normalize Chebyshev tasarım
[num_cheby, den_cheby] = zp2tf(z_cheby, p_cheby, k_cheby);

% Ters Chebyshev (Chebyshev-II)
[z_inv_cheby, p_inv_cheby, k_inv_cheby] = cheb2ap(n, epsilon_inv_chebyshev); % Normalize Ters Chebyshev
[num_inv_cheby, den_inv_cheby] = zp2tf(z_inv_cheby, p_inv_cheby, k_inv_cheby);

%% 2. Denormalizasyon
% LPF
[num_lpf_butter, den_lpf_butter] = lp2lp(num_butter, den_butter, lpf_wp);
[num_lpf_cheby, den_lpf_cheby] = lp2lp(num_cheby, den_cheby, lpf_wp);
[num_lpf_inv_cheby, den_lpf_inv_cheby] = lp2lp(num_inv_cheby, den_inv_cheby, lpf_wp);

% HPF
[num_hpf_butter, den_hpf_butter] = lp2hp(num_butter, den_butter, hpf_wp);
[num_hpf_cheby, den_hpf_cheby] = lp2hp(num_cheby, den_cheby, hpf_wp);
[num_hpf_inv_cheby, den_hpf_inv_cheby] = lp2hp(num_inv_cheby, den_inv_cheby, hpf_wp);

% BPF
[num_bpf_butter, den_bpf_butter] = lp2bp(num_butter, den_butter, bpf_wc, bpf_bw);
[num_bpf_cheby, den_bpf_cheby] = lp2bp(num_cheby, den_cheby, bpf_wc, bpf_bw);
[num_bpf_inv_cheby, den_bpf_inv_cheby] = lp2bp(num_inv_cheby, den_inv_cheby, bpf_wc, bpf_bw);

%% 3. Genlik-Frekans Grafikleri
% Frekans aralığı: Mantıksal olarak tüm tasarım frekanslarını kapsamalıdır.
f = linspace(1, 2000, 1000); % Daha geniş bir frekans aralığı
w = 2 * pi * f; % Açısal frekans

% LPF grafikleri
figure;
subplot(3, 1, 1);
hold on;
[mag, ~] = freqs(num_lpf_butter, den_lpf_butter, w); % Butterworth
semilogx(f, 20*log10(abs(mag)), 'r', 'LineWidth', 1.5);

[mag, ~] = freqs(num_lpf_cheby, den_lpf_cheby, w); % Chebyshev
semilogx(f, 20*log10(abs(mag)), 'g', 'LineWidth', 1.5);

[mag, ~] = freqs(num_lpf_inv_cheby, den_lpf_inv_cheby, w); % Ters Chebyshev
semilogx(f, 20*log10(abs(mag)), 'b', 'LineWidth', 1.5);

title('LPF Genlik-Frekans Grafiği');
xlabel('Frekans (rad/s)');
ylabel('Genlik (dB)');
legend('Butterworth', 'Chebyshev', 'Ters Chebyshev');
grid on;

% HPF grafikleri
subplot(3, 1, 2);
hold on;
[mag, ~] = freqs(num_hpf_butter, den_hpf_butter, w); % Butterworth
semilogx(f, 20*log10(abs(mag)), 'r', 'LineWidth', 1.5);

[mag, ~] = freqs(num_hpf_cheby, den_hpf_cheby, w); % Chebyshev
semilogx(f, 20*log10(abs(mag)), 'g', 'LineWidth', 1.5);

[mag, ~] = freqs(num_hpf_inv_cheby, den_hpf_inv_cheby, w); % Ters Chebyshev
semilogx(f, 20*log10(abs(mag)), 'b', 'LineWidth', 1.5);

title('HPF Genlik-Frekans Grafiği');
xlabel('Frekans (rad/s)');
ylabel('Genlik (dB)');
legend('Butterworth', 'Chebyshev', 'Ters Chebyshev');
grid on;

% BPF grafikleri
subplot(3, 1, 3);
hold on;
[mag, ~] = freqs(num_bpf_butter, den_bpf_butter, w); % Butterworth
semilogx(f, 20*log10(abs(mag)), 'r', 'LineWidth', 1.5);

[mag, ~] = freqs(num_bpf_cheby, den_bpf_cheby, w); % Chebyshev
semilogx(f, 20*log10(abs(mag)), 'g', 'LineWidth', 1.5);

[mag, ~] = freqs(num_bpf_inv_cheby, den_bpf_inv_cheby, w); % Ters Chebyshev
semilogx(f, 20*log10(abs(mag)), 'b', 'LineWidth', 1.5);

title('BPF Genlik-Frekans Grafiği');
xlabel('Frekans (rad/s)');
ylabel('Genlik (dB)');
legend('Butterworth', 'Chebyshev', 'Ters Chebyshev');
grid on;
