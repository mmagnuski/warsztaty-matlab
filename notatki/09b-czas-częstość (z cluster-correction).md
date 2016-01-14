
## Plan jazdy
* sprawy organizacyjne
* test z materiału z ostatnich dwóch zajęć
* krótka powtórka
* analizy czas-częstość, krótki wstęp
* przeprowadzanie analizy czas-częstość w fieldtripie
* statystyki na wynikach czas-częstość - cluster-correction

## Sprawy organizacyjne
* lista!
* kiedy umawiamy się na poprawy?
* jak ktoś nie zdażył pracy domowej - jeszcze do końca tego tygodnia będę akceptował
* do końca następnego - to samo co, ostatnio, ale na danych czas-częstość (dla wybranej elektrody czas-częstość a następnie analiza statystyczna)

## krótka potestowa powtórka:
* co robi licz_stat?
  możecie zajrzeć do tego pliku następującą komendą:
  ```matlab
  edit licz_stat
  ```
* co robi `get_cluster_cfg`
  w `licz_stat` dzięki tej funkcji otrzymujemy cfg, które podajemy do ft_timelockedstatistics.
  Zerkniemy do środka `get_cluster_cfg` i sprawdzimy jakie `cfg` nam tworzy
* co znaczą wybrane atrybuty z cfg


## ft_freqanalysis

wejdźcie na:
http://www.fieldtriptoolbox.org/reference/ft_freqanalysis

Jak zawsze w przypadku funkcji fieldtripowych oprócz danych potrzebujemy struktury konfiguracyjnej, którą zwykle przetrzymujemy w zmiennej `cfg`

### Widmo
Najpierw spróbujemy po prostu widmo:
```matlab
cfg.method  = 'mtmfft';
cfg.channel = 'E47';
cfg.taper   = 'hanning';
cfg.foilim  = [3, 60];

widmo = ft_freqanalysis(cfg, eeg);
```

dodatkowe opcje:
```matlab
cfg.foi = [3:0.5:25]; % cały wektor interesujących nas częstotliwości
cfg.keeptrials = 'yes'; % chcemy otrzymać widmo dla każdego triala, nie tylko średnią
```

### Czas częstość:
```matlab
cfg.method    ='mtmconvol';
cfg.t_ftimwin = 0.3;
cfg.toi       = [-0.5:0.1:0.7];
```

### pętla przez osoby i statystyki
Zadanie dla Was! :)
Będę Wam pomagał trochę:
* pętlę przez osoby robiliśmy już wiele razy, także to zróbcie samodzielnie
* pamiętajcie, że chcemy skontrastować jakieś dwa warunki - `ktory_war` się przyda!
* do statystyk skorzystajcie z tego co zobaczyliście w środku `licz_stat`: przede wszystkim `get_cluster_cfg`. Cluster-correction zrobicie funkcją `ft_freqstatistics`