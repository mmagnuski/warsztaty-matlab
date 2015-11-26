function h = plot_mat_rows(xval, mat, proc)

h.fig = figure;

sz = size(mat);
mn = mean(mat, 1);
srt = sort(mat, 1);
prc = round(sz(1) * proc);

xval = xval(:);

h.line = plot(xval, mn, 'color', [0.8, 0.5, 0.5], ...
	'LineWidth', 2);

for i = 1:length(prc)
	botlim = srt(prc(i), :);
	uplim = srt(end-prc(i)+1, :); 
	vert = [xval, uplim'; flipud(xval), flipud(botlim')];
	fc = 1:size(vert, 1);
	h.patch(i) = patch('vertices', vert, 'faces', fc, ...
		'edgecolor', 'none', 'facecolor', [0.95, 0.7, 0.7],...
		'facealpha', 0.5);
	uistack(h.patch(i), 'bottom');
end