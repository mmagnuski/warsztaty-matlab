## Zaawansowana Analiza Sygnału, zajęcia 01

### Plan na dziś

* instalujemy git'a i robimy porządek
* tworzymy skrytp do dodawania ścieżek i ściągania zmian z GitHub'a
* wstęp do FieldTripa
* analizy grupowe


### porządek!

#### folder `wombat`
Najpierw utwórzcie sobie na dysku `D` folder `wombat` gdzie będziemy przechowywać wszystko co nam potrzebne - kod oraz dane. Folder ten musi mieć konkretną strukturę:
- powinien zawierać folder z eeglabem
- a także folder `dane_twarze`, w którym będziemy trzymać dane, które ściągaliście z Dropboxa 
- w folderze tym znajdzie się jeszcze kilka rzeczy (np. fieldtrip), ale o tym za chwilę

Usuńcie też z komputera (również z pulpitu) niepotrzebne pliki. Chodzi przede wszystkim o pliki z naszych zajęć - tzn. wcześniej ściągane wersje warsztaty-matlab czy braintools.

#### instalacja git'a
Zamiast ściągać GitHub'owe repozytoria ręcznie za każdym razem - użyjemy git'a!
Git'a ściągamy [stąd](https://git-scm.com/).

Podczas instalacji możecie zostawić ustawienia domyślne poza następującymi dwoma:
* miejsce instalacji - zainstalujcie git'a na dysku `D:` tzn `D:\Git`
* w pewnym momencie instalator pyta się o to czy komendy git'a mają działać z windowsowego cmd - trzeba tam ustawić środkową opcję.

#### Ściągnięcie gitem kilku pakietów

Wejdzcie do folderu `wombat`, kliknijcie prawym przyciskiem w folderu pustkę i wybierzcie `git bash here` z rozwijanego menu. 
Wystarczy teraz że po kolei wykonacie te komendy:
```
git clone https://github.com/mmagnuski/warsztaty-matlab
git clone https://github.com/mmagnuski/braintools
git clone https://github.com/mmagnuski/eegDb
```

#### Skrypt rozruchowy
Chcemy aby matlab zawsze wykonywał pewne komendy przy każdym uruchomieniu - sprawdzał i update'ował zmiany z GitHuba, dodawał ścieżki do potrzebnych nam pakietów. Można sprawić to wszystko pisząc skrypt `startup.m` i umieszczając go gdzieś na ścieżce matlaba.
Ale po kolei:
* najpierw wyczyścimy dotychczasowe ścieżki: wchodzimy przez interfejs graifczny albo komendę `pathtool` do okna dodawania ścieżki. Po prawej stronie na dole klikamy guzik `default` i akceptujemy, że chcemy wrócić do ustawień domyślnych.
* dodajemy do ścieżki `D:\wombat` i zapisujemy
* zapisujemy poniższy kod w `D:\wombat` jako `startup.m`:

```matlab
% get updates to braintools, eegDb and warsztaty-matlab
disp('Checking for updates...');
cd('D:\wombat\warsztaty-matlab');
!git pull
cd('D:\wombat\braintools');
!git pull
cd('D:\wombat\eegDb');
!git pull

% add paths to braintools and warsztaty
addpath('D:\wombat\braintools');
addpath('D:\wombat\warsztaty-matlab\kod');
braintools;
addpath('D:\wombat\eegDb');
eegDb

% find and add eeglab folder and basic eeglab functions:
eeglab_dir = folder_name('D:\wombat', 'eeglab');
addpath(fullfile('D:\wombat', eeglab_dir));
eeg_path('add');

fieldtrip_dir = folder_name('D:\wombat', 'fieldtrip');
if fieldtrip_dir
	addpath(fullfile('D:\wombat', fieldtrip_dir));

	% initialize fieldtrip
	ft_defaults;
end
```

### Wstęp do FieldTripa

#### Instalujemy FieldTripa
FieldTripa możecie pobrać [stąd](http://www.fieldtriptoolbox.org/download). Musicie wpisać tam swojego maila i wtedy na maila dostaniecie link do ściągnięcia. Ale możecie też ominąć ten krok gdyż bezpośredni link do ściągnięcia to:
```
ftp://ftp.fieldtriptoolbox.org/pub/fieldtrip/
```
Wybierzcie najnowszą wersję lite fieldtripa (nie zawiera części ciężkich plików, które i tak nie będą nam potrzebne).

#### Dalej:
`eeg2ftrip()` (z `braintools`) - konwertuje nam format EEG eelgaba na fieldtripowy format
większość podstawowych funkcji fieldtripa zaczyna się na `ft_` - wpiszcie sobie `ft_` i naciśnijcie tab (trzeba będzie prawdopodobnie chwilę poczekać)

`ft_timelockedanalysis` - sprawdzić możecie dokumentację z użyciem komendy `doc` albo `help`.
`ft_freqanalysis` - do częstotliwościowej analizy

#### ERPy

Sprawdzilismy jak wygladaja erpy z roznych ilosci triali:
```matlab
% robimy erpy dla różnych ilości triali
cfg = [];
cfg.trials = 1:10;
erp_10 = ft_timelockanalysis(cfg, eeg);
cfg.trials = 1:30;
erp_30 = ft_timelockanalysis(cfg, eeg);
cfg.trials = 1:50;
erp_50 = ft_timelockanalysis(cfg, eeg);
cfg.trials = 'all';
erp_all = ft_timelockanalysis(cfg, eeg);


% plotujemy te erpy
col = repmat(linspace(0.5, 0, 4)', [1,3]);

plot(erp.time, erp_10.avg(47,:), ...
    'color', col(1,:));
hold on
plot(erp.time, erp_30.avg(47,:), ...
    'color', col(2,:));
plot(erp.time, erp_50.avg(47,:), ...
    'color', col(3,:));
plot(erp.time, erp_all.avg(47,:), ...
    'color', col(4,:));
```
