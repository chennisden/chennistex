# Finished styles

The finished styles are (in chronological order of creation)

	dennis.sty
	lucky.sty
	contest.sty
	shooting.cls
	forest.sty

If you are using shooting.cls, I strongly recommend passing in the onecol and blue options as such:

	\documentclass[onecol, blue]{shooting}

You may also want to know that forest.sty has a shooting option (since it was easy to implement):

	\documentclass[shooting]{forest}

It just makes it look like an article version of shooting.

If you read through the documentation of contest.sty, you will see that there is an option called "mat". __PLEASE DO NOT PASS IT IN,__ unless you are officially a member of MAC. Actually, I would appreciate it if you just did not use this style as-is. You are welcome to use it for REFERENCE in developing your own. If you would like to use the exact same STYLING, please make sure you strip any MAC/MAT branding, particularly in the logo (\titulate) and the footers. Please respect the brand we have built and make sure you do not misrepresent your documents as ours.

# Mandatory imports

For all of these styles (except the minimalist contest.sty), you will need

	chessBM.sty
	fonts.tex
	mathOperators.tex
	tikzMacros.tex
	universal.tex

chessBM.sty is not necessary for dennis.sty. I recommend you just import all of these and be done with it. If you want to use scrambled hints/solutions (thanks to Evan Chen for the original code), you must import

	hintsol.sty
	printhint.tex
	printsol.tex

and in any non-dennis style, you need to load it with

	\usepackage{hintsol}

If the document class is book, dennis will pass in hintsol for you.

# Work in progress styles

lukoshenko.cls and mountain.sty are two black and white styles that I have not come close to finishing. Black and white design is hard and other people have already done it well, so I've decided to focus on other designs for a while.

# Other people's styles

dylanadi.sty is created by Dylan Yu. If you want the latest version, you should be seeing his GitHub, not mine. This is just so I can actually access it while turning my brain off between setups (I just need to pull this repo).

# Legacy/deprecated styles

team.sty is a variation of dennis.sty. We made most of the team.sty changes _in_ dennis.sty, so there is no reason to care about it (other than exercisebox by Amol Rama). It was used for our 2020 Summer AMC course and has not been used since.
