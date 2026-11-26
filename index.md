# naturetools

Tools for calculating and plotting COSEWIC Index of Area of Occupancy
(IAO) and Extent of Occurrence (EOO) ranges. Builds on the
[naturecounts](https://birdscanada.github.io/naturecounts/) package,
which provides data access, example data and tutorials.

## Installation

``` r

# install.packages("pak")
pak::pak("BirdsCanada/naturetools")
```

## Example

``` r

library(naturetools)

r <- cosewic_ranges(naturecounts::bcch)
cosewic_plot(r)
```
