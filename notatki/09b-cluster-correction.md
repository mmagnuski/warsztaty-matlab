# Cluster-correction, praktyczne starcie

Na dzisiejszych zajęciach zajmiemy się przeprowadzaniem analiz grupowych z wykrozystaniem cluster-correction używając `ft_timelockstatistics`.


## Wstęp
Piersze starcie z analizą grupową będzie łagodne. Nie będziecie musieli specjalnie dużo pisać samemu. Odpwoiednie ustawienie danych i zdefiniowanie konfiguracji (struktura `cfg` dla fieldtripa) jest wykonywane przez funkcę `licz_stat`, którą Wam napisałem. Dopiero później po wstępnym oswojeniu się z analizą grupową zanurkujemy w kwestie własnoręcznego definiowania fieldtripowi tego, co chcemy osiągnąć.

## wczytujemy dane
Aby `fieldtrip` ogarnął co za dane dostaje (które osoby przynależą do którego warunku itp.) trzeba mu o tym powiedzieć tworząc i podając mu strukturę `cfg`. Na razie robi to za Was funkcja `licz_stat`, także najpierw nauczymy się wczytywać i podawać tej funkcji dane.

### Co chcemy osiągnąć?
Chcemy wczytać i przetworzyć dane tak aby znajdowały się w macierzy komórkowej w formie:
```
{S1_w1, S1_w2, S2_w1, S2_w2, S3_w1, S3_w2, ...}
```
Gdzie `Si` oznacza osobę numer `i`, a `wi` oznacza warunek numer `i`. Chcemy więc aby w kolejnych komórkach macierzy komórkowej znajdowały się najpierw oba porównywane warunki pierwszej osoby (najpierw pierwszy, potem drugi), następnie oba porównywane warunki drugiej osoby (pierwszy, potem drugi) i tak dalej - dla wszystkich osób.

### Z czego skorzystamy?
* na pewno z pętli `for`
* skorzystamy też z macierzy komórkowych, krótkie przypomnienie:  
  ```matlab
  % tworzymy "pustą" macierz komórkową o rozmiarach 3 na 1:
  mac_kom = cell(3,1);
  % wrzucamy do drugiej komórki wektor:
  mac_kom{2} = [3, 5, 1, 8];
  ```
* `pop_loadset` - wczytuje nam dane w eeglabowym formacie `set`
* `eeg2ftrip`   - konwertuje wczytane dane z formatu eeglabowego na fieldtripowy
* `ktory_war`   - podaje numery triali pochodzących z danego warunku
* `ft_timelockedanalysis` - liczy erpy

### Jak to ułożyć aby sprawnie działało?
To zadanie dla Was! W poprzedniej sekcji kolejność jest już zasugerowana, ale spróbujcie złożyć to w działający kod.

### Rozwiązanie
`na razie nic tu nie ma aby was nie kusiło by kopiować`

## puszczamy cluster-correction

### w fieldtripie
W tutorialach do fieldtripa przeprowadzanie cluster-correction często przedstawia się tak:
```matlab
cfg = [];
% basic configuration for cluster-correction
cfg.method = 'montecarlo';
cfg.statistic = 'ft_statfun_indepsamplesT';
cfg.correctm = 'cluster';
cfg.clusteralpha = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.minnbchan = 2;
cfg.tail = 0;
cfg.clustertail = 0;
cfg.alpha = 0.025;
cfg.numrandomization = 100;

cfg.channel       = {'MEG'};
cfg.latency       = [0 1];

% create neighbours structure
cfg_neighb        = [];
cfg_neighb.method = 'distance';
neighbours        = ft_prepare_neighbours(cfg_neighb, data1);
cfg.neighbours    = neighbours;

% create design
design = zeros(1,size(timelockFIC.trial,1) + size(timelockFC.trial,1));
design(1,1:size(timelockFIC.trial,1)) = 1;
design(1,(size(timelockFIC.trial,1)+1):(size(timelockFIC.trial,1) + size(timelockFC.trial,1)))= 2;

cfg.design = design;
cfg.ivar  = 1;

stat = ft_timelockstatistics(cfg, data1, data2);
```

Omówimy jeszcze te kroki, ale większość z nich jest dosyć powtarzalna, więc w `braintools` mam funkcję które skracają tę litanię powyżej do kilku linijek. Ale zaczniemy od czegoś jeszcze prostszego: `licz_stat`.

### w lepszym świecie (`licz_stat`)
Aby umożliwić Wam łatwy start napisałem dla Was funkcję `licz_stat`, która odbiera od Was dane i korzystając z kilku funkcji z `braintools` tworzy konfigurację dla funkcji `ft_timelockstatistics`.
Zakładając, że dane macie w macierzy komórkowej `dane`, korzystacie z `licz_stat` tak:
```matlab
stat = licz_stat(dane);
```

## struktura `stat`
Zanim omówimy dokładnie tworzenie konfiguracji dla fieldtripa, chciałbym abyście zrozumieli co zawiera w sobie struktura `stat`:
```
>> stat

stat = 

                   prob: [65x13x13 double]
            posclusters: [1x1 struct]
    posclusterslabelmat: [65x13x13 double]
        posdistribution: [1x1000 double]
            negclusters: [1x4 struct]
    negclusterslabelmat: [65x13x13 double]
        negdistribution: [1x1000 double]
                cirange: [65x13x13 double]
                   mask: [65x13x13 logical]
                   stat: [65x13x13 double]
                    ref: [65x13x13 double]
                     df: 58
                 dimord: 'chan_freq_time'
                   freq: [3 4 5 6 7 8 9 10 11 12 13 14 15]
                  label: {65x1 cell}
                   time: [-0.1000 -0.0480 0 0.0480 0.1000 0.1480 0.2000 0.2480 0.3000 0.3480 0.4000 0.4480 0.5000]
                    cfg: [1x1 struct]
```

Najważniejsze dla nasz pola tej struktury:
* `posclusters`, `negclusters` - wartości statystyki i istotność dla kolejnych (posortowanych po istotności) pozytywnych/negatywnych klastrów.
* `dimord` - mówi nam które wymiary macierzy obecnych w `stat` odnoszą się do jakich wymiarów przestrzeni naszego sygnału. W naszym wypadku będzie to `chan_time` czyli elektrody na czas, ale w przykładzie powyżej widzicie `chan_freq_time` - elektrody na częstotliwość na czas
* `stat` - wartości statystyki dla kazdego punktu porównań (tzn. dla całej przeszukiwanej przestrzeni której wymiary podane są w `stat.dimord`)
* `posclusterslabelmat` oraz `negclusterslabelmat` - pola o niepotrzebnie długich nazwach, które zawierają informację o tym które punkty w porównywanej przestrzeni tworzą klastry. Bardziej precyzyjnie w polach tych jest macierz o wymiarach opisywanych przez `dimord`, która dla każdego punktu w testowanej przestrzeni zawiera informację o tym do którego klastra (pozytywnego bądź negatywnego) dany punkt przynależy. Tzn. jeżeli sto jedenasta próbka czasowa na piętnastej elektrodzie przynależy do drugiego pozytywnego klastra (`stat.posclusters(2)`) to jest to reporezentowane tak, że `stat.posclusterslabelmat(15, 111)` ma przypisaną wartość `2`.

## jak to graficznie zrozumieć?

W `braintools` mamy przydatną funkcję `plot_time_elec`, którą wykorzystujemy po prostu tak:
```matlab
plot_time_elec(stat);
```
Funkcja ta zakłada, że korzystamy z 64-kanałowego czepka EGI (czyli takiego z jakiego często krzystamy w labie) i elegancko wszystko wyrysowuje.

