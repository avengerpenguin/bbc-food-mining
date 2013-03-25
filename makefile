pdf: graphs uml
	mkdir -p build
	cp src/tex/*.tex build/
	cd build && pdflatex bbc-food-classification.tex

uml:
	mkdir -p build
	cp src/tex/*.tex build/
	cd build && plantuml *

graphs:
	mkdir -p build
	cp src/csv/*.csv build/
	head -n 50 src/csv/ingredients_counts.csv >build/top_ingredients_counts.csv
	head -n 50 src/csv/italian_ingredients_counts.csv >build/top_italian_ingredients_counts.csv
	head -n 50 src/csv/typical_italian_ingredients.csv >build/top_typical_italian_ingredients.csv
	cp src/plot/* build/
	cd build && gnuplot *.plot

clean:
	rm -rf build
