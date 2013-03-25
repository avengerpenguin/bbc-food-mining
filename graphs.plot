set key off

set boxwidth 1
set style fill solid 1.0 border -1
set style data histograms
set datafile separator ","

set terminal png truecolor size 800,500



set yrange [0:12000]
set ytics scale 0
set xtics scale 0 offset 3.5, 0 out

set output 'cuisine_set.png'
plot "cuisine_set.csv" using 2:xticlabels(1)




set yrange [0:2000]
set ytics scale 0
set xtics scale 0 rotate offset 0.7, 0 out

set xrange [ 0 : 19 ]
set output 'cuisines.png'
plot "recipes.csv" using 2:xticlabels(1)
