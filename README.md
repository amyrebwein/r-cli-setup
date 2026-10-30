# r-cli-setup

My terminal-only R toolchain: R 4.5 from conda-forge in a conda env, radian as the REPL.

## Rebuild on a new machine
1. `conda env create -f environment.yml`
2. `conda activate r_env`
3. Install the exceptions listed in `r-extras.txt`
4. `ln -s "$PWD/Rprofile" ~/.Rprofile && ln -s "$PWD/radian_profile" ~/.radian_profile`
5. `./doctor.R`

## A healthy doctor run
Every line starts with `[ok]` (optional checks may show `[--]`), and the exit code is 0.
Any `[XX]` line means something is broken, and the exit code is 1.
