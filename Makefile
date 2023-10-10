.PHONY:
all : 
	quarto render && mv docs/quarto/*pdf docs/ && rm -rf docs/quarto
