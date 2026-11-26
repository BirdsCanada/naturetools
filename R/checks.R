have_pkg_check <- function(pkgs) {
  # TODO: remove suppression when rnaturalearth resolved

  failed <- purrr::map_lgl(pkgs, ~ !requireNamespace(.x, quietly = TRUE)) %>%
    suppressPackageStartupMessages()

  if (any(failed)) {
    if ("sf" %in% pkgs[!failed] && utils::packageVersion("sf") < "1.0-9") {
      pkgs[pkgs == "sf"] <- "sf (>v1.0-9)"
    }

    stop(
      "This function requires packages: '",
      paste0(pkgs[failed], collapse = "', '"),
      "'",
      "\nPlease install with `install.packages(\"",
      paste0(pkgs[failed], collapse = "\", \""),
      "\")` then try again",
      call. = FALSE
    )
  }
}


df_db_check <- function(df_db, collect = TRUE, verbose = TRUE) {
  if (!inherits(df_db, c("data.frame", "SQLiteConnection", "tbl_sql"))) {
    stop(
      "'df_db' must be either a data frame, a connection to an SQLite ",
      "database, or a connection to an SQLite table",
      call. = FALSE
    )
  }

  # Collect as required
  if (collect && inherits(df_db, c("SQLiteConnection", "tbl_sql"))) {
    if (verbose) {
      message(
        " - Cannot work directly on SQLite database connections, ",
        "collecting data into a data frame..."
      )
    }

    if (inherits(df_db, "SQLiteConnection")) {
      if (!"naturecounts" %in% DBI::dbListTables(df_db)) {
        stop(
          "If 'df_db' is a SQLite database, it must have a 'naturecounts' ",
          "table",
          call. = FALSE
        )
      }
      df_db <- dplyr::tbl(df_db, "naturecounts")
    }

    df_db <- dplyr::collect(df_db)
  }

  df_db
}

which_check <- function(which) {
  if (!all(which %in% c("iao", "eoo"))) {
    stop("`which` must be one or both of 'iao' and 'eoo'", call. = FALSE)
  }
}

sf_check <- function(df_sf, name) {
  if (!inherits(df_sf, "sf")) {
    stop(
      "`",
      name,
      "` must be spatial (i.e. use `spatial = TRUE` in ",
      "`cosewic_ranges()`)",
      call. = FALSE
    )
  }
}
