open_system('pam_rc.slx');
SNR_list = linspace(-10, 10, 11); % in dB
ser_rc = zeros(1, length(SNR_list));
ser_th = zeros(1, length(SNR_list));

for i = 1:length(SNR_list)
    SNR = SNR_list(i); % in dB
    simOut = sim('pam_rc');
    ser_rc(i) = simOut.ser(1);
    ser_th(i) = % TODO
end
save_system;
close_system;
%% SER Curve
semilogy(SNR_list, ser_rc,'*'); hold on;
semilogy(SNR_list, ser_th,'--'); hold on;
ylim([1e-5 1]);
xlabel('Signal to Noise Ratio E_b/n_0 (dB)');
ylabel('SER');
legend('Raised Cosine PAM w/ Optimal Receiver', 'Theoretical', 'Location','northeast');
grid on;