# Changelog

## naturetools 0.0.1

- Initial version.
  [`cosewic_ranges()`](https://birdscanada.github.io/naturetools/reference/cosewic_ranges.md)
  and
  [`cosewic_plot()`](https://birdscanada.github.io/naturetools/reference/cosewic_plot.md)
  moved from naturecounts.
- [`cosewic_ranges()`](https://birdscanada.github.io/naturetools/reference/cosewic_ranges.md)
  for IAO calculations with a custom `iao_grid` now adds a mini 1-cell
  buffer to ensure that edge records are not omitted
- [`cosewic_ranges()`](https://birdscanada.github.io/naturetools/reference/cosewic_ranges.md)
  for all IAO calculations ensures that records on the edge of a cell
  are not double counted or omitted due to rounding error.
