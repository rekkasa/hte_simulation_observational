docs/%.pdf : quarto/%.qmd
	quarto render $< && mv docs/quarto/*pdf docs/ && rm -rf docs/quarto

.PHONY:
all : 
	quarto render && mv docs/quarto/*pdf docs/ && rm -rf docs/quarto
clean :
	rm docs/*pdf
