%% Repetition Code
open_system('repetition.slx');
n_list = [3 4 5];
eprob_list = logspace(-3,-0.5,10);
ber_rep = zeros(length(n_list), length(eprob_list));
ber_rep_th = zeros(length(n_list), length(eprob_list));

for i = 1:length(n_list)
    for j = 1:length(eprob_list)
        n = n_list(i);  
        eprob = eprob_list(j);
        simOut = sim('repetition');
        ber_rep(i,j) = simOut.ErrorStat(1);
        ber_rep_th(i,j) = % TODO: Theoretical BER
    end
end
save_system;
close_system;
%% BER Curve
loglog([eprob_list(1) 1],[eprob_list(1) 1],'k--'); hold on;
c = eye(3);
for i = 1:length(n_list)
    loglog(eprob_list, ber_rep(i,:),'*','Color',c(i,:));
    loglog(eprob_list, ber_rep_th(i,:),'Color',c(i,:));
end
ylim([1e-5 1]);
xlabel('Channel Error Probability');
ylabel('BER');
grid on;
legend('No Coding', '[3,1] Repetition Simulation', '[3,1] Repetition Theoretical', ...
    '[4,1] Repetition Simulation', '[4,1] Repetition Theoretical', ...
    '[5,1] Repetition Simulation', '[5,1] Repetition Theoretical', ...
    'Location','southeast');