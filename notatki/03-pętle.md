## Zajęcia 3 - erpy, ploty i wstęp do pętli

#### Wstęp
* kartkóweczka
* wątpliwości i pytania słowem nie do opisania

#### Dane
Dane znajdziecie [tutaj](https://www.dropbox.com/sh/p36697ph7py06q1/AAAteqj3Oia28VeAbQCpnizba?dl=0).

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

#### Ćwiczenia
**ćwiczenie 1**  
Mamy dwa wektory:
```matlab
A = [3,1,6,9,11,8]
B = zeros(size(A))
```
Napisz pętlę, która bierze kolejne elementy z wektora A, dodaje do nich 3 i wynik umieszcza w kolejnym elemencie B.

**ćwiczenie 2**  
Mamy wektor:
```matlab
A = randi(100, 1, 1000)
```
Napisz pętlę, która tworzy wektor C, taki że jego kolejne elementy to sumy kolejnych sąsiadujących elementów z wektora A.
Na przykład powinny zachodzić zależności:
```matlab
C(1) == A(1) + A(2)
C(3) == A(3) + A(4)
```
