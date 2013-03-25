pdf: graphs uml
	pdflatex bbc-food-classification.tex

uml:
	plantuml bbc-food-classification.tex

graphs:
	gnuplot graphs.plot

clean:
	rm *.log *.aux *.pdf
