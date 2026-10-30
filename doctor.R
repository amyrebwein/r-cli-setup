#!/usr/bin/env Rscript
# doctor.R: is this machine ready for medexhibit work?
all_ok <- TRUE

report <- function(label, pass, optional = FALSE) {
  tag <- if (pass) "ok" else if (optional) "--" else "XX"
  cat(sprintf("[%s] %s\n", tag, label))
  if (!pass && !optional) all_ok <<- FALSE
}

prefix <- Sys.getenv("CONDA_PREFIX")
in_env <- nzchar(prefix) &&
  startsWith(normalizePath(R.home()), normalizePath(prefix))

report(sprintf("R >= 4.4.0 (found %s)", getRversion()), getRversion() >= "4.4.0")
report("a conda env is active", nzchar(prefix))
report(sprintf("R comes from that env (%s)", R.home()), in_env)
report("exactly one package library", length(.libPaths()) == 1)

for (pkg in c("devtools", "usethis", "testthat", "roxygen2")) {
  report(paste("package", pkg), requireNamespace(pkg, quietly = TRUE))
}
for (pkg in c("epiDisplay", "SurvRegCensCov")) {
  report(paste("exception", pkg, "(see r-extras.txt)"),
    requireNamespace(pkg, quietly = TRUE),
    optional = TRUE
  )
}

report("git on PATH", nzchar(Sys.which("git")))
report("gh on PATH (GitHub CLI)", nzchar(Sys.which("gh")), optional = TRUE)
report("quarto on PATH (only for PDFs)", nzchar(Sys.which("quarto")), optional = TRUE)

quit(status = if (all_ok) 0 else 1)
