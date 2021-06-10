\ProvidesClass{nature}
\LoadClass{article}

%%%%%%%%%
%OPTIONS%
%%%%%%%%%

\RequirePackage{kvoptions}

%   - xinttools (for zapping away spaces)
\RequirePackage{xinttools}

\DeclareStringOption[ocean]{theme}

\ProcessKeyvalOptions*

\edef\forest@theme{\expandafter\xintZapSpaces\expandafter\forest@theme} % zaps spaces

\RequirePackage{ifallfalse} % package from the providers of bounce.cls

\begin{allfalse}{\forest@theme}{ % throw error if \forest@theme matches neither forest or ocean
	\ClassError{forest}{Invalid or no theme passed in}{Valid themes are forest, ocean}
}
	\orcheck{forest}
	\orcheck{ocean}
\end{allfalse}

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

% These colors have their names chosen to explicitly enumerate what feelings they are supposed to evoke.

% Takes in palette name, palette color, HTML color code 
%   Ex: \palettecolor{red}{primary}{696969}
%     The first line defines the color redprimarycolor,
%     The second line defines the command \@redprimary (so \@primary actually has something to refer to)
%     The third line defines \@primary in this example,
%     The fourth line defines \@primarycolor

\def\palettecolor#1#2#3{
    \definecolor{#1#2 color}{HTML}{#3}
    \expandafter\def\csname @#1#2\endcsname{\color{#1#2 color}}
    \expandafter\def\csname @#2\endcsname{\csname @\forest@theme #2\endcsname}
    \expandafter\def\csname @#2color\endcsname{\forest@theme #2 color}
}

\palettecolor{forest}{primary}{033c16}
\palettecolor{forest}{alternate}{ccffbb}
\palettecolor{forest}{accent}{640f0f}

\palettecolor{ocean}{primary}{002896}
\palettecolor{ocean}{alternate}{d2f0ff}
\palettecolor{ocean}{accent}{91000a}

\definecolor{bggray}{HTML}{e6e6e6}

\RequirePackage[letterpaper,top=2cm,bottom=2cm,left=2.5cm,right=2.5cm,includeheadfoot]{geometry} % geometry has to be BEFORE fancyhdr for margins to work!

%%%%%%%%%%%%%%%%%%%
%FONTS AND SYMBOLS%
%%%%%%%%%%%%%%%%%%%

\RequirePackage{newpxtext,newpxmath}
\RequirePackage{fontawesome, pifont}

% section symbols

\def\@forestsec{\faTree}
\def\@oceansec{\faGlobe}

\def\@secsymb{\csname @\forest@theme sec\endcsname}

% problem symbols

\RequirePackage[nosymb]{chessBM} % do not auto define prob and req symbs

\def\@forestprob{\faLeaf}
\def\@oceanprob{\pawnB}

\def\@probsymb{\csname @\forest@theme prob\endcsname}

\def\@forestreq{\faTint}
\def\@oceanreq{\knightB}

\def\@reqsymb{\csname @\forest@theme req\endcsname}

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
    linkcolor=\@primarycolor,
    urlcolor=\@primarycolor
}

\RequirePackage{tocloft}

\renewcommand{\cfttoctitlefont}{\merri\bfseries\LARGE}
\renewcommand{\cftsecfont}{\hypersetup{linkcolor=\@primarycolor}\notofont\bfseries\large\@primary}
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

\patchcmd{\@maketitle}{\@title}{\merri\@primary\bfseries\@title}{}{}
\patchcmd{\@maketitle}{\@author}{\merri\@author}{}{}
\patchcmd{\@maketitle}{\@date}{\merri\@primary\@date}{}{}

%%%%%%%%%%%%
%SECTIONING%
%%%%%%%%%%%%

\RequirePackage{titlesec}

\titleformat{\section}
{\notofont\Large\bfseries}{{\@primary\@secsymb\,\thesection}}{0.8em}{}

% subsections
\titleformat{\subsection}
{\sffamily\large\bfseries}{{\@primary\thesubsection}}{0.9em}{}

%subsubsections (just in case!)

\titleformat{\subsubsection}
{\sffamily\normalsize\bfseries}{{\@primary\thesubsubsection}}{0.9em}{}

%%%%%%%%%%%%%%%%%%%%%%
%PROBLEM ENVIRONMENTS%
%%%%%%%%%%%%%%%%%%%%%%

%usage: \begin{prob}[source]{points}
% problem
% \end{prob}

\newenvironment{prob}[2][]{
{\parindent=0pt
\raggedright
\robotofont\@primary[#2\,\@probsymb]\textbf{\if\relax\detokenize{#1}\else~(#1)\fi}}\hspace{3.5pt}\ignorespaces
}
{
\vspace{0.2cm}
}

\newenvironment{req}[2][]{
{\parindent=0pt
\raggedright
\robotofont\@accent[#2\,\@reqsymb]\textbf{\if\relax\detokenize{#1}\else\hspace{3pt}(#1)\fi}}\hspace{3.5pt}\ignorespaces
}
{
\vspace{0.2cm}
}

\newcommand{\minpt}[1]{Minimum is {\@primary[#1\,\@probsymb]}. Problems with the\;{\@accent\@reqsymb}\;symbol are required.
    \vspace{\baselineskip}
}

\newcommand{\psetquote}[2] % BE CAREFUL WITH THIS. must be DIRECTLY after minpt
{
\vspace{-\baselineskip}
\begin{flushright}
\begin{tikzpicture}
\draw (0,0) node [right,text width=8.75cm]{
\begin{mdframed}[linecolor=\@primarycolor,leftline=true,rightline=false,bottomline=false,topline=false,linewidth=3pt,backgroundcolor=\@alternatecolor]
{\alegreyafont``#1''}

\vspace{1mm}

\hfill\@accent\fell#2
\end{mdframed}
};

\end{tikzpicture}
\end{flushright}
}

%%%%%%%%%
%VISUALS%
%%%%%%%%%

\newcommand{\db}[1]{{\bfseries\@accent#1}}
\newcommand{\dbold}[1]{\db{#1}}

\newcommand{\ansbold}[1]{{\@accent\mathbf{#1}}}

\newcommand{\problems}{\pagebreak\section{Problems}}

%%%%%%%%%%
%THEOREMS%
%%%%%%%%%%

\newtheoremstyle{dbox}
	{0pt}
	{2pt}
	{}
	{}
	{\@primary\cha\bfseries}
	{}
	{\newline}
	{\vspace{1.5pt}\thmname{#1}\thmnumber{ #2}\thmnote{ --- #3}}
	
\newtheoremstyle{proof}
	{0pt}
	{0pt}
	{}
	{}
	{\@accent\sffamily\bfseries}
	{:}
	{4pt}
	{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{walk}
	{0pt}
	{0pt}
	{}
	{}
	{\@accent\sffamily\bfseries}
	{:}
	{0pt}
	{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{remark}
	{0pt}
	{0pt}
	{}
	{}
	{\@primary\sffamily\bfseries}
	{:}
	{1.5mm}
	{\thmname{#1}\thmnote{ #3}}
	
\theoremstyle{dbox}

\newmdtheoremenv[% settings
backgroundcolor=\@alternatecolor,
nobreak=true,
linecolor=\@primarycolor,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true]{theo}{Theorem}[section]

\newmdtheoremenv[% settings
backgroundcolor=bggray,
nobreak=true,
linecolor=\@primarycolor,
linewidth=2pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=false,
bottomline=false,
rightline=false,
leftline=true]{defi}[theo]{Definition}

\newmdtheoremenv[% settings
backgroundcolor=bggray,
nobreak=true,
linecolor=\@primarycolor,
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
linecolor=\@primarycolor,
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
linecolor=\@primarycolor,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true]{exer}[theo]{Exercise}

\newmdtheoremenv[% settings
backgroundcolor=\@alternatecolor,
nobreak=true,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=false,
bottomline=false,
rightline=false,
leftline=false]{lemma}[theo]{Lemma}

\newmdtheoremenv[% settings
backgroundcolor=\@alternatecolor,
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
linecolor=\@accentcolor,
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
linecolor=\@accentcolor,
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
linecolor=\@primarycolor,
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
linecolor=\@accentcolor,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=2pt,
innerbottommargin=4pt,
innerleftmargin=7pt
]{walk}{Walkthrough}

\renewcommand{\walk}{{\sffamily\@accent\bfseries Walkthrough:~}}