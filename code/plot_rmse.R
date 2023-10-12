#!/usr/bin/env Rscript

import::from(magrittr, "%>%")

args <- commandArgs(trailingOnly = TRUE)

analysisIds <- readr::read_csv("data/extended_abstract/analysisIds.csv")
rmse <- readr::read_csv("data/extended_abstract/rmse.csv")

selectedScenario <- analysisIds %>%
  dplyr::filter(
    base == args[1],
    type == args[2],
    propensityModelMisspecified == args[3],
    riskModelMisspecified == args[4],
    sampleSize == as.numeric(args[5]),
    harm == args[6],
    riskModel == args[7]
  ) %>% 
  dplyr::pull(scenario)

rmse %>% 
  dplyr::filter(scenarioId == selectedScenario) %>%
  dplyr::select(-scenarioId) %>% 
  reshape2::melt() %>%
  ggplot2::ggplot(
    ggplot2::aes(
    x = variable,
    y = value
    )
  ) +
  ggplot2::geom_boxplot() +
  ggplot2::theme_bw() +
  ggplot2::theme(
    axis.text.x = ggplot2::element_text(size = 11, angle = 45, vjust = 1, hjust = 1),
    axis.text.y = ggplot2::element_text(size = 11),
    axis.title = ggplot2::element_blank(),
    legend.position = "none"
  ) 
  ggplot2::ggsave(
    file.path(
      "figures",
      paste0(
        "scenario_",
        selectedScenario,
        ".pdf"
      )
    ),
    width = 297,
    height = 210,
    unit = "mm"
  )
  