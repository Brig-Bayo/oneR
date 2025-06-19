# oneR: Automated Statistical Testing with Normality Assessment

[![R](https://img.shields.io/badge/R-%3E%3D3.5.0-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

The `oneR` package provides automated statistical testing by intelligently selecting between parametric and non-parametric tests based on normality assessment. It streamlines the statistical analysis workflow while maintaining statistical rigor and providing comprehensive documentation.

## Key Features

- **🤖 Automated Test Selection**: Chooses appropriate tests based on Shapiro-Wilk normality assessment
- **📊 Comprehensive Visualization**: Generates normality plots and test result visualizations
- **📄 PDF Reporting**: Creates detailed analysis reports with all components
- **🔧 Flexible Interface**: Supports one-sample, two-sample, and paired tests
- **📈 Statistical Rigor**: Uses established statistical methods with proper implementation

## Installation

### From Source

```r
# Install required dependencies
install.packages(c("ggplot2", "gridExtra", "knitr", "rmarkdown"))

# Install oneR package from source
# (Replace with actual installation method when available)
```

### Dependencies

- R (>= 3.5.0)
- ggplot2
- gridExtra
- knitr
- rmarkdown

## Quick Start

```r
library(oneR)

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
```

## How It Works

1. **Normality Assessment**: Uses Shapiro-Wilk test to assess data normality
2. **Intelligent Test Selection**:
   - If data is normal → Parametric tests (t-tests)
   - If data is non-normal → Non-parametric tests (Wilcoxon tests)
3. **Comprehensive Output**: Provides test results, visualizations, and interpretations
4. **Professional Reporting**: Generates detailed PDF reports with all analysis components

## Function Reference

### Core Functions

| Function | Description |
|----------|-------------|
| `oneR_test()` | Main function for automated statistical testing |
| `oneR_report()` | Generate comprehensive PDF reports |
| `plot_normality()` | Create normality assessment plots |
| `plot_results()` | Create test results visualizations |

### Methods

| Method | Description |
|--------|-------------|
| `print.oneR()` | Display oneR results |
| `summary.oneR()` | Detailed summary of oneR results |
| `plot.oneR()` | Plot oneR results |
| `extract_results()` | Extract key results as data frame |

## Arguments Guide

### oneR_test() Parameters

| Parameter | Description | Default | Options |
|-----------|-------------|---------|---------|
| `x` | Primary data vector | Required | Numeric vector |
| `y` | Second group (optional) | `NULL` | Numeric vector |
| `mu` | Hypothesized mean | `0` | Numeric value |
| `alternative` | Alternative hypothesis | `"two.sided"` | `"two.sided"`, `"less"`, `"greater"` |
| `alpha` | Significance level for normality | `0.05` | 0 < α < 1 |
| `conf.level` | Confidence level for test | `0.95` | 0 < level < 1 |
| `paired` | Paired test indicator | `FALSE` | `TRUE`/`FALSE` |

### oneR_report() Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `oneR_result` | oneR test result object | Required |
| `output_file` | Output PDF file path | `"oneR_report.pdf"` |
| `title` | Report title | `"Statistical Analysis Report"` |
| `author` | Report author | `"oneR Package"` |
| `include_data` | Include raw data in report | `FALSE` |

## Examples

### Clinical Trial Analysis

```r
# Simulate clinical trial data
set.seed(2024)
placebo <- rnorm(50, mean = 120, sd = 15)
treatment <- rnorm(50, mean = 110, sd = 15)

# Perform analysis
analysis <- oneR_test(placebo, treatment)

# Generate report
oneR_report(
  analysis,
  "clinical_trial.pdf",
  title = "Treatment Efficacy Analysis",
  author = "Research Team"
)
```

### Quality Control Testing

```r
# Manufacturing measurements
measurements <- c(50.1, 49.8, 50.3, 49.9, 50.2, 50.0, 49.7, 50.4)

# Test against specification
qc_result <- oneR_test(measurements, mu = 50.0)
print(qc_result)
```

### Paired Analysis

```r
# Before/after measurements
before <- c(85, 87, 82, 90, 88, 86, 84, 89)
after <- c(88, 90, 85, 92, 91, 89, 87, 91)

# Paired test
paired_analysis <- oneR_test(before, after, paired = TRUE)
plot(paired_analysis)
```

## Statistical Methodology

### Test Selection Logic

```
Data Input
    ↓
Shapiro-Wilk Normality Test
    ↓
Normal Data? ──→ Yes ──→ Parametric Tests
    ↓                    • One-sample t-test
    No                   • Two-sample t-test
    ↓                    • Paired t-test
Non-parametric Tests
• Wilcoxon signed-rank
• Wilcoxon rank-sum
```

### Supported Tests

**Parametric Tests:**
- One-sample t-test
- Two-sample t-test (independent)
- Paired t-test

**Non-parametric Tests:**
- Wilcoxon signed-rank test (one-sample & paired)
- Wilcoxon rank-sum test (two-sample)

## Output Components

### oneR Object Contains:
- Normality test results (Shapiro-Wilk)
- Selected statistical test information
- Complete test results with p-values and confidence intervals
- Data summaries and recommendations
- Original data for plotting and reporting

### Generated Reports Include:
- Executive summary with key findings
- Data overview and descriptive statistics
- Detailed normality assessment
- Statistical test results and interpretation
- Comprehensive visualizations
- Conclusions and recommendations
- Technical details and methodology

## Best Practices

1. **Sample Size**: Minimum 3 observations required; 10-15 recommended for reliable normality assessment
2. **Data Quality**: Remove missing values and check for outliers before analysis
3. **Multiple Comparisons**: Adjust significance levels when performing multiple tests
4. **Effect Size**: Consider practical significance alongside statistical significance
5. **Assumptions**: Verify test assumptions are met for your specific data

## Troubleshooting

### Common Issues

**"Data must have at least 3 observations"**
- Ensure sufficient sample size for normality testing
- Remove missing values: `data[!is.na(data)]`

**PDF generation fails**
- Package automatically falls back to HTML reports
- Install required packages: `install.packages(c("rmarkdown", "knitr"))`

**Plots not displaying**
- Reset graphics: `dev.off()`
- Try specific plot types: `plot(result, type = "normality")`

## Contributing

We welcome contributions to the oneR package! Please feel free to submit issues, feature requests, or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Citation

If you use oneR in your research, please cite:

```
oneR: Automated Statistical Testing with Normality Assessment (2025)
Bright Boamah
R package version 1.0.0
```

## Support

For questions, issues, or feature requests, please contact the development team or submit an issue on the project repository.

---

**oneR** - Making statistical testing smarter, one test at a time! 🎯

