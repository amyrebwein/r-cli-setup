options(repos = c(CRAN = "https://cloud.r-project.org"))

if (interactive()) {
  options(
    help_type = "text",              # ?topic prints in the terminal
    warnPartialMatchDollar = TRUE,   # df$ag silently matching df$age is a classic bug
    warnPartialMatchArgs = TRUE
  )
}

# In a conda env, install R packages with conda, not install.packages()
if (nzchar(Sys.getenv("CONDA_PREFIX"))) {
  install.packages <- function(...) {
    stop("Use conda: conda install -c conda-forge r-<name>. ",
         "For a documented exception, call utils::install.packages().", call. = FALSE)
  }
}
