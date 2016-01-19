test 2
------

### adresowanie wektorów i macierzy
1 Wyobraźmy sobie, że mamy taki wektor:
```matlab
ratlerek = [11, 23, 2, 19, 8];
```
Uzupełnij komendy poniżej aby zaadresować:
a) czwarty element tego wektora
```
ratlerek(________)
```
b) element o wartości 23
```
ratlerek(________)
```
c) wszystkie elementy o nieparzystym adresie
```
ratlerek(________)
```
d) pierwszy i ostatni element
```
ratlerek(________)
```

2 Mamy następującą macierz:
```matlab
rabarbar = [5, 2, 1, 8; 6, 4, 3, 5; 6, 2, 9, 3; 6, 7, 7, 8];
```
Napisz komendy, którymi zaadresujesz:
a) element na przecięciu czwartego wiersza i drugiej kolumny
```
____________________________________
```
b) elementy na przecięciu pierwszej i trzeciej kolumny z drugim wierszem
```
____________________________________
```
c) elementy mające wartość dwa (chodzi o ich adres w macierzy `rabarbar`, nie komendę, która zadziała dla każdej macierzy)
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
d) zaadresuj macierz danych tak aby wybrać cały sygnał w czasie dla piątego kanału w trzynastej epoce.
```
EEG._____________________
```
e) zaadresuj macierz danych tak aby wybrać wszystkie epoki dla kanałów: 5, 10, 15. (cały czas)
```
EEG._____________________
```
f) zaadresuj macierz danych tak aby wybrać pierwsze 25 próbek z ostatnich czterech kanałów z co drugiej epoki
```
EEG._____________________
```

### funkcje
4 Napisz jak wykożystać funkcję `mean` aby uśrednić macierz `zorro`:
a) redukując kolumny (uśredniając wzdłuż wymiaru kolumn):
```
mean(____________)
```
b) redukując wiersze
```
mean(____________)
```

5 Jak użyjemy funkcji `mean` aby otrzymać:
a) średnią odpowiedź mózgu (niezależną od epoki) dla czterdziestego siódmego kanału:
```
mean(_____________________________)

podpowiedź: przez "niezależne od X" zwykle rozumiemy "uśredniając wszystkie X".
tak jak "jaka jest waga psa niezależnie od jego rasy" znaczy "jaka jest waga psa gdy uśrednimy rasy?" czyli po prostu "jaka jest średnia waga psa?"
```
b) średnią wagę morsa
```matlab
wagi_morsov = [12, 18, 32, 41, 5, 29];
srednia_waga_morsa = _______________________
```
c) uśrednioną aktywność dla kanałów 2, 5, 9, 21 (chodzi tutaj o uśrednienie kanałów, nie epok):
```
mean(_____________________________)
```

6 Jakiej komendy używamy do wczytywania danych EEG? Napisz kod wczytujący plik o nazwie `wesoly_mopsik.set`?
```
EEG = ____________________________________
```

7 Funkcja poniżej powinna dostawać trzy argumenty: `a`, `b`, `c` a następnie zwracać różnicę `b` i `c` tylko gdy `a` jest większe od dwóch; w innym wypadku funkcja zwraca zero. Popraw błędy w kodzie poniżej:
```matlab
function szaroburo(num1, num2, num3)

if a == num1
    out = num1 + b;
else
    0
end
```

8 Napisz funkcję, która dostaje dwa wektory wartości: `v1` oraz `v2` i plotuje czerwoną linię taką, że na osi x są wartości wektora `v1` a na osi y wartości będące trzykrotnością wektora `v2`:
```





```

### plotowanie
9 Wyobraź sobie, że masz wektor `sygnal`, który chcesz sobie wyrysować na ekranie aby lepiej zrozumieć co w nim się dzieje. Chcesz jednak aby na osi x były pokazane jednostki czasu, które masz w wektorze `czasnanas`. Napisz komendę którą otrzymasz taki rysunek:
```

```

10 Tym razem masz wektor `widzimrla` (na starszych telefonach funkcjonował słownik T9, który gdy wpisało się `wiewiorka` surgerował właśnie `widzimrla`), który zawiera super dane, ale musisz je wyrysować na ekranie na zielono, inaczej świat eksploduje. Napisz adekwatną komendę poniżej:
```


```

12 Dostajesz macierz `erpy`, zawierającą erpy dla dwóch warunków eksperymentalnych. `erpy` w kolumnach ma kolejne warunki, a w wierszach - kolejne próbki w czasie. Dodatkowo masz też wektor `czasprawdy`, który dla kolejnych próbek czasowych erpa informuje o faktycznym czasie tych próbek (np. pierwsza próbka czasowa była w czasie -150 ms a osiemdziesiąta w czasie 100 ms względem prezentacji bodźca).
Narysuj oba erpy na jednym wykresie tak aby erp z pierwszego warunku był na zielono, a dla drugiego - na czerwono. Na osi *x* musi być czas.
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
```