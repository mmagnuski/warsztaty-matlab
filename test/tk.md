Test 
----

1. Czym jest potencjał wywołany - 
   opisz swoimi słowami.
_________________________________________________________
_________________________________________________________
_________________________________________________________

2. Jak zrobić erpa z pomocą fieldtripa?
a) jakiej komendy używamy,
   aby utworzyć potencjał wywołany:
__________________________________

b) jak poprosimy fieldtripa, aby policzył nam erpa tylko dla 15 pierwszych powtórzeń?
___________________________________
___________________________________

c) jak poprosimy fieldtripa aby policzył erpa tylko dla powtórzeń związanych z warunkiem 'mopsik_tanczy'?
___________________________________
___________________________________

3.. Opisz własnymi słowami problem wielokrotnych porównań w badaniach EEG:
_________________________________________________________
_________________________________________________________
_________________________________________________________

4.. W jaki sposób pomaga nam cluster-correction?:
_________________________________________________________
_________________________________________________________
_________________________________________________________

5.. Jak w podejściu cluster-correction określamy istotność klastrów?
_________________________________________________________
_________________________________________________________
_________________________________________________________

6.. Zanim przeprowadzimy cluster-correction potrzebujemy wczytać i przetworzyć dane.
Wyobraź sobie, że mamy magiczną funkcję `licz_aktywne_neurony`, którą dostaliśmy od neuronaukowych elfów. Funkcja ta liczy aktywne w danym warunku neurony. Przyjmuje dane w formacie eeglaba (zwykle: `EEG`) oraz nazwę warunku (np. "war1") i zwracają informacje dotyczące aktywnych neuronów w podobnym do fieldtripowego formacie. Interesuje nas zestawienie warunku `war01` oraz `war02`. Napisz kod, który wczyta dane, dla każdego z interesujących nas warunków puści `licz_aktywne_neurony` a wyniki zapisze w macierzy komórkowej w formacie który akceptuje `licz_stat`.
_________________________________________________________
_________________________________________________________
_________________________________________________________
_________________________________________________________
_________________________________________________________
_________________________________________________________
_________________________________________________________

7.. Opisz strukturę `stat`, którą zwraca filedtrip robiąc cluster-correction - wystarczy, że opiszesz podstawowe pola i jakiego rodzaju informacje zawierają.
_________________________________________________________
_________________________________________________________
_________________________________________________________
_________________________________________________________

7+. Napisz kod, który napisze na ekranie Hurra! jeżeli drugi pozytywny klaster jest istotny.
Do wyświetlenia tekstu możesz użyć funkcji `disp`.
_________________________________________________________
_________________________________________________________
_________________________________________________________


8.. Wyobraźmy sobie że mamy wczytany już plik `EEG` (w formacie eeglabowym) do matlaba.
Chcemy policzyć widmo dla warunku 'A' oraz 'B' dla częstotliwości od 8 do 12 Hz.
Napisz kod, który wykona te obliczenia bez najmniejszego wahania:
_________________________________________________________
_________________________________________________________
_________________________________________________________

9.. Zmień teraz powyższy kod aby dostać wynik następującej analizy czas częstość:
* interesują nas częstotliwości od 8 do 35 Hz
* interesuje nas czas od -0.5 s do 1 s po bodźcu, w krokach co 50 ms
* chcemy podróżować przez czas okienkiem o szerokości 250 ms
* najlepiej jeżeli zrobisz jeszcze baseline od -0.4 do 0 s
_________________________________________________________
_________________________________________________________
_________________________________________________________
_________________________________________________________
