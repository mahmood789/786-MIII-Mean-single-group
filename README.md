# 786-MIII-Mean-single-group
Mean single group meta-analysis
# OneGroupMetaDash: An Interactive Dashboard for One-Group Meta-Analysis

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE.md)
**An R Shiny Application for Meta-Analysis of Single-Group Continuous Data (Means from CIs)**

## Overview

This application provides an interactive dashboard for conducting meta-analyses on data from single-group studies where outcomes are reported as means with confidence intervals (or other measures of precision allowing standard error derivation). This is common when synthesizing estimates like average prevalence rates, single-group outcome scores over time, or other scenarios without a direct comparison group within each primary study.

Users upload their study data (study identifier, mean, confidence interval lower bound, confidence interval upper bound) in CSV format. The application automatically calculates the standard error (SE) based on the specified confidence level and then performs the meta-analysis using the robust `rma.uni` function from the `metafor` R package [@metaforPackage].

It offers a comprehensive suite of analyses and visualizations within a user-friendly graphical interface built with Shiny [@RShiny] and `bs4Dash` [@bs4Dash], including:

* Calculation of the pooled mean estimate using various estimators (REML, DL, etc.).
* Generation of forest plots and funnel plots.
* Assessment of heterogeneity (Q, I², τ²).
* Subgroup analysis and meta-regression (if relevant variables are provided).
* Sensitivity analyses (leave-one-out, manual study removal).
* Various diagnostic and supplementary plots.

## Features

* **Data Input:** Upload study data via CSV file or use built-in sample data. Requires columns for `study`, `mean`, `lower` (CI lower bound), `upper` (CI upper bound). Optional columns: `group` (for subgroup analysis), `covariate` (for meta-regression).
* **Standard Error Calculation:** Automatically calculates study-specific standard errors (`sei`) from the provided `lower` and `upper` CI bounds and the selected confidence level.
* **Meta-Analysis Core:** Performs random-effects (or fixed-effect) meta-analysis using `metafor::rma.uni`. Users can select the heterogeneity variance estimator (`method` argument in `rma.uni`, e.g., REML, DL, HE, SJ, ML).
* **Results Display:** Shows detailed `rma.uni` summary output, extracted pooled mean and confidence interval, heterogeneity statistics (Q, I², τ²), significance test results, and prediction interval.
* **Forest Plots:** Generates standard forest plots using `metafor::forest` with customizable labels, title, and axis limits.
* **Funnel Plots:** Creates funnel plots (`metafor::funnel`) to help assess publication bias, with customizable labels and axis limits.
* **Subgroup Analysis:** Performs meta-analysis comparing subgroups if a `group` column is provided (using `mods = ~ factor(group)` in `rma.uni`). Displays results and generates separate forest plots for each subgroup.
* **Meta-Regression:** Conducts simple meta-regression if a `covariate` column is provided (using `mods = ~ covariate` in `rma.uni`).
* **Diagnostics & Sensitivity:**
    * Displays heterogeneity statistics (Q, I², H², Tau²).
    * Provides leave-one-out analysis results using `metafor::leave1out`.
    * Generates Baujat plots (`metafor::baujat`) to identify influential studies regarding heterogeneity and effect size.
    * Allows users to manually remove one study and see the impact on the pooled result.
* **Additional Analyses & Plots:**
    * Cumulative meta-analysis sorted by effect size (`metafor::cumul`).
    * Comparison with a fixed-effect model (`metafor::rma.uni(method = "FE")`).
    * Basic descriptive plots of input means (histogram, density plot using base R and `ggplot2` [@ggplot2]).
    * Forest plot sorted by study means.
* **Data Preview & Export:**
    * Displays the input data using `DT` [@DT].
    * Allows downloading the sample data format.
    * Provides download buttons for all generated plots (PNG) and key results tables (TXT - via copy/paste from verbatim outputs).

## Installation

**Prerequisites:**

* R (version 4.0 or later recommended).
* RStudio (Recommended IDE).
* Google Chrome / Chromium (recommended for `shinytest2`).

**Steps:**

1.  **Clone the Repository:**
    https://github.com/mahmood789/786-MIII-Mean-single-group/tree/main

2.  **Install Dependencies:**
    This project uses `renv` for package management.
    * Open the project in R/RStudio.
    * Run `renv::restore()` in the R console to install packages listed in `renv.lock` (if provided).
    * **Required Packages:** `shiny`, `bs4Dash`, `metafor`, `readr`, `ggplot2`, `DT`. Ensure these are installed if not using `renv`.

## Usage

1.  **Launch the Application:**
    Open R/RStudio in the project directory and run:
    ```R
    shiny::runApp()
    ```

2.  **Prepare Input Data:**
    * Create a CSV file.
    * **Required Columns:**
        * `study` (character/factor): Unique identifier for each study.
        * `mean` (numeric): The reported mean or estimate for the single group.
        * `lower` (numeric): The lower bound of the confidence interval for the mean.
        * `upper` (numeric): The upper bound of the confidence interval for the mean.
    * **Optional Columns:**
        * `group` (character/factor): Categorical variable for subgroup analysis.
        * `covariate` (numeric): Continuous variable for meta-regression.
    * *(See `sample_data_onegroup.csv` provided in the repository or download via the app)*

3.  **Upload Data & Set Options:**
    * Go to the "Data & Setup" tab.
    * Upload your CSV or use the default sample data.
    * Select the **Confidence Level** corresponding to the `lower` and `upper` bounds in your data (e.g., 95%). This is used to calculate the standard error.
    * Choose the `metafor::rma` **Estimation Method** for the random-effects model (e.g., REML).

4.  **Explore Results:**
    * Navigate the tabs to view the main results, plots, diagnostics, and advanced analyses.
    * Use download buttons to save outputs.

## Sample Data

A sample CSV file (`sample_data_onegroup.csv`) is included in this repository and can also be downloaded from the "Data & Setup" tab within the app.

## Testing

*(Implement automated tests using `testthat` and `shinytest2`)*

Automated tests verify the core functionality, including standard error calculation, `rma.uni` execution with different methods, and plot generation.

1.  Ensure testing packages (`testthat`, `shinytest2`) are installed (e.g., via `renv::restore(prompt = FALSE)` if included, or `install.packages(c("testthat", "shinytest2"))`).
2.  Open R in the project root directory.
3.  Run tests using:
    ```R
    # Run all tests in tests/testthat/
    testthat::test_dir("tests/testthat/")

    # Or specifically run shinytest2 application tests
    # shinytest2::test_app()
    ```

## Contributing
 Please submit these via the [repository issue tracker]([Link to your repository issues page, e.g., https://github.com/your_username/OneGroupMetaDash/issues]).



## Authors

* Mahmood Ahmad, MBBS
* Abdullahi Noori, MBBS
* Parichatra Homhuan, MBBS
* Manpreet Kour, MBBS
* Kaleem Asad, MBBS

## Acknowledgements

We acknowledge the support and encouragement from the Ahmadiyya Muslim Research Association and Luciano Candilio.

## License

This project is licensed under the Apache License, Version 2.0 - see the [LICENSE.md](LICENSE.md) file for details. *(Ensure LICENSE.md exists and contains the Apache 2.0 text)*

## Citation

If you use this software, please cite it as follows:

*(Placeholder - Replace with JOSS paper citation once accepted)*
> Ahmad M., Noot A., Homhuan P., Kour M. (2025). OneGroupMetaDash: An R Shiny Dashboard for Single-Group Meta-Analysis of Means. *Journal of Open Source Software*, [Volume]([Issue]), [ArticleNumber]. [https://doi.org/[JOSS_DOI]]()

*(Replace bracketed info upon publication)*

Please also cite the core R packages used: `metafor` [@metaforPackage], R [@RCoreTeam], Shiny [@RShiny], bs4Dash [@bs4Dash], etc. Refer to their documentation for preferred citation formats (e.g., `citation("metafor")`).
