# Create the example IAO grid for the bcch data set
# (moved from naturecounts/data-raw/data_example.R; only rerun as necessary)
#
# Requires the full COSEWIC IAO grid, which is not stored on GitHub
# (previously kept in naturecounts/misc/data/IAO Grid/)

path <- file.path("inst", "extdata", "iao_bcch_grid.gpkg")
file.remove(path)

ext <- sf::st_as_sf(
  naturecounts::bcch,
  coords = c("longitude", "latitude"),
  crs = 4326
) |>
  sf::st_bbox() |>
  sf::st_transform("ESRI:102001")

sf::st_read("misc/data/IAO Grid/") |>
  sf::st_crop(ext) |>
  dplyr::select("geometry") |>
  dplyr::mutate(grid_id = dplyr::row_number()) |>
  sf::st_write(path)
