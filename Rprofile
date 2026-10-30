options(repos = c(CRAN = "https://cloud.r-project.org"))

# In a conda env, install R packages with conda, not install.packages()
if (nzchar(Sys.getenv("CONDA_PREFIX"))) {
  install.packages <- function(...) {
    stop("Use conda: conda install -c conda-forge r-<name>. ",
         "For a documented exception, call utils::install.packages().", call. = FALSE)
  }
}

