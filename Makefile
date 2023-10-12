data/%.csv :
	wget -O $@ https://raw.githubusercontent.com/rekkasa/hte_simulation_observational/large-files/$@

figures/scenario_13.pdf : code/plot_rmse.R
	$< risk constant true true 17000 absent control
	
figures/scenario_85.pdf : code/plot_rmse.R
	$< risk linear-high true true 17000 absent control

figures/scenario_157.pdf : code/plot_rmse.R
	$< risk quadratic-high true true 17000 absent control

figures/scenario_229.pdf : code/plot_rmse.R
	$< risk non-monotonic true true 17000 absent control

docs/extended_abstract.pdf : quarto/extended_abstract.qmd \
	data/extended_abstract/analysisIds.csv \
	data/extended_abstract/rmse.csv \
	figures/scenario_13.pdf \
	figures/scenario_85.pdf \
	figures/scenario_157.pdf \
	figures/scenario_229.pdf
	quarto render $< && mv docs/quarto/*pdf docs/ && rm -rf docs/quarto


.PHONY:
clean :
	rm docs/*pdf
	rm data/*/*csv
