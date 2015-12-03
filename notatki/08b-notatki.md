# Analiza grupowa

## Wstęp

#### Czy wszystko działa? (ok 10 min)
Sprawdźcie czy na waszym komputerze:
* działa internet
* gdy włączycie command prompt (start -> cmd -> enter) po wpisaniu w nim
* startup skrypt włącza się automatycznie przy włączeniu matlaba
* skrypt startup'owy działa

Gdyby nie działał Wam poprawnie git (punkt 2 w powyższej liście), wejdźcie do pliku `startup.m` np przez komendę:
```matlab
edit startup.m 
```
i zmieńcie wszystkie linijki z `!git pull` na `!D:\Git\git-cmd.exe git pull`.
Jeżeli macie gita zainstalowanego właśnie w folderze `D:\Git` - git powinien teraz dobrze działać przy startupie.

#### Sprawy organizacyjne
Cicho na Githubie w sprawie poprawy :sad:


## Pierwsze zadanie (max 10-15 minut)
Pierwsze dzisiejsze zadanie opiera się na video tutorialu, który mieliście mam nadzieję obejrzeć. W notatkach z poprzednich zajęć znajdziecie kod, który był efektem końcowy tutorialowych zmagań. W folderze kod tego repozytorium jest natomiast kod funkcji `losuj_n`, także tą funkcją nie musicie się przejmować.
Waszym zadaniem jest zmienić kod tej pętli tak aby losowane triale były tylko z jednego warunku np. tylko `face_0`. 
Podpowiedzi:
- przyda się Wam funkcja `ktory_war`:
  ```matlab
  ind = ktory_war(EEG, 'face_0');
  ```
- kod musi sprawdzić ile jest triali w wybranyn przez Was warunku - najprawdopodobniej jest ich mniej niż 100, więc musicie adekwatnie zmienić zakres `t` w nadrzędnej pętli.
- w razie niejasności bądź innych trudności - pytajcie się!

## Delikatne wprowadzenie teoretyczne do analiz grupowych
Tutaj was chwilkę pozanudzam albo wręcz entuzjazm wzniecę - kto to wie?

## Praktyczne starcie z analizą grupową
Piersze starcie z analizą grupową będzie łagodne. Nie będziecie musieli specjalnie dużo pisać samemu. Odpwoiednie ustawienie danych i zdefiniowanie konfiguracji (struktura `cfg` dla fieldtripa) jest wykonywane przez funkcę `licz_stat`, którą Wam napisałem. Dopiero później po wstępnym oswojeniu się z analizą grupową zanurkujemy w kwestie własnoręcznego definiowania fieldtripowi tego, co chcemy osiągnąć.

### wczytujemy odpowiednio dane
Aby `fieldtrip` ogarnął co za dane dostaje (które osoby przynależą do którego warunku itp.) trzeba mu o tym powiedzieć tworząc i podając mu strukturę `cfg`. Na razie to za Was robi `licz_stat` więc pliki 