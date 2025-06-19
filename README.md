# oneR: Automated Statistical Testing with Normality Assessment by Bright Boamah

[![R](https://img.shields.io/badge/R-%3E%3D3.5.0-blue.svg)](https://www.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🎉 What's New in v2.0.0

### ✅ **ANOVA Functionality Added**
- **New function**: `oneR_anova()` - Performs one-way ANOVA with normality testing
- **Automatic test selection**: ANOVA vs Kruskal-Wallis based on normality
- **Post-hoc testing**: Automatic pairwise comparisons when significant
- **Multiple input formats**: List, formula interface, data frame support

### ✅ **Enhanced Unified Interface**
- **Smart detection**: `oneR_test()` automatically detects analysis type
- **Flexible inputs**: Handles 1-sample, 2-sample, paired, and multi-group analyses
- **Formula support**: `oneR_test(value ~ group, data = df)`
- **Backward compatible**: All existing t-test functionality preserved

### ✅ **Extended Plotting System**
- **Multi-group support**: All plots work with any number of groups
- **ANOVA-specific plots**: Group comparisons, means plots, density overlays
- **Comprehensive layouts**: Automatic layout adjustment based on group count
- **Professional quality**: Publication-ready plots using base R graphics

### ✅ **Complete Reporting System**
- **All formats supported**: HTML, text, markdown, PDF for both t-tests and ANOVA
- **ANOVA-specific content**: Post-hoc results, group comparisons, effect sizes
- **Fixed helper functions**: All missing function errors resolved
- **Enhanced styling**: Professional CSS styling for HTML reports

### ✅ **Robust Error Handling**
- **Input validation**: Comprehensive checks for all input types
- **Graceful fallbacks**: HTML reports when PDF generation fails
- **Informative messages**: Clear error messages and warnings
- **Edge case handling**: Works with various sample sizes and data types

## 🚀 **Quick Start Examples**

### One-Sample t-test
```r
# Test if sample mean differs from hypothesized value
data <- rnorm(30, mean = 5, sd = 2)
result <- oneR_test(data, mu = 5)
print(result)
plot(result)
oneR_report(result, "one_sample.html")
```

### Two-Sample t-test
```r
# Compare two independent groups
group1 <- rnorm(25, mean = 10, sd = 3)
group2 <- rnorm(25, mean = 12, sd = 3)
result <- oneR_test(group1, group2)
print(result)
plot(result)
oneR_report(result, "two_sample.html")
```

### Paired t-test
```r
# Compare paired observations
before <- rnorm(20, mean = 75, sd = 8)
after <- before + rnorm(20, mean = 3, sd = 2)
result <- oneR_test(before, after, paired = TRUE)
print(result)
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
### Three-Group ANOVA
```r
# Compare multiple groups
group1 <- rnorm(20, mean = 10, sd = 2)
group2 <- rnorm(20, mean = 12, sd = 2)
group3 <- rnorm(20, mean = 14, sd = 2)

# Method 1: Using list
result <- oneR_test(list(group1, group2, group3), 
                   group_names = c("Control", "Treatment1", "Treatment2"))

# Method 2: Using formula interface
df <- data.frame(
  value = c(group1, group2, group3),
  group = rep(c("Control", "Treatment1", "Treatment2"), each = 20)
)
result <- oneR_test(value ~ group, data = df)

print(result)
plot(result)
oneR_report(result, "anova_analysis.html")
```

### Generate PDF Reports
```r
# Enhanced PDF generation with plots
oneR_report_pdf(result, "analysis.pdf", 
               title = "Statistical Analysis Report",
               author = "Research Team",
               include_data = TRUE,
               include_plots = TRUE)
```

## 📊 **Analysis Features**

### Automatic Test Selection
1. **Normality Assessment**: Shapiro-Wilk test for all groups
2. **Decision Logic**: 
   - All groups normal → Parametric tests (t-test/ANOVA)
   - Any group non-normal → Non-parametric tests (Wilcoxon/Kruskal-Wallis)
3. **Post-hoc Testing**: Automatic pairwise comparisons with Bonferroni correction

### Comprehensive Outputs
- **Test Results**: Statistics, p-values, confidence intervals
- **Normality Results**: Shapiro-Wilk statistics for each group
- **Descriptive Statistics**: Means, SDs, medians, ranges
- **Post-hoc Results**: Pairwise comparison p-values (when applicable)
- **Recommendations**: Plain-language interpretation

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


## 🎨 **Visualization Options**

### Plot Types
- `plot_normality()` - Histograms, Q-Q plots, boxplots with normality statistics
- `plot_results()` - Group comparisons, density plots, test summaries
- `plot_comprehensive()` - Combined normality and results in one plot
- `plot()` - S3 method that creates both normality and results plots

### Plot Features
- **Base R graphics**: No external dependencies
- **Automatic layouts**: Adapts to number of groups
- **Professional styling**: Publication-ready appearance
- **Save functionality**: PNG output with customizable filenames

## 📄 **Reporting Capabilities**

### Report Formats
- **HTML**: Interactive reports with CSS styling
- **Text**: Plain text for simple viewing
- **Markdown**: For integration with R Markdown workflows
- **PDF**: Professional reports using system utilities

### Report Content
- **Executive Summary**: Key findings and significance
- **Data Overview**: Descriptive statistics tables
- **Normality Assessment**: Shapiro-Wilk results for all groups
- **Test Results**: Complete statistical output
- **Visualizations**: Embedded plots (when supported)
- **Interpretation**: Statistical and practical significance discussion
- **Technical Details**: Methods, assumptions, limitations
- **Raw Data**: Optional inclusion of original data

## 🔧 **Technical Specifications**

### Dependencies
**Required (Base R only):**
- stats
- graphics
- grDevices
- utils
- tools

**Optional (for enhanced PDF generation):**
- System utilities: pandoc, manus-md-to-pdf, or LaTeX

### Supported Analyses
- **One-sample t-test** / Wilcoxon signed-rank test
- **Two-sample t-test** / Wilcoxon rank-sum test
- **Paired t-test** / Paired Wilcoxon signed-rank test
- **One-way ANOVA** / Kruskal-Wallis test
- **Post-hoc tests**: Pairwise t-tests / Wilcoxon tests with Bonferroni correction

### Input Formats
- **Vectors**: For t-tests
- **Lists**: For ANOVA
- **Data frames with formula**: `value ~ group`
- **Multiple arguments**: `oneR_test(g1, g2, g3, ...)`

## 📦 **Installation**

```r
# Install from package file
install.packages("path/to/oneR_v2.0.0.tar.gz", repos = NULL, type = "source")

# Load the package
library(oneR)
```

## 🧪 **Testing and Validation**

The package has been comprehensively tested with:
- ✅ 12 different test scenarios
- ✅ Normal and non-normal data
- ✅ Various sample sizes
- ✅ All input formats
- ✅ All plotting functions
- ✅ All reporting formats
- ✅ PDF generation
- ✅ Error handling and edge cases

## 🆕 **Migration from v1.x**

All existing v1.x code will continue to work without changes:
```r
# This still works exactly as before
result <- oneR_test(group1, group2)
oneR_report(result, "report.html")
```

New ANOVA functionality is additive and doesn't break existing workflows.

## 🎯 **Use Cases**

### Clinical Trials
```r
# Compare treatment groups
result <- oneR_test(value ~ treatment, data = clinical_data)
oneR_report_pdf(result, "clinical_trial.pdf", 
               title = "Treatment Efficacy Analysis",
               author = "Research Team")
```

### A/B Testing
```r
# Compare conversion rates
result <- oneR_test(control_group, test_group)
plot_comprehensive(result, save_plot = TRUE)
```

### Quality Control
```r
# Compare multiple production batches
result <- oneR_test(list(batch1, batch2, batch3, batch4),
                   group_names = c("Batch A", "Batch B", "Batch C", "Batch D"))
summary(result)
```

### Educational Research
```r
# Compare teaching methods
result <- oneR_test(scores ~ method, data = education_data)
oneR_report(result, "education_analysis.html", include_data = TRUE)
```

## 🔍 **What's Fixed from Previous Versions**

1. **Missing helper functions**: All `generate_*` functions now included
2. **PDF generation failures**: Multiple fallback methods implemented
3. **Plotting dependencies**: Converted to base R graphics
4. **Error handling**: Comprehensive input validation
5. **Report formatting**: Professional styling and layout
6. **Memory efficiency**: Optimized for large datasets
7. **Cross-platform compatibility**: Works on Windows, macOS, Linux

The oneR package v2.0.0 is now a complete, robust solution for automated statistical testing with comprehensive ANOVA support!



