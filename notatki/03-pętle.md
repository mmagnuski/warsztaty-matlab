## Zajęcia 3 - pętle

#### Wstęp
* kartkóweczka
* wątpliwości i pytania słowem nie do opisania

#### struktury (EEG)
* uruchamianie eeglaba (po uruchomieniu możemy zrobić `clear` bo eeglab wrzuca nam do workspace'a dużo śmieci)
* nawigowanie po folderach z poziomu matlaba
* import i przeglądanie danych eeg
  - `pop_loadset()`
  - `pop_eegplot()`
* poznajemy struktury, krótkie intro z adresowania:
  ```matlab
  % struktury mogą mieć wiele pól o konkretnych nazwach
  fields(EEG)

  % w przypadku eeglabowej struktury jednym z najważniejszy pól
  % jest pole data - tam znajduje się cały zapis sygnału
  % do pól struktury dostajemy się tak: nazwa_struktury.nazwa_pola
  EEG.data

  % w polu data jest macierz z danymi (ale jest ona 3D - elektrody x czas x epoki)
  % możemy w związku z tym adresować pole data tak jak macierz
  EEG.data(12, :, 1) % <- 12 elektroda, cały czas, pierwsza epoka
  
  % trochę bardziej skomplikowana sytuacja: struktura w strukturze:
  EEG.event
  
  % struktura event to taka kartoteka wydarzeń w sygnale (np. prezentacja
  % bodźca czy odpowiedź osoby badanej) - ma tyle 'kart' ile wydarzeń
  % a każda z kart ma pola opisujące dane wydarzenie:
  EEG.event(2).type
  EEG.event(2).latency
  ```

#### ERP
* jak zrobić ERPa?
  - z wykorzystaniem interfejsu i `eegh`
  - za pomocą funkcji `mean()`
* robimy funkcję, która liczy i ładnie rysuje erpa z danych
  - poznajemy `xlabel` i `ylabel`
  - ew. zmieniamy `FontSize`, `LineWidth`


#### automatyzacja - pętle

* teraz chcielibyśmy z automatu zrobić to samo dla wszystkich osób badanych:
  - wczytać dane
  - policzyć erpa
  - wyświetlić

* pętla nas wybawi! (hymn samobójców)

Ale po kolei, najpierw najprostszy przykład:
```matlab
i = 5;
i
i = 6;
i
```

Jak to zautomatyzować?
```matlab
for i = 1:10
	i
end
```

Dlaczego pętla (loop)?
Powtarzamy te same instrukcje zmieniając jeden parametr - instrukcje są więc zapętlone.

Możemy wykorzystać `i` w pętli również nieco sprytniej!
Zauważmy co się dzieje tutaj:

```matlab
A = [5, 10, 15];
length(A)
```

Wykorzystamy to tak:
```matlab
for i = 1:length(A)
	A(i)
end
```

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
pliki = dir('C:')
```

Dalej:
- dzięki `dir` dostajemy listę plików taką jak ta przy ostatniej pętli
- w związku z tym możemy skorzystać z pętli i po kolei podawać nazwy plików do funkcji `pop_loadset` - a następnie do naszej funkcji `plotuj_to`
- gdy nasza pętla będzie już działać doświadczycie magicznego momentu `sit back and relax` vel `możesz wyjść z psem na spacer` - kiedy to komputer się za Was męczy, a Wy możecie odpocząć.
