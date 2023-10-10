data/%.csv :
	wget -O $@ https://raw.githubusercontent.com/rekkasa/hte_simulation_observational/large-files/$@


docs/extended_abstract.pdf : quarto/extended_abstract.qmd \
	data/extended_abstract/analysisIds.csv \
	data/extended_abstract/rmse.csv
	quarto render $< && mv docs/quarto/*pdf docs/ && rm -rf docs/quarto


.PHONY:
clean :
	rm docs/*pdf
	rm data/*/*csv
