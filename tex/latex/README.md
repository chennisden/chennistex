# Finished styles

The finished styles are (in chronological order of creation)

	dennis.cls
	lucky.cls
	shooting.cls
	forest.cls

If you are using shooting.cls, I strongly recommend passing in the onecol and blue options as such:

	\documentclass[onecol, blue]{shooting}

You may also want to know that forest.cls has a shooting option (since it was easy to implement):

	\documentclass[shooting]{forest}

It just makes it look like an article version of shooting.

The rest of the styles are dependencies because I do not want to copy paste code.

# Mandatory imports

For all of these styles, you will need

	chessBM.sty
	fonts.sty
	mathOperators.sty
	tikzMacros.sty
	universal.sty

chessBM.sty is not necessary for dennis.sty. I recommend you just import all of these and be done with it. If you want to use scrambled hints/solutions (thanks to Evan Chen for the original code), you must import

	hintsol.sty
	printhint.tex
	printsol.tex

and in any non-dennis style, you need to load it with

	\usepackage{hintsol}

If the document class is book, dennis will pass in hintsol for you.

# Legacy/deprecated styles

team.sty is a variation of dennis.sty. We made most of the team.sty changes _in_ dennis.sty, so there is no reason to care about it (other than exercisebox by Amol Rama). It was used for our 2020 Summer AMC course and has not been used since.