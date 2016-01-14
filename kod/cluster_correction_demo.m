
num_perm = 1000;

hist_fig_pos = figure;
hist_fig_neg = figure;
erp_fig = figure;

hist_pos = zeros(num_perm, 1);
hist_neg = zeros(num_perm, 1);

for p = 1:num_perm
	% tworzymy przetasowane warunki
	odwr = rand(28, 1) > 0.5;
	happy_0 = happy_erp;
	angry_0 = angry_erp;

	happy_0(odwr,:) = angry_erp(odwr, :);
	angry_0(odwr,:) = happy_erp(odwr, :);
	h_0 = ttest(angry_0, happy_0);


	gr = group(h_0);
	gr = gr(gr(:,1) == 1, 2:3);

	t_vals = zeros(size(gr, 1), 1);
	for i = 1:size(gr, 1)
		t_vals(i) = sum(d.tstat(gr(i,1):gr(i,2)));
	end

	if any(t_vals > 0)
		hist_pos(p) = max(t_vals);
	end
	if any(t_vals < 0)
		hist_neg(p) = min(t_vals);
	end

	% plotujemy
	figure(hist_fig_pos);
	hist(hist_pos(1:p), 100);
	figure(hist_fig_neg);
	hist(hist_neg(1:p), 100);

	figure(erp_fig);
	cla(erp_fig);
	erp_0 = [mean(angry_0); mean(happy_0)];
	erp_plot(EEG, erp_0, 'patch', h_0);

	drawnow
end
