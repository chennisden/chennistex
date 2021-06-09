# Configuration Instructions

You are going to need a TeX distribution. I recommend TeX Live (MacTeX for Mac users). You will also need Git Bash.

## Overleaf

Download an actual TeX distribution.

## TeX Live

First find a directory to clone this repository into. Then, once you have cd'ed into it, run

	git clone https://github.com/chennisden/chennistex

If there are any changes, you can fetch them by running

	git pull

inside the repository's directory.

To allow LaTeX to locate the texmf and asymptote modules, you will need to configure the TEXMFHOME and ASYMPTOTE_HOME path variables. To do this, find texmf.cnf by running

	kpsewhich texmf.cnf

and inside texmf.cnf, add the following lines:

	TEXMFHOME = ~/(path)/dennistex/texmf

	ASYMPTOTE_HOME = ~/(path)/dennis/.asy

where path denotes the directory dennistex is in. (Note that ~ represents the user directory.) If you want to add other paths to your TEXMFHOME or ASYMPTOTE_HOME path variable, use the path separator to separate them. This is : on UNIX and ; on MSDOS. For instance, if you wanted to add the Bounce repository to your texmf,

Ensure that there is a line between the TEXMFHOME and ASYMPTOTE_HOME directories.

## MiKTeX

To be done
