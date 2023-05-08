open_system('multi.slx');
A = 1;
k_list = [1 2 3]; % k={1,2,3}, M={2,4,8}
SNR_list = linspace(-5, 40, 10); % in dB
ber = zeros(length(k_list), length(SNR_list));
ser = zeros(length(k_list), length(SNR_list));
ber_th = zeros(length(k_list), length(SNR_list));
ser_th = zeros(length(k_list), length(SNR_list));

for i = 1:length(k_list)
    for j = 1:length(SNR_list)
        k = k_list(i);
        SNR = db2mag(SNR_list(j));
        sigma2 = % TODO
        simOut = sim('multi');
        ser(i,j) = simOut.ser(1);
        ber(i,j) = simOut.ber(1);
        ser_th(i,j) = % TODO
        ber_th(i,j) = % TODO
    end
end
save_system;
close_system;
%% SER & BER Curve
c = [0 0 0; 1 0 0; 0 0 1];
figure;
for i = 1:length(k_list)
    semilogy(SNR_list, ser(i,:),'o','Color',c(i,:)); hold on;
    semilogy(SNR_list, ser_th(i,:),'--','Color',c(i,:)); hold on;
    semilogy(SNR_list, ber(i,:),'*','Color',c(i,:)); hold on;
    semilogy(SNR_list, ber_th(i,:),'-','Color',c(i,:)); hold on;
end
ylim([1e-5 1]);
xlabel('Signal to Noise Ratio (dB)');
ylabel('SER and BER');
legend('M=2 SER Experiment', 'M=2 SER Theoretical', 'M=2 BER Experiment', 'M=2 BER Theoretical', ...
    'M=4 SER Experiment', 'M=4 SER Theoretical', 'M=4 BER Experiment', 'M=4 BER Theoretical', ...
    'M=8 SER Experiment', 'M=8 SER Theoretical', 'M=8 BER Experiment', 'M=8 BER Theoretical', ...
    'Location','southwest');
grid on;