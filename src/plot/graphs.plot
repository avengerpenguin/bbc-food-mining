set key off

set boxwidth 1
set style fill solid 1.0 border -1
set style data histograms
set datafile separator ","

set terminal png truecolor size 800,500



set yrange [0:10000]
set ytics scale 0
set xtics scale 0 rotate offset 0.3, 0 out

set output 'top_ingredients_counts.png'
plot "top_ingredients_counts.csv" using 3:xticlabels(2)

set yrange [0:10000]
set ytics scale 0
unset xtics

set output 'ingredients_counts.png'
plot "ingredients_counts.csv" using 3:xticlabels(2)


set yrange [0:700]
set ytics scale 0
set xtics scale 0 rotate offset 0.3, 0 out

set output 'top_italian_ingredients_counts.png'
plot "top_italian_ingredients_counts.csv" using 3:xticlabels(2)

set yrange [0:1]
set ytics scale 0
set xtics scale 0 rotate offset 0.3, 0 out

set output 'top_typical_italian_ingredients.png'
plot "top_typical_italian_ingredients.csv" using 2:xticlabels(1)


set yrange [0:12000]
set ytics scale 0
unset xtics
set xtics scale 0 offset 3.5, 0 out

set output 'cuisine_set.png'
plot "cuisine_set.csv" using 2:xticlabels(1)


set yrange [0:2000]
set ytics scale 0
set xtics scale 0 rotate offset 0.7, 0 out

set xrange [ 0 : 19 ]
set output 'cuisines.png'
plot "recipes.csv" using 2:xticlabels(1)


