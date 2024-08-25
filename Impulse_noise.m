% Frequency Modulation (FM) in MATLAB with Audio Signal and Impulse Noise
clc;
clear;
close all;

% Parameters
Ac = 1;                % Amplitude of carrier signal
fc = 10000;            % Carrier frequency in Hz
kf = 50;               % Frequency sensitivity in Hz/V (modulation index)

% Read Audio File
[audio, Fs] = audioread('counting.wav');
audio = audio(:, 1);  % Use the first channel if stereo
t = (0:length(audio)-1)' / Fs;  % Time vector based on audio sample rate

% Normalize the audio signal
audio = audio / max(abs(audio));

% Frequency Modulation
% Instantaneous frequency deviation is proportional to the integral of the audio signal
int_audio = cumtrapz(t, audio);          % Integral of the audio signal
s = Ac * cos(2 * pi * fc * t + 2 * pi * kf * int_audio);  % FM signal

% Add Impulse Noise
noise_amplitude = 2;  % Amplitude of impulse noise
num_impulses = 50;    % Number of impulses
impulse_indices = randi(length(t), num_impulses, 1);  % Randomly select indices for impulses
s_noisy = s;  % Initialize noisy signal
s_noisy(impulse_indices) = s_noisy(impulse_indices) + noise_amplitude * randn(size(impulse_indices));  % Add impulses

% Plotting
figure;
subplot(3,1,1);
plot(t, audio);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, s);
title('Frequency Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, s_noisy);
title('Frequency Modulated Signal with Impulse Noise');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Play Original Audio
disp('Playing Original Audio...');
sound(audio, Fs);
pause(length(audio)/Fs + 2);  % Wait for the audio to finish

% Play Frequency Modulated Audio
disp('Playing Frequency Modulated Audio...');
sound(s, Fs);
pause(length(s)/Fs + 2);  % Wait for the audio to finish

% Play Frequency Modulated Audio with Impulse Noise
disp('Playing Frequency Modulated Audio with Impulse Noise...');
sound(s_noisy, Fs);
pause(length(s_noisy)/Fs + 2);  % Wait for the audio to finish

% Calculate SNR
signal_power = mean(s.^2);
noise_power = mean((s_noisy - s).^2);
calculated_snr = 10 * log10(signal_power / noise_power);

% Calculate Bit Error Rate (BER)
reference_bits = (audio > 0.5); % Use original audio as reference bits
noisy_bits = (s_noisy > 0.5); % Convert noisy signal to bits
num_errors = sum(reference_bits ~= noisy_bits(1:length(reference_bits)));
total_bits = length(reference_bits);
BER = num_errors / total_bits;

% Display calculated BER and SNR
disp(['Calculated Bit Error Rate (BER): ', num2str(BER)]);
disp(['Calculated SNR: ', num2str(calculated_snr), ' dB']);
