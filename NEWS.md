# naturetools 0.0.1

- Initial version. `cosewic_ranges()` and `cosewic_plot()` moved from
  naturecounts.
- `cosewic_ranges()` for IAO calculations with a custom `iao_grid` now adds a
  mini 1-cell buffer to ensure that edge records are not omitted
- `cosewic_ranges()` for all IAO calculations ensures that records on the edge
  of a cell are not double counted or omitted due to rounding error.
