firfilt = KFIR3K;

figure;

[h, w] = freqz (firfilt);
f = w / pi;
mag = 20 * log10 (abs (h));
subplot (2, 3, 1);
plot (f, mag);
grid;
title ('Gain');
xlabel ('Normalized Frequency');
ylabel ('Magnitude (dB)');
xlim ([min(f) max(f)]);
ylim([min(mag) max(mag)]);

[phi, w] = phasez (firfilt);
f = w / pi;
subplot (2, 3, 4);
plot (f, phi);
grid;
title ('Phase');
xlabel ('Normalized Frequency');
ylabel ('Phase (Radian)');
xlim ([min(f) max(f)]);
ylim([min(phi) max(phi)]);

[h, t] = impz (firfilt);
subplot (2, 3, [2, 3]);
stem (t, h, 'filled');
grid;
title ('Impulse Response');
xlabel ('Sample');
ylabel ('Amplitude');
xlim ([min(t) max(t)]);
ylim ([min(h) max(h)]);

[vz, vp] = zplane (hd);
subplot (2, 3, 5);
hold on;
plot (real (vz), imag (vz), 'o');
set (gca, 'ColorOrderIndex', 1);
plot (real (vp), imag (vp), 'x');
title ('Pole/Zero Plot');
xlabel ('Real');
ylabel ('Imaginary');
grid;
hold off;

[gd, w] = grpdelay (hd);
f = w / pi;
subplot (2, 3, 6);
plot (f, gd);
xlabel ('Normalized Frequency');
ylabel ('Group Delay (samples)');