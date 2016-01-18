function plot_tfr(tfr, chan)

% plotujemy
im = imagesc(squeeze(tfr.powspctrm(chan,:,:)));

% ustawiamy osie itp.
set(gca, 'YDir', 'normal');
set(im, 'XData', tfr.time([1,end]));
set(im, 'YData', tfr.freq([1,end]));
set(gca, 'XLim', tfr.time([1,end]));
set(gca, 'YLim', tfr.freq([1,end]));