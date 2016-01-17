
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

Do analiz częstotliwościowych używamy funkcji `fr_freqanalysis`, jej dokumentację znajdziemy [w internetu głębi](http://www.fieldtriptoolbox.org/reference/ft_freqanalysis) oraz wykonując komendę:
```matlab
doc ft_freqanalysis
```

Jak zawsze w przypadku funkcji fieldtripowych oprócz danych potrzebujemy struktury konfiguracyjnej, którą zwykle przetrzymujemy w zmiennej `cfg`

### Rach-ciach, wczytujemy dane
Jak zwykle, zakładając, że jesteście w już folderze `wombat`:
```matlab
cd dane-twarze
fls = dir('*.set')

% weźmy na przykład piąty plik
file_num = 5;
EEG = pop_loadset(fls(file_num).name);
% konwertujemy na format fieldtripowy
eeg = eeg2ftrip(EEG);
```

### Widmo
Najpierw spróbujemy po prostu widmo, tworzymy cfg dla funkcji `ft_freqanalysis`:
```matlab
cfg.method  = 'mtmfft';
cfg.channel = 'E47';
cfg.foilim  = [3, 60];
cfg.taper   = 'hanning';

widmo = ft_freqanalysis(cfg, eeg);
```

Co znaczą te wszystkie parametry? Po kolei:
- `method` - metoda, której używamy do oszacowania częstotliwości. Użyte przez nas `'mtmfft'` oznacza "multitapering fast fourier transform". Faktycznie, ze względu na podawany parametr `taper` korzystamy ze zwykłej transformaty Fouriera. Jeżeli nie rozumiesz o co chodzi - nie przejmuj się, nie omawialiśmy (niestety) transformaty Fouriera na zajęciach.
- `channel` - kanał (bądź kanały), które chcemy przeanalizować
- `foilim` - zakres częstotliwości które nas interesują. `[3, 60]` znaczy oczywiście *"od 3 do 60 Hz"*
- `taper` - jakim okienkiem wygładzamy sygnał. Nigdy nie bierzemy żywcem wyciętego z danych sygnału - na krawędziach będziemy często mieć wartości różne od zera co może być źródłem artefaktów (szczególnie w połączeniu z zero-padding, o którym również nie mówimy na zajęciach :P). Aby temu zaradzić - sygnał jest wygładzany okienkiem, które wygląda zwykle podobnie do rozkładu gaussa. Możecie zobaczyć sobie jak takie okienko wygląda:
  ```matlab
  % rysujemy sobie okienko długości 250 próbek
  plot(hanning(250));
  ```
  [tutaj obrazek]

  Zobaczmy też jaki jest efekt wygładzenia. Na wykresie rysujemy sygnał oryginalny (czerwony) oraz sygnał wygładzony okienkiem (zielony):
  ```matlab
  % tworzymy pusty wykres
  figure;
  % rysujemy sygnał z 5 epoki, 38 elektrody:
  plot(eeg.time{5}, eeg.trial{5}(38, :), 'r')
  % sprawdzamy długość sygnału
  signal_length = size(eeg.trial{5}(38, :), 2);
  % tworzymy okienko hanning tej samej długości:
  okienko = hanning(signal_length);
  % wygładzmy okienkiem sygnał (przemnażamy kolejne punkty
  % sygnału kolejnymi punktami okienka)
  wygladzony = eeg.trial{5}(38,:) .* okienko';
  % rysujemy wygładzony sygnał
  hold on; plot(eeg.time{5}, wygladzony, 'g');
  ```
  ![niewygładzony (czerwony) i wygładzony okienkiem (zieolny) sygnał EEG](grafiki/10_02_wygladzanie_okienkiem.PNG)

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
Zadanie dla Was! :) (praca domowa! - nie zdążylimy na zajęciach dojsć tu)
Będę Wam pomagał trochę:
* pętlę przez osoby robiliśmy już wiele razy, także to zróbcie samodzielnie
* pamiętajcie, że chcemy skontrastować jakieś dwa warunki - `ktory_war` się przyda!
* do statystyk skorzystajcie z tego co zobaczyliście w środku `licz_stat`: przede wszystkim `get_cluster_cfg`. Cluster-correction zrobicie funkcją `ft_freqstatistics`