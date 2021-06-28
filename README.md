# Permissions

Anyone may use any of my classes or packages for any reason. No attribution is required, though it is certainly appreciated in the source code. I only ask that you do not pass any of my work off as your own.

If you're using my code, I'd appreciate if you dropped me a message at chennis#0724 on Discord (subject to change) or emailed me at proofprogram@gmail.com. Also please star the repository if you found it helpful :)

## CV

Because I've been asked about cv.cls the most, I'll dedicate a small section to it.

As examples, the tex source for my CV can be found on [my website](https://www.geometryexplorer.xyz/texfiles/CV/cv.tex) and so can [the compiled PDF][https://www.geometryexplorer.xyz/texfiles/CV/cv.pdf]. I recommend you get a *stable* copy of cv.cls, because I am prone to making large changes to my code somewhat frequently. (Though I don't think anything I do will break the class; everything should be backwards compatible.)

Once again, you may use this for any reason. No permission is required.

# Configuration Instructions

You are going to need a TeX distribution. I recommend TeX Live (MacTeX for Mac users). You will also need Git Bash.

## Overleaf

Download an actual TeX distribution.

## TeX Live

Here's a [youtube video](https://www.youtube.com/watch?v=x3f-hQyHjrE) on how to change the TEXMFHOME variable through texmf.cnf. There are many other ways to do this.

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
