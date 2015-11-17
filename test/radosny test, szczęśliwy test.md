test
----

### adresowanie wektorów i macierzy
1 Wyobraźmy sobie, że mamy taki wektor:
```matlab
robaczek = [55, 13, 72, 23, 8];
```
Uzupełnij komendy poniżej aby zaadresować:
a) trzeci element tego wektora
```
robaczek(________)
```
b) element o wartości 23
```
robaczek(________)
```
c) elementy o nieparzystym adresie
```
robaczek(________)
```

2 Mamy następującą macierz:
```matlab
triceratops = [5, 1, 2, 8; 6, 4, 3, 5; 6, 2, 9, 3; 6, 7, 7, 8];
```
Napisz komendy, którymi zaadresujesz:
a) element na przecięciu drugiego wiersza i trzeciej kolumny
```
____________________________________
```
b) elementy na przecięciu pierwszej i drugiej kolumny z czwartym wierszem
```
____________________________________
```
c) elementy mające wartość siedem
```
____________________________________
```

3 Teraz czas na obcowanie z danymi eeg przechowywanymi w strukturze EEG.
a) w jakim polu struktury EEG przechowywane są dane (sygnał z kanałów)?
```
EEG.______________
```
b) w jakim polu przetrzymywana jest informacja o czasie dla kolejnych próbek czasowych?
```
EEG.______________
```
c) co reprezentują kolejne wymiary macierzy z danymi?
```
1 - _________________
2 - _________________
3 - _________________
podpowiedź: macierz danych na wczesnych etapach preprocessing'u nie ma trzech wymiarów.
```
d) zaadresuj macierz danych tak aby wybrać cały sygnał w czasie dla ósmego kanału w trzynastej epoce.
```
EEG._____________________
```
e) zaadresuj macierz danych tak aby wybrać wszystkie epoki dla kanałów: 22, 47, 54. (cały czas)
```
EEG._____________________
```

### funkcje
4 Napisz jak wykożystać funkcję `mean` aby uśrednić macierz `A`:
a) redukując wiersze (uśredniając wzdłuż wymiaru wierszy):
```
mean(____________)
```
b) redukując kolumny
```
mean(____________)
```

5 Jak użyjemy funkcji `mean` aby otrzymać:
a) średnią odpowiedź mózgu (niezależną od epoki) dla siódmego kanału:
```
mean(_____________________________)

podpowiedź: przez "niezależne od X" zwykle rozumiemy "uśredniając wszystkie X".
tak jak "jaka jest waga psa niezależnie od jego rasy" znaczy "jaka jest waga psa gdy uśrednimy rasy?" czyli po prostu "jaka jest średnia waga psa?"
```
b) średnią wagę psa
```matlab
wagi_psov = [12, 18, 32, 41, 5, 29];
srednia_waga_psa = _______________________
```
c) uśrednioną aktywność dla kanałów 4, 8, 15 i 26 (chodzi tutaj o uśrednienie kanałów, nie epok):
```
mean(_____________________________)
```

6 Jakiej komendy używamy do wczytywania danych EEG? Napisz kod wczytujący plik o nazwie `korelatyTeleportacji.set`?
```
EEG = ____________________________________
```

7 Funkcja poniżej powinna dostawać trzy argumenty: `a`, `b`, `c` a następnie zwracać sumę `a` i `b` pomiejszoną o `c`. Popraw błędy w kodzie poniżej:
```matlab
function szaroburo(num1, num2, num3)

out = a - b + c;
```

8 Napisz funkcję, która dostaje dwie wartości: `num1` oraz `num2`, a zwraca dwukrotność ich sumy:
```





```

### plotowanie
9 Wyobraź sobie, że masz wektor `sygnal`, który chcesz sobie wyrysować na ekranie aby lepiej zrozumieć co w nim się dzieje. Napisz najprostszą komendę rysującą ten wektor na ekranie (chodzi nie o wypisanie wartości, ale graficzną reprezentację wartości w wektorze):
```

```

10 Tym razem masz wektor `widzimrla` (na starszych telefonach funkcjonował słownik T9, który gdy wpisało się `wiewiorka` surgerował właśnie `widzimrla`), który zawiera super dane, ale musisz je wyrysować na ekranie na zielono, inaczej świat eksploduje. Napisz adekwatną komendę poniżej:
```

```

11 Prowadzisz badanie nad nową metodą odchudzania kwantowego. Masz już w matlabie wczytane dane z jednej osoby badanej w następującej postaci:
```
tydzien_odchu = [1, 3, 4, 7, 9, 12, 23, 25, 29];
waga = [85, 83, 82.5, 80, 81, 83, 88, 76, 70];
```
Twoje zadanie polega na tym aby wygenerować taki wykres, w którym na osi *x* mamy tydzień odchudzania (`tydzien_odchu`) a na osi *y* wagę (`waga`):
```

```

12 Dostajesz macierz `erpy`, zawierającą erpy dla dwóch elektrod. `erpy` jako wiersze ma kolejne elektrody, a jako kolumny - kolejne próbki w czasie. Dodatkowo masz też wektor `erpaczas`, który dla kolejnych próbek czasowych erpa informuje o faktycznym czasie tych próbek (np. pierwsza próbka czasowa była w czasie -150 ms a osiemdziesiąta w czasie 100 ms względem prezentacji bodźca).
Narysuj oba erpy na jednym wykresie tak aby erp z pierwszej elektrody był na czerwono, a dla drugiej - na zielono. Na osi *x* musi być czas.
```



```

###Pętle
13 Poniższa pętla powinna iść przez kolejne elementy wektora `lasypanstwowe` i tworzyc kolejne elementy wektora `turbosprywatyzowane` dodając do każdego elementu `lasypanstwowe` dwa. Popraw błędy w kodzie poniżej:
```matlab
for uj = 1:length(turbosprywatyzowane)
	turbosprywatyzowane(i) = lasypanstwowe(uj-1) + 2;
end 
```

14 Uzupełnij kod poniżej tak aby pętla wczytywała kolejne pliki eeg:
```matlab
lst = dir('*.set');
for k = 1:length(lst)
	________________________________
	plotuj_to(EEG);
end
