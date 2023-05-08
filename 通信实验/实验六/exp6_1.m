open_system('decisions.slx');
Ns_list = [5 10 20];
SNR_list = linspace(-20, 20, 11); % in dB
ber_sample = zeros(length(Ns_list), length(SNR_list));
ber_hard = zeros(length(Ns_list), length(SNR_list));
ber_soft = zeros(length(Ns_list), length(SNR_list));

for i = 1:length(Ns_list)
    for j = 1:length(SNR_list)
        Ns = Ns_list(i);
        SNR = db2mag(SNR_list(j));
        sigma2 = % TODO
        simOut = sim('decisions');
        ber_sample(i,j) = simOut.ber_sample(1);
        ber_hard(i,j) = simOut.ber_hard(1);
        ber_soft(i,j) = simOut.ber_soft(1);
    end
end
save_system;
close_system;
%% SER & BER Curve
c = [0 0 0; 1 0 0; 0 0 1];
figure;
for i = 1:length(Ns_list)
    semilogy(SNR_list, ber_sample(i,:),'--','Color',c(i,:)); hold on;
    semilogy(SNR_list, ber_hard(i,:),'-.','Color',c(i,:)); hold on;
    semilogy(SNR_list, ber_soft(i,:),'-','Color',c(i,:)); hold on;
end
ylim([1e-5 1]);
xlabel('Signal to Noise Ratio (dB)');
ylabel('BER');
legend('Ns=5 Sample', 'Ns=5 Hard Decision', 'Ns=5 Soft Decision', ...
    'Ns=10 Sample', 'Ns=10 Hard Decision', 'Ns=10 Soft Decision', ...
    'Ns=20 Sample', 'Ns=20 Hard Decision', 'Ns=20 Soft Decision', ...
    'Location','southwest');
grid on;