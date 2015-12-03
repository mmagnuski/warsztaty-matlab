# Łapanie peaków

wczytujemy dane (którykolwiek plik z dane_twarze):
```matlab
cd 'D:\wombat\dane_twarze\'
EEG = pop_loadset('CAT309 task2.set');
```
Pamiętajcie, że nie musicie przemieszczać się za pomocą `cd`, możecie po prostu podać bezwzględną ścieżkę:
```matlab
EEG = pop_loadset('D:\wombat\dane_twarze\CAT309 task2.set')
```

konwertujemy EEG do formatu fieldtripowego
```matlab
eeg = eeg2ftrip(EEG)
```

używamy `ft_timelockanalysis` by otrzymać erpy 
```matlab
cfg = struct();
cfg.trials = 'all';
erp = ft_timelockanalysis(cfg, eeg);
```

plotujemy sobie erpa dla 47 elektrody
```matlab
plot(erp.time, erp.avg(47,:));
```

Chcemy znaleźć ujemnny peak w zakresie między 100 a 210 ms. Najpierw sprawdzamy które próbki sygnału odpowiadają temu zakresowi czasowemu:
```matlab
sample_range = find_range(erp.time, [0.1, 0.21]);
```
`sample_range` zawiera teraz dwie wartości: numer próbki odpowiadającej czasowi 100 ms oraz numer próbki odpowiadającej czasowi 210 ms.
Znajdziemy teraz minimalną wartość w tym zakresie dla ERPa na 47 elektrodzie.
```matlab
peak_val = min(erp.avg(47, sample_range(1):sample_range(2)));
```

Ok, wiemy już ile wynosi wartość tego peaku, ale chcielibyśmy dowiedzieć się jeszcze w której próbce czasowej się on pojawia.
```matlab
% szukamy które próbki erpa mają te samą wartość co nasz peak
peak_sample = find(erp.avg(47,:) == peak_val);
% upewniamy się że próbki te znajdują się w naszym oknie czasowym `sample_range`
peak_sample = peak_sample((peak_sample > peak_range(1)) ...
	& (peak_sample < peak_range(2)));
```

## Wpływ liczby triali na wartość peak'u

Prosta wersja (to co zrobiliśmy na zajęciach):
```matlab
cfg = struct();
for t = 20:100
    cfg.trials = 1:t;
    erp = ft_timelockanalysis(cfg, eeg);
    peak_val(t-19) = erp.avg(47, peak_sample);
end
```

Wersja bardziej zaawansowana - w całości omówiona jest w tutorialu. Poniżej widzimy efekt końcowy tego tutoriala czyli kod:
```matlab
% najpierw:
% 1. wczytujemy jakieś dane jako EEG
% 2. sprawdzamy gdzie dla 47 elektrody jest peak ERPa
% 3. zapisujemy sobie  w zmiennej peak numer próbki 
%    w której występuje ten wierzchołek

wszystkie_triale = 1:size(EEG.data, 3);
erp_val = zeros(100, 95);

for n = 5:100
	for i = 1:100
		trials = losuj_n(wszystkie_triale, n);
		erp = give_erp(EEG, 47, trials);
		erp_val(i, n) = erp(peak);
	end
end

% wyrysowujemy sobie wyniki
plot_mat_rows(5:100, erp_val, [0.01, 0.05, 0.1]);
```

```matlab
twarze_prosto = ktory_war(EEG, 'face_0');

cfg = [];
cfg.trials = twarze_prosto;
erp_twarze_prosto = ft_timelockanalysis(...
    cfg, eeg);

twarze_odwrotnie = ktory_war(EEG, 'face_180');
cfg = [];
cfg.trials = twarze_odwrotnie;
erp_twarze_odwrotnie = ft_timelockanalysis(...
    cfg, eeg);

plot(erp_twarze_prosto.time, ...
    erp_twarze_prosto.avg(47,:), 'g');
hold on
plot(erp_twarze_odwrotnie.time, ...
    erp_twarze_odwrotnie.avg(47,:), 'r');
```
