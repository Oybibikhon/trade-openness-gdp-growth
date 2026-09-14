Trade Openness and Economic Growth in Central Asia
Research Question
Does greater trade openness relate to higher economic growth in Central Asian countries?
Overview
This project examines the relationship between trade openness and GDP growth in five Central Asian countries:
• Kazakhstan
• Kyrgyzstan
• Tajikistan
• Turkmenistan
• Uzbekistan
The analysis covers the period from 2000 to 2024, using a panel dataset of 125 country-year observations.
The project was developed in R as a quantitative economics research project.
Data
The dataset contains two main variables:
• GDP Growth (%) — annual percentage growth of real GDP.
• Trade Openness (%) — the combined value of exports and imports as a percentage of GDP.
The project uses data covering five countries over 25 years.
Methodology
The analysis includes:
1. Descriptive statistics
2. GDP growth trends by country
3. Trade openness trends by country
4. Correlation analysis
5. Simple OLS regression
6. Country fixed-effects regression
7. Country and year fixed-effects regression
8. Breusch-Pagan test for heteroskedasticity
9. Heteroskedasticity-robust standard errors
10. Durbin-Watson test
11. Two-way fixed-effects regression
The main specification is:
GDP Growth = Trade Openness + Country Fixed Effects + Year Fixed Effects
Heteroskedasticity-robust standard errors are used in the final model.
Main Result
The final two-way fixed-effects model estimates a coefficient of approximately 0.0356 for trade openness.
This means that, holding country-specific and year-specific effects constant, a 1 percentage point increase in trade openness is associated with approximately a 0.036 percentage point increase in GDP growth.
The estimated coefficient is statistically significant at the 1% level (p = 0.0022).
The result should be interpreted as an association rather than a causal effect.
Visualizations
The project includes three visualizations:
• GDP growth across selected countries, 2000–2024
• Trade openness across selected countries, 2000–2024
• Relationship between trade openness and GDP growth
The figures are stored in the figures/ folder.
Limitations
Several limitations should be considered.
First, the sample contains only five Central Asian countries, so the findings should not automatically be generalized to other regions.
Second, the analysis focuses on the relationship between trade openness and GDP growth and does not include all other factors that may affect economic growth.
Third, the fixed-effects specification controls for country-specific and year-specific factors but does not by itself establish causality.
Finally, the relatively small number of countries means that statistical inference should be interpreted with caution.
Project Structure
trade-openness-gdp-growth/
│
├── analysis.R
├── project_data.RData
│
└── figures/
    ├── gdp_growth.png
    ├── trade_openness.png
    └── trade_openness_gdp_growth.png
Reproducibility
The analysis can be reproduced in R using the analysis.R script and the included project_data.RData file.
Required R packages:
ggplot2
lmtest
sandwich
fixest
Run analysis.R from the project directory to reproduce the statistical analysis and figures.
Purpose
This project was developed as a quantitative economics portfolio project to demonstrate practical skills in data analysis, econometrics, visualization, and reproducible research using R.