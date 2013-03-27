pdf: graphs uml tagclouds trees
	mkdir -p build
	cp src/tex/*.tex src/tex/*.bib build/
	cd build && pdflatex bbc-food-classification.tex
	cd build && bibtex bbc-food-classification.aux
	cd build && pdflatex bbc-food-classification.tex
	cd build && pdflatex bbc-food-classification.tex

uml:
	mkdir -p build
	cp src/tex/*.tex build/
	cd build && plantuml *

python:
	mkdir -p build
	cp src/python/*.py build/

csv:
	mkdir -p build
	cp src/csv/*.csv build/

dot:
	mkdir -p build
	cp src/dot/*.dot build/

tagclouds: csv python
	cd build && python tagcloud.py ingredients_counts.csv 1 2 ingredients_counts.png
	cd build && python tagcloud.py asian_ingredients_counts.csv 1 2 asian_ingredients_counts.png
	cd build && python tagcloud.py italian_ingredients_counts.csv 1 2 italian_ingredients_counts.png
	cd build && python tagcloud.py indian_ingredients_counts.csv 1 2 indian_ingredients_counts.png
	cd build && python tagcloud.py christmas_ingredients_counts.csv 1 2 christmas_ingredients_counts.png
	cd build && python tagcloud.py burns_night_ingredients_counts.csv 1 2 burns_night_ingredients_counts.png

graphs: csv
	head -n 50 src/csv/ingredients_counts.csv >build/top_ingredients_counts.csv
	head -n 50 src/csv/italian_ingredients_counts.csv >build/top_italian_ingredients_counts.csv
	head -n 50 src/csv/typical_italian_ingredients.csv >build/top_typical_italian_ingredients.csv
	cp src/plot/* build/
	cd build && gnuplot *.plot

trees: dot
	cd build && dot -Tpng tree.dot >tree.png

clean:
	rm -rf build
