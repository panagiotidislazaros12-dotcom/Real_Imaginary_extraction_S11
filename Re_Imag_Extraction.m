clear; close all; clc;

fName = ["Width=0.63mm_250GHz.s1p", ...
         "Width=0.95mm_250GHz.s1p"];

for s = 1:numel(fName)

    Zobj = zparameters(fName(s));              % Z-parameters object
    Z11  = rfparam(Zobj, 1, 1);                % complex Z11 vs frequency
    freq = Zobj.Frequencies;

    ReZ  = real(Z11);
    ImZ  = imag(Z11);

    % ---- Plot ----
    figure(s); clf
    loglog(freq, abs(ReZ), 'LineWidth', 1.2); hold on
    loglog(freq, abs(ImZ), 'LineWidth', 1.2);
    grid on
    xlim([1e9 50e9]);
    xlabel('Frequency (Hz)')
    ylabel('|Z_{11}| components (\Omega)')
    legend('|Re(Z_{11})|', '|Im(Z_{11})|', 'Location', 'best')
    title(fName(s), 'Interpreter', 'none')

    % ---- Export ----
    N = min(25000, numel(freq));   % protect against short files
    out = [freq(1:N), ReZ(1:N), ImZ(1:N), abs(ReZ(1:N)), abs(ImZ(1:N))];

    header = ["Frequency_Hz","Re_Z11_Ohm","Im_Z11_Ohm","AbsRe_Z11_Ohm","AbsIm_Z11_Ohm"];
    outFile = fName(s) + ".csv";

    writecell(cellstr(header), outFile);
    writematrix(out, outFile, 'WriteMode', 'append');

end
