function stat = licz_stat(fls)

% tworzy konfiguracjê do statystyk fieldtripowych
% oraz zapuszcza fieldtripowe cluster-correction
%
% za³o¿enia:
% * porównanie testem t dla pomiarów zale¿nych
% * fls - macierz komórkowa, która po kolei ma
%   w sobie {osoba01_warunek01, osoba01_warunek02,
%   osoba02_warunek01, osoba02_warunek_02}

n_fls = length(fls);

% get template configuration for dependent analysis
cfg = get_cluster_cfg('dep');

% design
cfg.design(1,:) = repmat([1, 2], [1, n_fls/2]);
tmp = repmat(1:n_fls/2, [2, 1]);
cfg.design(2,:) = tmp(:);


% add channel neighbours for clustering across channels
cfg.neighbours = get_neighbours('EGI64');

% cluster-correction with fieldtrip
if isfield(fls{1}, 'powspctrm')
    stat = ft_freqstatistics(cfg, fls{:});
else
    stat = ft_timelockstatistics(cfg, fls{:});
end
