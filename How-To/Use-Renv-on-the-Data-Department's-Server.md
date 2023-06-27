# renv

[renv](https://rstudio.github.io/renv/articles/renv.html) is a common dependency management package for R. When working in Rstudio on the Data Department's server, new users will by default have a `.Renviron` file placed into their root directory with a pointer for renv to use when looking for specific versions of packages that have already been installed. This prevents the same versions of the same packages from being installed multiple times on the server and should save users time installing packages that need to be compiled on Linux.
* For new users, there should no additional work needed for renv to function as desired
* For previously added useres:
 * Delete the directory `[user]/.cache/R/renv`[^1]
 * Add `RENV_PATHS_ROOT=/mnt/shared/renv` to `[user]/.Renviron`

[^1]: `[user]` indicates the user's username
