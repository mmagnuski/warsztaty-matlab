conds = {'angry', 'happy'};

n_subj = length(fls);
angry_erp = zeros(n_subj, EEG.pnts);
happy_erp = zeros(n_subj, EEG.pnts);

for s = 1:n_subj
	EEG = loads(fls(s).name);
	erp_temp = get_all_erps(EEG, conds, 'chans', 'E47');
	angry_erp(s,:) = erp_temp{1};
	happy_erp(s,:) = erp_temp{2};
end

clear erp_temp s n_subj
