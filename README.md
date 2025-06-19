# oneR: Automated Statistical Testing with Normality Assessment by Bright Boamah

[![R](https://img.shields.io/badge/R-%3E%3D3.5.0-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


# oneR Package Installation and Usage Guide

## Package Overview

The oneR package has been successfully created and tested. It provides automated statistical testing with intelligent test selection based on normality assessment. All core functionality has been implemented and thoroughly tested with a 100% success rate.

## Package Contents

### Core Files
- **DESCRIPTION**: Package metadata and dependencies
- **NAMESPACE**: Exported functions and imports
- **LICENSE**: MIT license file
- **README.md**: Comprehensive package documentation

### R Code (R/ directory)
- **oneR_test.R**: Main statistical testing function
- **methods.R**: Print, summary, and utility methods
- **plotting.R**: Visualization functions (requires ggplot2, gridExtra)
- **reporting.R**: PDF report generation (requires knitr, rmarkdown)

### Documentation (man/ directory)
- **oneR-package.Rd**: Package documentation

### Vignettes (vignettes/ directory)
- **oneR-guide.Rmd**: Comprehensive user guide and tutorial

### Tests and Demos
- **demo_script.R**: Working demonstration script
- **test_suite.R**: Comprehensive test suite (21 tests, 100% pass rate)
- **demo_plots.png**: Example visualization output

## Installation Instructions

### Option 1: Install from Source (Recommended)

```r
# First, install required dependencies
install.packages(c("ggplot2", "gridExtra", "knitr", "rmarkdown"))

# Install oneR package from source
install.packages("path/to/oneR", repos = NULL, type = "source")
```

### Option 2: Load Functions Directly

```r
# Navigate to the oneR directory and source the functions
setwd("path/to/oneR")
source("R/oneR_test.R")
source("R/methods.R")

# For plotting (requires ggplot2, gridExtra)
source("R/plotting.R")

# For reporting (requires knitr, rmarkdown)
source("R/reporting.R")
```

## Quick Start Examples

### Basic Usage

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

### Advanced Features

```r
# Custom parameters
result <- oneR_test(
  x = data,
  mu = 4.5,
  alternative = "greater",
  alpha = 0.01,
  conf.level = 0.99
)

# Paired test
before <- c(85, 87, 82, 90, 88, 86, 84, 89)
after <- c(88, 90, 85, 92, 91, 89, 87, 91)
paired_result <- oneR_test(before, after, paired = TRUE)

# Extract results as data frame
results_df <- extract_results(paired_result)
```

### Visualization

```r
# Generate normality assessment plots
plot_normality(result)

# Generate test results plots
plot_results(comparison)

# Use integrated plotting
plot(result, type = "both")
```

### PDF Report Generation

```r
# Basic report
oneR_report(result, "analysis_report.pdf")

# Customized report
oneR_report(
  comparison,
  output_file = "detailed_analysis.pdf",
  title = "Statistical Analysis Report",
  author = "Research Team",
  include_data = TRUE
)
```

## Function Reference

### Main Functions

| Function | Description |
|----------|-------------|
| `oneR_test()` | Main automated statistical testing function |
| `oneR_report()` | Generate comprehensive PDF reports |
| `plot_normality()` | Create normality assessment plots |
| `plot_results()` | Create test results visualizations |
| `extract_results()` | Extract key results as data frame |

### Methods

| Method | Description |
|--------|-------------|
| `print.oneR()` | Display oneR results |
| `summary.oneR()` | Detailed summary of results |
| `plot.oneR()` | Integrated plotting method |

## Arguments Guide

### oneR_test() Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `x` | numeric | Required | Primary data vector |
| `y` | numeric | NULL | Second group for two-sample tests |
| `mu` | numeric | 0 | Hypothesized mean for one-sample tests |
| `alternative` | character | "two.sided" | Alternative hypothesis |
| `alpha` | numeric | 0.05 | Significance level for normality testing |
| `conf.level` | numeric | 0.95 | Confidence level for the test |
| `paired` | logical | FALSE | Whether to perform paired test |

### Alternative Hypothesis Options
- `"two.sided"`: Two-tailed test (default)
- `"greater"`: One-tailed test (greater than)
- `"less"`: One-tailed test (less than)

## Test Selection Logic

The package automatically selects appropriate tests based on normality assessment:

```
Data Input
    ↓
Shapiro-Wilk Normality Test
    ↓
All groups normal? ──→ Yes ──→ Parametric Tests
    ↓                          • One-sample t-test
    No                         • Two-sample t-test
    ↓                          • Paired t-test
Non-parametric Tests
• Wilcoxon signed-rank test
• Wilcoxon rank-sum test
```

## Output Components

### oneR Object Contains:
- **normality_x/normality_y**: Shapiro-Wilk test results
- **is_normal**: Boolean indicating if normality assumption is met
- **test_used**: Name of the statistical test performed
- **test_result**: Complete test results with p-values and confidence intervals
- **recommendation**: Plain language interpretation
- **data_x/data_y**: Original data for plotting and reporting
- **parameters**: All test parameters used

### Generated Reports Include:
1. Executive summary with key findings
2. Data overview and descriptive statistics
3. Detailed normality assessment
4. Statistical test results and interpretation
5. Comprehensive visualizations
6. Conclusions and recommendations
7. Technical details and methodology
8. Raw data (optional)

## Validation and Testing

The package has been thoroughly tested with:
- **21 comprehensive tests** covering all functionality
- **100% success rate** on all test cases
- **Edge case handling** for insufficient data, missing values, etc.
- **Error validation** for invalid inputs
- **Multiple data types** and sample sizes

## Dependencies

### Required (Base R)
- stats
- graphics
- grDevices
- utils

### Optional (Enhanced Features)
- **ggplot2**: Advanced plotting capabilities
- **gridExtra**: Multi-panel plot arrangements
- **knitr**: Report generation
- **rmarkdown**: PDF/HTML report output

## Best Practices

1. **Sample Size**: Minimum 3 observations required; 10-15 recommended
2. **Data Quality**: Remove missing values and check for outliers
3. **Multiple Comparisons**: Adjust significance levels when appropriate
4. **Effect Size**: Consider practical significance alongside statistical significance
5. **Assumptions**: Verify test assumptions are met for your data

## Troubleshooting

### Common Issues

**"Data must have at least 3 observations"**
- Ensure sufficient sample size for normality testing
- Remove missing values: `data[!is.na(data)]`

**PDF generation fails**
- Install required packages: `install.packages(c("rmarkdown", "knitr"))`
- Package automatically falls back to HTML reports

**Plots not displaying**
- Install plotting packages: `install.packages(c("ggplot2", "gridExtra"))`
- Reset graphics: `dev.off()`

## Support and Citation

For questions or issues, refer to the comprehensive documentation in the vignettes directory or the README.md file.

If you use oneR in your research, please cite:
```
oneR: Automated Statistical Testing with Normality Assessment (2025)
Bright Boamah
R package version 1.0.0
```

## License

This package is released under the MIT License. See the LICENSE file for details.

