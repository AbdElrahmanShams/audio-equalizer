function Hd = EIIR6K(sampleRate)

%ELLIPTICIIRFILTERS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.4 and Signal Processing Toolbox 8.0.
% Generated on: 25-Dec-2018 15:53:37

% Elliptic Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
%Fs = 48000;  % Sampling Frequency
Fs = sampleRate;

Fstop1 = 2800;     % First Stopband Frequency
Fpass1 = 3000;     % First Passband Frequency
Fpass2 = 6000;     % Second Passband Frequency
Fstop2 = 6200;     % Second Stopband Frequency
Astop1 = 100;     % First Stopband Attenuation (dB)
Apass  = 0.01;    % Passband Ripple (dB)
Astop2 = 100;     % Second Stopband Attenuation (dB)
match  = 'both';  % Band to match exactly

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.bandpass(Fstop1, Fpass1, Fpass2, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'ellip', 'MatchExactly', match);

% [EOF]
