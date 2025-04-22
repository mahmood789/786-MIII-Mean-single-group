---
# IMPORTANT: Update Title, Authors, Affiliations, Date, and Bibliography file name.
title: 'OneGroupMetaDash: An Interactive Tool for Single-Group Meta-Analysis in R'
tags:
  - R
  - Shiny
  - meta-analysis
  - systematic review
  - evidence synthesis
  - continuous outcomes
  - single-arm study
  - metafor
  - research software
authors:
  # List authors who meet JOSS contribution criteria
  - name: Mahmood Ahmad
  - name: Abdullahi Noori # Correct spelling if needed

  - name: Parichatra Homhuan
 
  - name: Manpreet Kour # Correct spelling if needed
 - name: Kaleem Asad # Correct spelling if needed
affiliations:
 - name: Royal Free Hospital
   London, UK
# Add more affiliations if needed
date: 22 April 2025 # Set to submission date
bibliography: paper.bib # Ensure this matches your BibTeX file name

---

# Summary

We developed `OneGroupMetaDash`, an R [@RCoreTeam] Shiny [@RShiny] web application designed to simplify meta-analyses of single-group continuous data. Often, studies report a mean outcome with a confidence interval rather than a standard deviation. Our tool allows researchers to directly input these values (`mean`, `lower` CI bound, `upper` CI bound) from multiple studies via a CSV file. It automatically calculates the standard error based on the chosen confidence level and then performs a meta-analysis using the robust `rma.uni` function from the `metafor` package [@metaforPackage]. `OneGroupMetaDash` provides an interactive dashboard to visualize results (forest plots, funnel plots), assess heterogeneity ($I^2$, $\tau^2$), check for influential studies (Baujat plots [@Baujat2002], leave-one-out analysis), investigate moderators using meta-regression, and conduct subgroup analyses. The goal is to provide an accessible and efficient tool for researchers performing evidence synthesis on single-group summary statistics.

# Statement of Need

Synthesizing evidence from single-group studies (e.g., calculating a pooled prevalence, average score, or baseline characteristic) is a common task. When primary studies report means and confidence intervals, researchers must first manually calculate the standard error for each study before using meta-analysis software like `metafor` [@metaforPackage] in R. This calculation, while straightforward, adds an extra step that can be tedious and prone to errors when handling many studies. Furthermore, conducting the subsequent analyses (heterogeneity checks, bias assessment, subgroup analysis, visualizations) typically requires familiarity with R scripting and the specific syntax of packages like `metafor`.

We created `OneGroupMetaDash` to streamline this entire workflow. By inputting means and CI bounds directly, users bypass the need for manual SE calculation. The app provides a graphical interface to the powerful `rma.uni` function and related diagnostics from `metafor`, making these methods accessible without requiring users to write R code. This is particularly helpful for students learning meta-analysis, researchers less comfortable with programming, or anyone needing to quickly explore single-group data, check for heterogeneity, and visualize results. It integrates the necessary steps – from data input (mean/CI) to analysis and diagnostics – into one user-friendly tool.

# Functionality

`OneGroupMetaDash` is built using `bs4Dash` [@bs4Dash] providing a tabbed interface for different analysis stages.

**Workflow:**
Users upload a CSV file with columns `study`, `mean`, `lower`, `upper`, and optional `group`, `covariate`. On the "Data & Setup" tab, they select the confidence level that corresponds to the uploaded `lower` and `upper` bounds (e.g., 95%) which allows the app to calculate the standard error (`sei`) using the formula $SE = (upper - lower) / (2 \times Z_{1-\alpha/2})$. They also choose the `metafor::rma.uni` estimation method (e.g., REML, DL).

The application then provides results across several tabs:

* **Main Meta:** Shows the full `summary()` output from `rma.uni`, highlighting the pooled mean estimate (`b`), its confidence interval (`ci.lb`, `ci.ub`), prediction interval (`predict()`), heterogeneity statistics (`QE`, `QEp`, `I2`, `tau2`), and the test for the pooled effect (`pval`). Basic interpretations are also provided.
* **Forest & Funnel:** Displays a standard forest plot (`metafor::forest`) showing individual study means and the pooled result, with options to customize labels and axes. A funnel plot (`metafor::funnel`) is also generated to help visually assess publication bias.
* **Subgroup & Regression:** If a `group` column is provided, it performs a test for subgroup differences using `rma.uni(mods = ~ factor(group), ...)` and shows the results. It also generates separate forest plots for each subgroup by running `rma.uni` on filtered data. If a `covariate` column exists, it runs a simple meta-regression (`rma.uni(mods = ~ covariate, ...)`) and displays the summary.
* **Diagnostics & Sensitivity:** Presents heterogeneity statistics (Q, I², H², Tau²) numerically. It includes leave-one-out analysis results from `metafor::leave1out` and a Baujat plot (`metafor::baujat`) to identify influential studies. Users can also manually select a study to exclude and see the re-calculated pooled result for sensitivity analysis.
* **Additional Analyses:** Shows a cumulative meta-analysis (`metafor::cumul`) ordered by effect size and allows comparison with a fixed-effect model (`rma.uni(method="FE")`).
* **Advanced Plots:** Provides basic descriptive plots of the input means, including a histogram (`hist()`) and density plot (`density()`), plus a forest plot sorted by the input means.

Download buttons are available for key plots (PNG) and numerical outputs can be copied from the text displays.

# Availability

**Operating system:** Platform independent (requires R).
**Programming language:** R (>= 4.0 recommended)
**Dependencies:** shiny, bs4Dash, metafor, readr, ggplot2, DT. *(Optional: dmetar if specific functions are re-introduced)*.
**Installation & Reproducibility:** Includes an `renv.lock` file [@renv] allowing users to restore the package environment using `renv::restore()`. Installation details are in the README.
**License:** Apache License 2.0. *(Confirm this is the license used in LICENSE.md)*
**Source Code Repository:** https://github.com/mahmood789/786-MIII-Mean-single-group/new/main
**Archived Version:** [Link to Zenodo/Figshare DOI - Add upon JOSS acceptance]

# Acknowledgements

We thank the Ahmadiyya Muslim Research Association and Luciano Candilio for their support.

# References

*(References are managed in the paper.bib file. Ensure entries exist for all cited packages and methods)*
