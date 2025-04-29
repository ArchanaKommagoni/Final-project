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

library(DataFrameBeautifier)

# Create an example data frame
df <- data.frame(
  Name = c("Alice", "Bob", NA),
  Score = c(95, NA, 88),
  Age = c(23, 25, 22)
)

# Highlight missing values
highlight_na(df)

# Highlight maximum values in the data frame
highlight_max(df)

# Highlight minimum values in the data frame
highlight_min(df)

# Display data types of columns
pretty_types(df)

# Combine all highlights and pretty types in one
beautify_df(df, highlight = c("na", "max", "min"), colors = list(na = "red", max = "lightgreen", min = "lightblue"))

📁 Functions
highlight_na(df)

highlight_max(df)

highlight_min(df)

pretty_types(df)

beautify_df(df, highlight = ..., colors = ...)

👤 Author
Archana Kommagoni
[ak14@usf.edu]
