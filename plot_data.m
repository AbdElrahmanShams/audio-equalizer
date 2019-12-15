function [outputfg] = plot_data ( input, inputFs, output, outputFs )
%PLOT_DATA Plots data before and after filtering
%   Plots input and output data in the time and frequency domains

% If signal is Nx2 (two columns, i.e.: two audio channels), use first
input = input (:, 1);
output = output (:, 1);

outputfg = figure;

dt = 1 / inputFs;
n = length (input) - 1;
t = 0:dt:dt * n;
subplot (2, 2, 1);
plot (t, input);
grid;
title ('Input (Time Domain)');
xlabel ('Time (second)');
ylabel ('Amplitude');
xlim ([min(t) max(t)]);
ylim ([min(input) max(input)]);

L = length (input);
f = inputFs * (0:(L / 2)) / L;
inputFFT = abs (fft (input)/L);
subplot (2, 2, 3);
plot (f, inputFFT(1:L/2+1));
grid;
title ('Input (Frequency Domain)');
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
xlim ([min(f) max(f)]);
ylim ([min(inputFFT) max(inputFFT)]);

dt = 1 / outputFs;
n = length (output) - 1;
t = 0:dt:dt * n;
subplot (2, 2, 2);
plot (t, output);
grid;
title ('Output (Time Domain)');
xlabel ('Time (second)');
ylabel ('Amplitude');
xlim ([min(t) max(t)]);
ylim ([min(output) max(output)]);

L = length (output);
f = outputFs * (0:(L / 2)) / L;
outputFFT = abs (fft (output)/L);
subplot (2, 2, 4);
plot (f, outputFFT(1:L/2+1));
grid;
title ('Output (Frequency Domain)');
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
xlim ([min(f) max(f)]);
ylim ([min(outputFFT) max(outputFFT)]);

end