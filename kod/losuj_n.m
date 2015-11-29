function elem = losuj_n(vec, n)

len = length(vec);
ind = round(rand(1, n) * (len-1) + 1);
elem = vec(ind);