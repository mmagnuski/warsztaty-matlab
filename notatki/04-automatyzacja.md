# Zajęcia 4 - pętle i automatyzacja

1. Lista obecności

2. Pytania dotyczące pętli i ostatnich zajęć

3. Ćwiczenia

* **Ćwiczenie 1**
  Utwórz wektor 500 losowych wartości całkowitych z przedziału 10 - 50:
  ```matlab
  wektor = randi([10, 50], 1, 500);
  ```
  Na podstawie wektora `wektor` utwórz wektor `test`, który jest tej samej długości co `wektor`. `test` ma zawierać jedynki tam, gdzie wartość wektora `wektor` jest większa od 30, wszędzie indziej powinien mieć zera.
  Dla przykładu:
  * jeżeli `wektor` to: `wektor = [10, 43, 28, 31, 39, 42];`
  * wtedy `test` wygląda tak: `test = [0, 1, 0, 1, 1, 1];`

* **Ćwiczenie 2**
  Utwórz wektor tysiąca losowych zer i jedynek `v` za pomocą komendy:
  ```matlab
  v = round(rand(1, 1000));
  ```
  W oparciu o wektor `v` utwórz wektor `kaczka`, którego kolejne elementy
  zawierają adres kolejnych jedynek wektora `v`, tzn.:
  * jeżeli `v = [0, 0, 1, 0, 1, 1, 0, 1];`
  * wtedy `kaczka = [3, 5, 6, 8];`
  `kaczka` mówi nam więc gdzie w wektorze `v` są jedynki.

#### Automatyzacja wczytywania i przetwarzania plików
Gdybyśmy tylko mieli liste plików moglibyśmy zrobić to, co chcemy pętlą!
```matlab
% stwórzmy najpierw hipotetyczną listę plików
lista(1).name = 'plik1.set';
lista(2).name = 'plik2.set';
lista(3).name = 'plik3.set';

% zauważmy że length działa także dla struktur:
length(lista)

% teraz możemy to zrobić tak
for s = 1:length(lista)
	lista(s).name
end
```

Zobaczmy co daje nam funkcja `dir`
```matlab
pliki = dir('C:\')
```

Dalej:
- dzięki `dir` dostajemy listę plików taką jak ta przy ostatniej pętli
- w związku z tym możemy skorzystać z pętli i po kolei podawać nazwy plików do funkcji `pop_loadset` - a następnie do naszej funkcji `plotuj_to`
- gdy nasza pętla będzie już działać doświadczycie magicznego momentu `sit back and relax` vel `możesz wyjść z psem na spacer` - kiedy to komputer się za Was męczy, a Wy możecie odpocząć.

- zanim przejdziemy dalej poznamy macierze komorkowe. Tak jak wektory pozwalaja nam przetrzymywac w uporzadkowany sposob kolejne wartosci, macierze komorkowe przetrzymuja cale obiekty:
  ```matlab
  mackom = cell(3,1);
  mackom{1} = [1, 5, 8, 2];
  mackom{2} = 'wombat';
  mackom{3} = rand(4,4);
  ```
  
- sprobujemy teraz wczytac za pomoca petli pliki eeg do kolejnych komorek macierzy komorkowej. Sama czesc do wczytywania kolejnych osob pozostaje taka sama, kod wyglada tak:
  ```matlab
  fls = dir('*.set');
  num_files = length(fls);
  eeg = cell(num_fls, 1);
  for i = 1:num_fls
  	eeg{i} = pop_loadset(fls(i).name);
  end
  ```
