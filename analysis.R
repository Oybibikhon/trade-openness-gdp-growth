# ============================================================
# Trade Openness and Economic Growth in Central Asia
# Evidence from 2000–2024
# ============================================================

# Load project data
load("project_data.RData")

# Load packages
library(ggplot2)
library(lmtest)
library(sandwich)
library(fixest)


# ============================================================
# 1. Descriptive Statistics
# ============================================================

summary(panel_data$GDP_Growth)
summary(panel_data$Trade_Openness)

summary(panel_data)


# ============================================================
# 2. GDP Growth by Country
# ============================================================

ggplot(panel_data, aes(x = Year, y = GDP_Growth, color = Country)) +
  geom_line(linewidth = 1) +
  geom_point(size = 1.5) +
  labs(
    title = "GDP Growth Across Selected Countries, 2000–2024",
    x = "Year",
    y = "GDP Growth (%)",
    color = "Country"
  ) +
  theme_minimal()

ggsave(
  "figures/gdp_growth.png",
  width = 10,
  height = 6,
  dpi = 300
)


# ============================================================
# 3. Trade Openness by Country
# ============================================================

ggplot(panel_data, aes(x = Year, y = Trade_Openness, color = Country)) +
  geom_line(linewidth = 1) +
  geom_point(size = 1.5) +
  labs(
    title = "Trade Openness Across Selected Countries, 2000–2024",
    x = "Year",
    y = "Trade Openness (%)",
    color = "Country"
  ) +
  theme_minimal()

ggsave(
  "figures/trade_openness.png",
  width = 10,
  height = 6,
  dpi = 300
)


# ============================================================
# 4. Relationship Between Trade Openness and GDP Growth
# ============================================================

ggplot(panel_data, aes(x = Trade_Openness, y = GDP_Growth)) +
  geom_point(aes(color = Country), alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Trade Openness and GDP Growth",
    x = "Trade Openness (%)",
    y = "GDP Growth (%)",
    color = "Country"
  ) +
  theme_minimal()

ggsave(
  "figures/trade_openness_gdp_growth.png",
  width = 10,
  height = 6,
  dpi = 300
)


# ============================================================
# 5. Correlation
# ============================================================

cor(
  panel_data$GDP_Growth,
  panel_data$Trade_Openness
)


# ============================================================
# 6. Simple OLS Regression
# ============================================================

model <- lm(
  GDP_Growth ~ Trade_Openness,
  data = panel_data
)

summary(model)


# ============================================================
# 7. Country Fixed Effects
# ============================================================

model_fe <- lm(
  GDP_Growth ~ Trade_Openness + factor(Country),
  data = panel_data
)

summary(model_fe)


# ============================================================
# 8. Country and Year Fixed Effects
# ============================================================

model_twfe_lm <- lm(
  GDP_Growth ~ Trade_Openness +
    factor(Country) +
    factor(Year),
  data = panel_data
)

summary(model_twfe_lm)


# ============================================================
# 9. Breusch-Pagan Test for Heteroskedasticity
# ============================================================

bptest(model_fe)


# ============================================================
# 10. Heteroskedasticity-Robust Standard Errors
# ============================================================

coeftest(
  model_fe,
  vcov = vcovHC(model_fe, type = "HC1")
)


# ============================================================
# 11. Durbin-Watson Test
# ============================================================

dwtest(model_fe)


# ============================================================
# 12. Final Two-Way Fixed Effects Model
# ============================================================

model_twfe <- feols(
  GDP_Growth ~ Trade_Openness | Country + Year,
  data = panel_data,
  vcov = "hetero"
)

summary(model_twfe)


# ============================================================
# Main Result
# ============================================================

# Trade Openness coefficient = 0.035593
# Robust p-value = 0.0021952
#
# Interpretation:
# A 1 percentage point increase in trade openness
# is associated with approximately a 0.036 percentage
# point increase in GDP growth, controlling for country
# and year fixed effects.
#
# This is an association, not evidence of causality.