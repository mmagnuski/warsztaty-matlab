# Zajęcia na których nie zrobiliśmy wiele

## Kwestie początkowe
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
Niedługo w bibliotece komputery będą wyposażone w matlaba.

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

(tu okazało się że mało kto oglądał w całości tutorial)
(więc dalej przerobiliśmy pokrótce to, co było w tutorialu)