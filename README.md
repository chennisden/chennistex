To allow LaTeX to locate the texmf and asymptote modules, you will need to configure the TEXMFHOME and ASYMPTOTE_HOME path variables. To do this, find texmf.cnf by running

	kpsewhich texmf.cnf

and inside texmf.cnf, add the following lines:

	TEXMFHOME = ~/(path)/dennistex/texmf

	export ASYMPTOTE_HOME = ~/(path)/dennis/.asy

where path denotes the directory dennistex is in. (Note that ~ represents the user directory.)

Ensure that there is a line between the TEXMFHOME and ASYMPTOTE_HOME directories.