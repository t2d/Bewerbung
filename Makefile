.PHONY : main

DIR=Vorlage
MAIN=Bewerbung_Komplett
CV=cv
ANSCHREIBEN=anschreiben
LATEX=pdflatex

all: paper tidy copy

paper: 
	cd $(DIR); $(LATEX) -shell-escape $(MAIN).tex
	cd $(DIR); $(LATEX) -shell-escape $(MAIN).tex

cv: cv $(DIR)/$(CV).tex
	cd $(DIR); $(LATEX) $(CV).tex
	cd $(DIR); $(LATEX) $(CV).tex

tidy:
	cd $(DIR); rm -f *.dvi *.aux *.log *.nav *.snm *.toc *.out *.vrb *.bbl *.blg *.lof *.lot

clean:
	cd $(DIR); rm -f *.dvi *.aux *.log *.nav *.snm *.toc *.out *.vrb *.bbl *.blg *.lof *.lot $(ANSCHREIBEN).pdf $(CV).pdf $(MAIN).pdf

copy:
	cp $(DIR)/$(MAIN).pdf Bewerbung.pdf
