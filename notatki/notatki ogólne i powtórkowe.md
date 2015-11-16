
#### Dodawanie ścieżki
Matlab "widzi" tylko te skrypty i funkcje, które są na ścieżce. Ścieżka nie odnosi się tutaj do narkotykowych atrakcji, ale zbioru folderów na komputerze, których zawartość matlab ma sprawdzać w poszukiwaniu skryptów i funkcji. Znaczy to tylke, że jeżeli wpisujemy jakąś komendę z użyciem funkcji np.:
```matlab
dane = wczytaj_dane('mojedane.set');
```
Matlab szuka kodu funkcji `wczytaj_dane` pośród folderów zdefiniowanych w ścieżce. Jeżeli kod do danej funkcji znajduje się w innym folderze, tzn. poza ścieżką - matlab nie znajdzie funkcji i wypluje nam na przykład taki komunikat:
```
Undefined function or variable 'wczytaj_dane'
```
W tej sytuacji, jeżeli wiemy gdzie znajduje się dana funkcja możemy ją dodać do ścieżki uruchamiając interfejs graficzny komendą `pathtool` bądź korzystając z funkcji `addpath`:
```matlab
% załóżmy, że wiemy, że nasza funkcja znajduje się w folderze:
folder = 'C:\mojedane\nowedane'
% korzystam z funkcji addpath:
addpath(folder)
% równie dobrze można oczywiście napisać:
addpath('C:\mojedane\nowedane')
```
Zdarza się jednak, że funkcja, której próbujemy użyć, a której matlab nie może znaleźć, jest częścią większego pakietu, który ma swoją funkcję ustawiającą odpowiednio ścieżki. Np. gdy matlab nie widzi funkcji `pop_loadset` (która jest częścią pakietu eeglab), wystarczy wpisać `eeglab` - ta komenda dodaje wszystkie niezbędne ścieżki do funkcji eeglaba i otwiera interfejs graficzny.


#### Nawigacja w systemie plików
Normalnie gdy wczytujemy pliki w matlabie musimy podawać całą ścieżkę do pliku np. `'D:\DANE\super projekt\badanie 1\EEG\plik01.set'`. Nie zawsze jest to wygodne, szczególnie gdy wszystkie pliki, z których będziemy korzystać mamy w jednym folderze. Niezbyt chce się nam za każdym razem dopisywać przed nazwą pliku `D:\DANE\super projekt\badanie 1\EEG\`. Jest na to prosta recepta: można kazać matlabowi aby siedział w danym folderze, czyli domyślnie, gdy nie jest podana pełna ścieżka pliku, szukał plików w podanym folderze. Robimy to za pomocą komendy `cd`:
```matlab
% chcemy aby matlab domyślnie zaglądał do
% folderu D:\DANE\super projekt\badanie 1\EEG\
cd('D:\DANE\super projekt\badanie 1\EEG\')
```
Często nie będziemy jednak ręcznie wpisywać nazw plików, ponieważ nam się nie chce (lenistwo jest ważną cechą programisty). Korzystamy wtedy z komendy `dir`. Gdy wpiszemy w oknie komend `dir` matlab domyślnie sprawdza folder w którym obecnie siedzi i wypisuje jego zawartość (foldery i pliki) np.:
```
>> dir

.           .gitignore  db          gui         
..          LICENSE     deps        tests       
.git        README.md   eegDb.m     utils
```
Możemy z komendy `dir` korzystać też w taki sposób aby nie wypisywała wyników w oknie komend, ale zachowywała w odpowiedniej zmiennej. Zmienna ta będzie wtedy strukturą:
```matlab
lista_plikow = dir();
lista_plikow(10)
ans = 
       name: 'gui'
       date: '11-lip-2015 21:56:19'
      bytes: 0
      isdir: 1
    datenum: 7.3616e+05
```
Komenda `dir` jest szczególnie przydatna gdy poszukujemy plików spełniających jakieś kryterium np. takich, które mają rozszerzenie `.set`. `dir` może przyjąć jako argument napis, określający jakich plików szukamy (tzn. plików o jakich nazwach). W napisie podawanym do funkcji `dir` gwiazdki znaczą dowolny ciąg znaków. W związku z tym napis `'*.set'` jest interpretowany jako: dowolny ciąg znaków, który kończy się na `.set`:
```matlab
lista = dir('*.set');
lista(2)
ans = 
       name: 'faces_e_24.set'
       date: '29-wrz-2015 12:53:26'
      bytes: 597016
      isdir: 0
    datenum: 7.3624e+05

lista(2).name
ans = 
    'faces_e_24.set'
```
Dzięki komendzie `dir` w powyższym przykadzie na kolejnych kartach struktury `lista` mamy dostęp do pola `name`, które zawiera nazwę danego pliku (spełniającego podane kryteria, w naszym wypadku `*.set`). W związku z tym aby użyć trzeciej nazwy pliku piszemy `lista(3).name`, a aby użyć siódmej `lista(7).name` itd.
`dir` jest bardzo przydatne gdy chcemy skorzystać z pętli do wczytywania kolejnych plików. Wystarczy nam wtedy pętla `for i = 1:length(lista)` oraz gdzies wewnątrz tej pętli możemy podawać nazwy plików funkcji wczytującej dane za pomocą: `lista(i).name`.