function plotuj_to(EEG, chan, figh)

if ~exist('chan', 'var')
	chan = 23;
end

if ~exist('figh', 'var')
	figh = gcf;
	hold on;
end

% get erp
erp = mean(EEG.data(chan, :, :), 3);
plot(EEG.times, erp, 'linewidth', 2, ...
	'color', [0.8, 0.5, 0.67]);