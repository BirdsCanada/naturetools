# Common arguments

Common arguments

## Arguments

- crs:

  A coordinate reference system (see `?sf::st_transform()`). Defaults to
  Albers Equal-Area for Canada (ESRI:102001) for area calculations. Note
  that it must be a projection (i.e. not simply a reference system like
  4326 used for GPS) for area calculations. If `NULL` for plots, uses
  the CRS of the base map or of the IAO/EOO data.

- which:

  Character vector. Which range types to calculate. Any combination of
  "eoo" and "iao", default is both.

- verbose:

  Logical. Show messages?
