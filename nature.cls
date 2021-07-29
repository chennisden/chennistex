\ProvidesClass{nature}
\LoadClass{article}

%%%%%%%%%%%%
%ESSENTIALS%
%%%%%%%%%%%%

\RequirePackage{asymptote}
\begin{asydef}
	size(6cm);
	import olympiad;
	import cse5;
	import geometry;
\end{asydef}

\RequirePackage{tikz}
\RequirePackage{tkz-euclide}
\usetikzlibrary{calc}

\RequirePackage{babel}

\RequirePackage{amssymb,amsthm}
\RequirePackage{mdframed}

\RequirePackage{universal} % custom package created by Dennis Chen

%%%%%%%%
%COLORS%
%%%%%%%%

\RequirePackage{xcolor}
\RequirePackage{colorpalette, symbolpalette}

\newpalettetheme{nature}

\newpalette{nature}{forest}
\newpalette{nature}{ocean}

\addcolortotheme{nature}{primary}
\addcolortotheme{nature}{alternate}
\addcolortotheme{nature}{accent}
\addcolortotheme{nature}{background}

\setpalettecolor{nature}{forest}{primary}{033c16}
\setpalettecolor{nature}{forest}{alternate}{ccffbb}
\setpalettecolor{nature}{forest}{accent}{640f0f}
\setpalettecolor{nature}{forest}{background}{e6e6e6}

\setpalettecolor{nature}{ocean}{primary}{002896}
\setpalettecolor{nature}{ocean}{alternate}{d2f0ff}
\setpalettecolor{nature}{ocean}{accent}{91000a}
\setpalettecolor{nature}{ocean}{background}{e6e6e6}

\newsuitetheme{nature}

\newsuite{nature}{forest}
\newsuite{nature}{ocean}

\addsymboltotheme{nature}{sect}
\addsymboltotheme{nature}{prob}
\addsymboltotheme{nature}{req}

\setsuitesymbol{nature}{forest}{sec}{\faTree}
\setsuitesymbol{nature}{forest}{prob}{\faLeaf}
\setsuitesymbol{nature}{forest}{req}{\faTint}

\setsuitesymbol{nature}{ocean}{sec}{\faGlobe}
\setsuitesymbol{nature}{ocean}{prob}{\pawnB}
\setsuitesymbol{nature}{ocean}{req}{\knightB}

% Default palette/suite
\activepalette{nature}{ocean}
\activesuite{nature}{ocean}

\RequirePackage[letterpaper,top=2cm,bottom=2cm,left=2.5cm,right=2.5cm,includeheadfoot]{geometry} % geometry has to be BEFORE fancyhdr for margins to work!

%%%%%%%%%%%%%%%%%%%
%FONTS AND SYMBOLS%
%%%%%%%%%%%%%%%%%%%

\RequirePackage{newpxtext,newpxmath}
\RequirePackage{fontawesome, pifont}

% itemize symbols
\renewcommand{\labelitemi}{$\blacksquare$}
\renewcommand{\labelitemii}{\ding{70}}
\renewcommand{\labelitemiii}{$\bullet$}

%%%%%
%TOC%
%%%%%

\setcounter{tocdepth}{2}

\RequirePackage[hypertexnames=false]{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=\getcolor{nature}{primary},
	urlcolor=\getcolor{nature}{primary}
}

\RequirePackage{tocloft}

\renewcommand{\cfttoctitlefont}{\merri\bfseries\LARGE}
\renewcommand{\cftsecfont}{\hypersetup{linkcolor=\getcolor{nature}{primary}}\notofont\bfseries\large\applycolor{nature}{primary}}
\renewcommand{\cftsubsecfont}{\tlffont}

% shorthand for toc; prevent everything from being blue or whatever

\newcommand{\toc}{
	{\hypersetup{
				linkcolor=black}
			\tableofcontents
			\pagebreak}
}

%%%%%%%%%%%%%%%%%%%
%TITLE AND HEADERS%
%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox} % used for patchcmd

\patchcmd{\@maketitle}{\@title}{\merri\applycolor{nature}{primary}\bfseries\@title}{}{}
\patchcmd{\@maketitle}{\@author}{\merri\@author}{}{}
\patchcmd{\@maketitle}{\@date}{\merri\applycolor{nature}{primary}\@date}{}{}

%%%%%%%%%%%%
%SECTIONING%
%%%%%%%%%%%%

\RequirePackage{titlesec}

\titleformat{\section}
{\notofont\Large\bfseries}{{\applycolor{nature}{primary}\@secsymb\,\thesection}}{0.8em}{}

% subsections
\titleformat{\subsection}
{\sffamily\large\bfseries}{{\applycolor{nature}{primary}\thesubsection}}{0.9em}{}

%subsubsections (just in case!)

\titleformat{\subsubsection}
{\sffamily\normalsize\bfseries}{{\applycolor{nature}{primary}\thesubsubsection}}{0.9em}{}

%%%%%%%%%%%%%%%%%%%%%%
%PROBLEM ENVIRONMENTS%
%%%%%%%%%%%%%%%%%%%%%%

%usage: \begin{prob}[source]{points}
% problem
% \end{prob}

\newenvironment{prob}[2][]{
	{\parindent=0pt
			\raggedright
			\robotofont\applycolor{nature}{primary}[#2\,\printsymbol{nature}{prob}]\textbf{\if\relax\detokenize{#1}\else~(#1)\fi}}\hspace{3.5pt}\ignorespaces
}
{
	\vspace{0.2cm}
}

\newenvironment{req}[2][]{
	{\parindent=0pt
			\raggedright
			\robotofont\applycolor{nature}{accent}[#2\,\printsymbol{nature}{req}]\textbf{\if\relax\detokenize{#1}\else\hspace{3pt}(#1)\fi}}\hspace{3.5pt}\ignorespaces
}
{
	\vspace{0.2cm}
}

\newcommand{\minpt}[1]{Minimum is {\applycolor{nature}{primary}[#1\,\printsymbol{nature}{prob}]}. Problems with the\;{\applycolor{nature}{accent}\printsymbol{nature}{req}}\;symbol are required.
\vspace{\baselineskip}
}

\newcommand{\psetquote}[2] % BE CAREFUL WITH THIS. must be DIRECTLY after minpt
{
	\vspace{-\baselineskip}
	\begin{flushright}
		\begin{tikzpicture}
			\draw (0,0) node [right,text width=8.75cm]{
				\begin{mdframed}[linecolor=\getcolor{nature}{primary},leftline=true,rightline=false,bottomline=false,topline=false,linewidth=3pt,backgroundcolor=\getcolor{nature}{alternate}]
					{\alegreyafont``#1''}

					\vspace{1mm}

					\hfill\applycolor{nature}{accent}\fell#2
				\end{mdframed}
			};

		\end{tikzpicture}
	\end{flushright}
}

%%%%%%%%%
%VISUALS%
%%%%%%%%%

\renewcommand{\emph}[1]{{\bfseries\applycolor{nature}{accent}#1}}
\newcommand{\ansbold}[1]{{\applycolor{nature}{accent}\mathbf{#1}}}

\newcommand{\problems}{\pagebreak\section{Problems}}

%%%%%%%%%%
%THEOREMS%
%%%%%%%%%%

\newtheoremstyle{dbox}
{0pt}
{2pt}
{}
{}
{\applycolor{nature}{primary}\cha\bfseries}
{}
{\newline}
{\vspace{1.5pt}\thmname{#1}\thmnumber{ #2}\thmnote{ --- #3}}

\newtheoremstyle{proof}
{0pt}
{0pt}
{}
{}
{\applycolor{nature}{accent}\sffamily\bfseries}
{:}
{4pt}
{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{walk}
{0pt}
{0pt}
{}
{}
{\applycolor{nature}{accent}\sffamily\bfseries}
{:}
{0pt}
{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{remark}
{0pt}
{0pt}
{}
{}
{\applycolor{nature}{primary}\sffamily\bfseries}
{:}
{1.5mm}
{\thmname{#1}\thmnote{ #3}}

\theoremstyle{dbox}

\newmdtheoremenv[% settings
	backgroundcolor=\getcolor{nature}{alternate},
	nobreak=true,
	linecolor=\getcolor{nature}{primary},
	linewidth=0.6pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{theo}{Theorem}[section]

\newmdtheoremenv[% settings
	backgroundcolor=\getcolor{nature}{background},
	nobreak=true,
	linecolor=\getcolor{nature}{primary},
	linewidth=2pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=true]{defi}[theo]{Definition}

\newmdtheoremenv[% settings
	backgroundcolor=\getcolor{nature}{background},
	nobreak=true,
	linecolor=\getcolor{nature}{primary},
	linewidth=2pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=true]{fact}[theo]{Fact}

\newmdtheoremenv[% settings
	nobreak=true,
	linecolor=\getcolor{nature}{primary},
	linewidth=0.6pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{exam}[theo]{Example}

\newmdtheoremenv[% settings
	nobreak=true,
	linecolor=\getcolor{nature}{primary},
	linewidth=0.6pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{exer}[theo]{Exercise}

\newmdtheoremenv[% settings
	backgroundcolor=\getcolor{nature}{alternate},
	nobreak=true,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=false]{lemma}[theo]{Lemma}

\newmdtheoremenv[% settings
	backgroundcolor=\getcolor{nature}{alternate},
	nobreak=true,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	innertopmargin=7pt,
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=false]{corollary}[theo]{Corollary}

\RequirePackage{pgf}

\theoremstyle{proof}

\newmdtheoremenv[
	nobreak=false,
	linecolor=\getcolor{nature}{accent},
	linewidth=1pt,
	leftline=true,
	rightline=false,
	topline=false,
	bottomline=false,
	innertopmargin=3pt,
	innerbottommargin=3.5pt,
	innerleftmargin=7pt
]{pro}{Proof}

\def\endpro{\hfill$\blacksquare$}

\newmdtheoremenv[
	nobreak=false,
	linecolor=\getcolor{nature}{accent},
	linewidth=1pt,
	leftline=true,
	rightline=false,
	topline=false,
	bottomline=false,
	innertopmargin=3pt,
	innerbottommargin=3.5pt,
	innerleftmargin=7pt
]{sol}{Solution}

\theoremstyle{remark}

\newmdtheoremenv[
	nobreak=false,
	linecolor=\getcolor{nature}{primary},
	linewidth=1pt,
	leftline=true,
	rightline=false,
	topline=false,
	bottomline=false,
	innertopmargin=3pt,
	innerbottommargin=3.5pt,
	innerleftmargin=7pt
]{remark}{Remark}

\theoremstyle{walk}

\newmdtheoremenv[
	nobreak=false,
	linecolor=\getcolor{nature}{accent},
	linewidth=1pt,
	leftline=true,
	rightline=false,
	topline=false,
	bottomline=false,
	innertopmargin=2pt,
	innerbottommargin=4pt,
	innerleftmargin=7pt
]{walk}{Walkthrough}

\renewcommand{\walk}{{\sffamily\applycolor{nature}{accent}\bfseries Walkthrough:~}}