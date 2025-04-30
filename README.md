 # DataFrameBeautifier

*DataFrameBeautifier* is an R package that helps you visually highlight important aspects of a data frame, such as missing values, maximum/minimum values, and column types.

## ✨ Features
- 🔴 Highlight missing (NA) values
- 🟢 Highlight maximum and minimum values
- 📋 Display column data types
- 🌈 Customize highlight colors
- 💡 Combine all in one with beautify_df()

## 📦 Installation

To install the package from a local directory:

```r
devtools::install_local("path/to/DataFrameBeautifier")
Usage
Here’s how to use the functions in the DataFrameBeautifier package:

# Define %or% operator 
%or% <- function(x, y) {
  if (is.null(x)) y else x
}
# Load necessary libraries
library(magrittr)  # or dplyr
library(DT)  # for DT::datatable
library(DataFrameBeautifier)

# Create a sample data frame
df <- data.frame(
  Name = c("Alice", "Bob", NA, "Daisy"),
  Score = c(95, NA, 88, 91),
  Age = c(23, 25, 22, 21)
)

# Highlight NA values
tag_na(df)

# Highlight Max values
tag_high(df)

# Highlight Min values
tag_low(df)

# Use the combined highlighter with custom colors
style_data(
  df,
  what = c("na", "max", "min"),
  colset = list(
    na = "lightcoral",
    max = "lightgreen",
    min = "lightblue"
  )
)

# Show column types
col_types(df)

# Test NULL fallback operator
NULL %or% "fallback"  # should return "fallback"
"notnull" %or% "fallback"  # should return "notnull"
📁 Functions
tag_na(df)

tag_high(df)

tag_low(df)

col_types(df)

style_data(
  df,
  what = c("na", "max", "min"),
  colset = list(
    na = "lightcoral",
    max = "lightgreen",
    min = "lightblue"
  )
)

👤 Author
Archana Kommagoni
[ak14@usf.edu]
