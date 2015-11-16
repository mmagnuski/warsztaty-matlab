
#### Przygotowanie
##### Dane
To te same dane, co wcześniej, znajdziecie je [tutaj](https://www.dropbox.com/sh/p36697ph7py06q1/AAAteqj3Oia28VeAbQCpnizba?dl=0).

##### Kod
Musicie mieć zainstalowane braintools (ściągnięte i obecne na ścieżce matlaba). Konieczne będą też funkcje z naszego repozytorium warsztaty-matlab - znajdziecie je w folderze kod.


#### ERPy po warunku
Ostatnio rysowaliśmy średnie potencjały wywołane dla osób. Teraz dla każdej osoby innym kolorem chcielibyśmy plotować erp'a na konretny warunek. Porównamy warunki 'face_0' oraz 'car_0'.

Przypominjmy sobie najpierw, że informacja o tym, która epoka należy do którego warunku znajdziemy w `EEG.epoch`:
```matlab
EEG.epoch(5)
```

Moglibyśmy napisać funkcję, która idzie przez tę strukturę i sprawdza eventy w poszukiwaniu tych, które nas interesują, ale zrobimy to na razie prościej - użyjemy gotowej funkcji.
Ze względu na to, że korzystamy ze starej wersji matlaba - `EpochDict` z **braintools** nie będzie nam działało. Skorzystamy więc z [`ktory_war`](https://github.com/mmagnuski/warsztaty-matlab/blob/master/kod/ktory_war.m):

```matlab
face_0 = ktory_war(EEG, 'face_0');
car_0 = ktory_war(EEG, 'car_0');
```

sprawdźmy czy ktory_war mówi nam prawdę:
```
EEG.epoch(face_0(1))
EEG.epoch(face_0(6))
EEG.epoch(car_0(1))
```

Teraz zmieniamy funkcję `plotuj_to` tak aby plotowała dwa warunki. Zamiast jednego plot() dodamy tam:
```matlab
% znajdujemy face_0 i car_0
face_0 = ktory_war(EEG, 'face_0');
car_0 = ktory_war(EEG, 'car_0');

% liczymy erpy
erp_face = mean(EEG(chan,:,face_0), 3);
erp_car = mean(EEG(chan,:,car_0), 3);

% plotujemy
plot(EEG.times, erp_face, 'linewidth', 2, ...
	'color', [0.8, 0.5, 0.67]);
plot(EEG.times, erp_car, 'linewidth', 2, ...
	'color', [0.5, 0.8, 0.67]);
```

#### Baseline correction
Do funkcji `plotuj_to` dodajemy baseline correction. Pamiętajmy, że `EEG.times` zawiera czas, a funkcja `find` pozwala nam znaleźć wartości prawdziwe (niezerowe), natomiast `EEG.times == 0` zwraca nam wektor prawd i fałszy.


#### FieldTrip
Umiemy więc już policzyć samemu potencjały wywołane - w przyszłości będziemy jednak korzystać do analiz z pakietu do analizy danych elektrofizjologicznych **FieldTrip**.
[Ściągamy FieldTrip'a]
