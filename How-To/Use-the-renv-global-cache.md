# renv

[renv](https://rstudio.github.io/renv/articles/renv.html) is a common dependency management package for R. It can utilize a global cache to share packages between users and speed up installation. The Data Department uses this functionality on its internal server.

When working in RStudio on the Data Department's server, new users will have a `.Renviron` file placed into their home directory by default. This file contains a pointer telling `renv` to use the global cache (located in the `/mnt/` directory). This prevents the same packages from being installed multiple times on the server and should save users time installing from source on Linux.

* For new users, there should no additional work needed for `renv` to function as desired
* For previously added users:
  * Delete the directory `$USERNAME/.cache/R/renv`
  * Add `RENV_PATHS_ROOT=/mnt/shared/renv` to `[user]/.Renviron`

