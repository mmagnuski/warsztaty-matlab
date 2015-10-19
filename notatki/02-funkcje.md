## Funkcje

Funkcje zmieniają nam dane. Robią za nas ciężką robotę.  
**Funkcje są naprawdę fajne!**  
`dane -> funkcja -> dane`  

Funkcje przyjmują argumenty. Tzn. te dane, które podajemy funkcji nazywamy `argumentami`, tak wywołujemy funkcje z argumentami:
```
nazwa_funkcji(argument1, argument1, ...)
```

Funkcje zwykle coś nam zwracają (przekształcone dane na przykład), w związku z tym możemy (ale nie musimy) zapisywać wynik operacji funkcji do zmiennej, np:
```matlab
super_wyniki = nazwa_funkcji(argument1, argumetn2);
```

Aby wszystko stało się jaśniejsze, przerobimy kilka konkretnych przykładów.  
**Suma** to funkcja - przyjmuje szereg wartości, czyli *wektor* (to pierwszy argument tej funkcji).
```matlab
x = [4 9 6 2 3]
sum(x)
```

**Średnia** to również funkcja - przekształca nam szereg wartości na średnią wartość. Średnia przyjmuje jeden argument - wektor liczb:
```matlab
x = [1 2 5 3 7];
mean(x)
```

Zarówno średnia jak i suma mogą operować na *macierzach* - wtedy domyślnie sumowana/uśredniana jest każda kolumna:
```matlab
A = [1 2 3; 1 1 1; 3 2 1]
sum(A)
```

Możemy jednak użyć nieobowiązkowego drugiego argumentu aby sumować wzdłuż innego wymiaru. Pierwszy wymiar to wiersze, drugi kolumny, sumowanie wzdłuż drugiego wymiaru tzn. wzdłuż wymiaru kolumn to to samo co sumowanie wierszy (tzn. wartości wewnątrz wierszy):
```matlab
A = [1 2 3; 1 1 1; 3 2 1]

% sumujemy wzdłuż drugiego wymiaru (tzn. wewnątrz pierwszego)
sum(A, 2)

% sumujemy wzdłuż pierwszego wymiaru
sum(A, 1)
```

Różne funkcje przyjmują różne parametry i robią z nimi różne rzeczy. Aby dowiedzieć się co robi dana funkcja możemy wyswietlić jej pomoc"
```matlab
% wyświetlamy pomoc jako tekst w command window:
help median

% wyświetlamy w oddzielnym oknie w bogatszym formacie:
doc median
```

### Dalszy plan:  
* przetestujcie sobie funkcje: `who`, `whos`, `clc`, `why`
* przypominamy sobie zakresy (`0:0.05:10`) oraz poznajemy funkcję `linspace`  

  ```matlab
  doc linspace
  x = linspace(-10, 10, 2001)
  ```  

* funkcja `sin()` oraz funkcja `plot()`, a także zagnieżdżanie funkcji `plot(sin(x));`
* `plot()` przyjmuje dodatkowe argumenty np. `plot(x, sin(x), 'r--')`
* krótkie przypomnienie o tym, że w matlabie ścieżki przeszukiwania są ważne: `addpath()`, `pathtool`
* piszemy swoją pierwszą funkcję - `matrix_screen` do zalewania ekranu potokiem liczb rodem z matrixa
  Definiując funkcję na początku zawsze piszemy:

  ```matlab
  function nazwa_funkcji(argumenty)
  ```
  
  To informacja dla matlaba, że:
  * definiujemy funkcję (`function`)
  * funkcja ta ma konkretną nazwę (`nazwa_funkcji`)
  * funkcja ta przyjmuje pewne argumenty (`argumenty`)
  
  Gdy tworzymy naszą drugą funkcję, `add_nums` musimy ją zdefiniować trochę inaczej, ponieważ będzie ona zwracać pewien rezultat:  
  ```matlab
  function co_zwraca = nazwa_funkcji(argumenty)
  ```  

  W naszym wypadku (funkcja `add_num`) zwracana zmienna będzie się nazywać `suma`, nazwa funkcji to natomiast `add_nums` a argumenty są dwa, nazwiemy je `num1` oraz `num2`, piszemy więc:  

  ```matlab
  function suma = add_nums(num1, num2)
  ```  

* rozbudowujemy naszą funkcję i poznajemy stwierdzenie warunkowe `if`, przy okazji dowiadujemy się że poprzez komendę `exist('num2', 'var')` możemy sprawdzić czy zmienna o nazwie `num2` istnieje. Możemy sprawdzić też:  

  ```matlab
  exist('god')
  ```

* piszemy nieco trudniejszą funkcję `ktora_wieksza`
