#data

bp<-read.csv("blood_pressure_treatment.csv")

View(bp)
attach(bp)
library(oneR)
install.packages(c("rmarkdown", "knitr"))


# Example 1: One-sample test
set.seed(123)
data <- rnorm(30, mean = 5, sd = 2)
result <- oneR_test(data, mu = 5)
print(result)

# Example 2: Two-sample test
group1 <- rnorm(25, mean = 10, sd = 3)
group2 <- rnorm(25, mean = 12, sd = 3)
comparison <- oneR_test(group1, group2)
summary(comparison)

# Customized report
oneR_report_pdf(
  comparison,
  output_file = "detailed_analysis_comparison.pdf",
  title = "Statistical Analysis Report",
  author = "Your Name",
  include_data = TRUE
)

#paired_data
paired_result <- oneR_test(bp$baseline_sbp, bp$post_treatment_sbp, paired = TRUE)

results_df <- extract_results(paired_result)
comparison <- oneR_test(bp$baseline_sbp, bp$post_treatment_sbp)
summary(comparison)

#Visualizations

# Generate normality assessment plots
plot_normality(paired_result)

# Generate test results plots
plot_results(comparison)


# Customized report
oneR_report_pdf(
  comparison,
  output_file = "detailed_analysis.pdf",
  title = "Statistical Analysis Report",
  author = "Research Team",
  include_data = TRUE
)

# Simulate clinical trial data
set.seed(2024)
placebo <- rnorm(50, mean = 120, sd = 15)
treatment <- rnorm(50, mean = 110, sd = 15)

# Perform analysis
analysis <- oneR_test(placebo, treatment)

# Generate report
oneR_report_pdf(
  analysis,
  "clinical_trial.pdf",
  title = "Treatment Efficacy Analysis",
  author = "Research Team"
)

