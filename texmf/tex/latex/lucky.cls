\ProvidesClass{lucky}
\LoadClass{article}

%%%%%%%%%
%OPTIONS%
%%%%%%%%%

% booleans

\newif\ifnumber\numberfalse

\DeclareOption{mast}{\numbertrue} % numbers problems

\ProcessOptions\relax

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

% universal

\RequirePackage{universal} % custom package created by Dennis Chen

% hyperref

\RequirePackage[hypertexnames=false]{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=darkblue,
	urlcolor=darkblue
}

% toc looks bad with hyperref

\newcommand{\toc}{
	{\hypersetup{
				citecolor=black,
				filecolor=black,
				linkcolor=black,
				urlcolor=black}
			\tableofcontents}
}

%%%%%%%%%%%%%
%PAGE LAYOUT%
%%%%%%%%%%%%%

\RequirePackage[letterpaper,top=2cm,bottom=2cm,left=2.5cm,right=2.5cm,includeheadfoot]{geometry} % geometry has to be BEFORE fancyhdr for margins to work!

%%%%%%%%%%%%%%%%%%%
%FONTS AND SYMBOLS%
%%%%%%%%%%%%%%%%%%%

\RequirePackage{newpxtext,newpxmath}

\RequirePackage{fontawesome}
\RequirePackage{marvosym}
\RequirePackage{pifont}
\RequirePackage[skaknew]{skak}

% itemize symbols
\renewcommand{\labelitemi}{$\blacksquare$}
\renewcommand{\labelitemii}{\ding{70}}
\renewcommand{\labelitemiii}{$\bullet$}

%%%%%%%%
%COLORS%
%%%%%%%%

\RequirePackage{xcolor}

\definecolor{remcolor}{RGB}{220,220,220}

\definecolor{dennispurple}{RGB}{45,0,90} % dark purple
\definecolor{lightpurple}{RGB}{230,230,250}

\definecolor{importantred}{RGB}{100,15,15}
\definecolor{thmred}{RGB}{240, 200, 200}

\definecolor{thmblue}{rgb}{0.88, 0.95, 0.98}
\definecolor{darkblue}{RGB}{36,57,108}

\definecolor{thmgreen}{RGB}{207,241,208}
\definecolor{darkgreen}{RGB}{30,70,30}

%%%%%%%%%%%%%%%%%%%
%TITLE AND HEADERS%
%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox} % used for patchcmd

\patchcmd{\@maketitle}{\@title}{\merri\color{dennispurple}\bfseries\@title}{}{}
\patchcmd{\@maketitle}{\@author}{\merri\@author}{}{}
\patchcmd{\@maketitle}{\@date}{\merri\color{dennispurple}{\@date}}{}{}

%%%%%%%%%%%%
%SECTIONING%
%%%%%%%%%%%%

\RequirePackage{titlesec}

\titleformat{\section}
{\notofont\Large\bfseries}{{\color{dennispurple}\faGlobe\,\thesection}}{0.8em}{}

% subsections
\titleformat{\subsection}
{\sffamily\large\bfseries}{{\color{dennispurple}\thesubsection}}{0.9em}{}

%subsubsections (just in case!)

\titleformat{\subsubsection}
{\sffamily\normalsize\bfseries}{{\color{dennispurple}\thesubsubsection}}{0.9em}{}

%%%%%%
%EMPH%
%%%%%%

% db to be dennispurple

\newcommand{\db}[1]{{\color{dennispurple}\bfseries #1}}
\newcommand{\dbold}[1]{\db{#1}}

\newcommand{\ansbold}[1]{{\color{dennispurple}\mathbf{#1}}}

%%%%%%%%%%
%PROBLEMS%
%%%%%%%%%%

% takes care of chess symbol black magic :)

\RequirePackage{chessBM}

% page setup

\newcommand{\problems}{\pagebreak\section{Problems}}

\newcommand{\minpt}[1]{Minimum is {\color{dennispurple}[#1\,\probSymb]}. Problems denoted with {\color{importantred}\reqSymb} are required. (They still count towards the point total.)}

\newcommand{\psetquote}[2] % BE CAREFUL WITH THIS. must be DIRECTLY after minpt
{
	\begin{flushright}
		\begin{tikzpicture}
			\draw (0,0) node [right,text width=8.75cm]{
				\begin{mdframed}[linecolor=dennispurple,leftline=true,rightline=false,bottomline=false,topline=false,linewidth=3pt,backgroundcolor=lightpurple]
					{\alegreyafont``#1''}

					\vspace{1mm}

					\hfill\color{importantred}\fell#2
				\end{mdframed}
			};

		\end{tikzpicture}
	\end{flushright}
}

% actual problems

\newcounter{problem}
\setcounter{problem}{0}

\ifnumber

	\newenvironment{prob}[2][]{
		{\parindent=0pt
				\raggedright
				\stepcounter{problem}
				\robotofont\color{dennispurple}[#2\,\probSymb]\;\textbf{Problem \theproblem\if\relax\detokenize{#1}\else{} (#1)\fi}}\hspace{3.5pt}\ignorespaces
	}
	{
		\vspace{0.2cm}
	}

	\newenvironment{req}[2][]{
		{\parindent=0pt
				\raggedright
				\stepcounter{problem}
				\robotofont\color{importantred}[#2\,\reqSymb]\;\textbf{Problem \theproblem\if\relax\detokenize{#1}\else{} (#1)\fi}}\hspace{3.5pt}\ignorespaces
	}
	{
		\vspace{0.2cm}
	}

\else

	\newenvironment{prob}[2][]{
		{\parindent=0pt
				\raggedright
				\robotofont\color{dennispurple}[#2\,\probSymb]\textbf{\if\relax\detokenize{#1}\else\hspace{3pt}(#1)\fi}}\hspace{3.5pt}\ignorespaces
	}
	{
		\vspace{0.2cm}
	}

	\newenvironment{req}[2][]{
		{\parindent=0pt
				\raggedright
				\robotofont\color{importantred}[#2\,\reqSymb]\textbf{\if\relax\detokenize{#1}\else\hspace{3pt}(#1)\fi}}\hspace{3.5pt}\ignorespaces
	}
	{
		\vspace{0.2cm}
	}

\fi

%%%%%%%%%%
%THEOREMS%
%%%%%%%%%%

% theorem styles

\newtheoremstyle{theo}%                % Name
{0pt}%                                     % Space above
{0pt}%                                     % Space below
{}%                                     % Body font
{}%                                     % Indent amount
{\color{darkblue}\sffamily\bfseries}%                            % Theorem head font
{.}%                                    % Punctuation after theorem head
{1.5mm}%                                    % Space after theorem head, ' ', or \newline
{\thmnote{#3}}%                                     % Theorem head spec (can be left empty, meaning `normal')

\newtheoremstyle{def}
{0pt}
{0pt}
{}
{}
{\color{darkgreen}\sffamily\bfseries}
{.}
{1.5mm}
{\thmnote{#3}}

\newtheoremstyle{ex}
{0pt}
{0pt}
{}
{}
{\color{importantred}\sffamily\bfseries}
{.}
{1.5mm}
{\thmname{#1}\thmnote{ (#3)}}

\newtheoremstyle{proof}
{0pt}
{0pt}
{}
{}
{\color{dennispurple}\notofont\bfseries}
{.}
{1.5mm}
{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{solution}
{0pt}
{0pt}
{}
{}
{\color{importantred}\notofont\bfseries}
{.}
{1.5mm}
{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{remark}
{0pt}
{0pt}
{}
{}
{\color{black}\sffamily\bfseries}
{:}
{1.5mm}
{\thmname{#1}\thmnote{ #3}}

% theorems

\theoremstyle{theo}

\newmdtheoremenv[
	backgroundcolor=thmblue,
	nobreak=true,
	innertopmargin=5pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	linecolor=darkblue,
	linewidth=0.5pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{theo}{Theorem}

\theoremstyle{def}

\newmdtheoremenv[
	backgroundcolor=thmgreen,
	nobreak=true,
	innertopmargin=5pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	linecolor=darkgreen,
	linewidth=0.5pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{defi}{Definition}

\theoremstyle{ex}

\newmdtheoremenv[
	backgroundcolor=thmred,
	nobreak=true,
	innertopmargin=5pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	linecolor=importantred,
	linewidth=0.5pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{exam}{Example}

\newmdtheoremenv[
	backgroundcolor=thmred,
	nobreak=true,
	innertopmargin=5pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	linecolor=importantred,
	linewidth=0.5pt,
	topline=true,
	bottomline=true,
	rightline=true,
	leftline=true]{exer}{Exercise}

\theoremstyle{proof}

\newmdtheoremenv[
	backgroundcolor=lightpurple,
	nobreak=true,
	innertopmargin=5pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	linecolor=dennispurple,
	linewidth=3pt,
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=true]{pro}{Proof}

\theoremstyle{solution}

\newmdtheoremenv[
	nobreak=false,
	linecolor=importantred,
	linewidth=3pt,
	leftline=true,
	rightline=false,
	topline=false,
	bottomline=false,
	innertopmargin=3pt,
	innerbottommargin=3.5pt,
	innerleftmargin=7pt
]{sol}{Solution}

\newtheorem*{walk}{Walkthrough}

\def\walk{{\color{importantred}\sffamily\bfseries Walkthrough:} $\phantom{}$}

\theoremstyle{remark}

\newmdtheoremenv[
	backgroundcolor=remcolor,
	nobreak=true,
	innertopmargin=5pt,
	innerleftmargin=7pt,
	innerrightmargin=7pt,
	linecolor=black,
	linewidth=3pt,
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=true]{remark}{Remark}

\newenvironment{fact}{\begin{theo}}{\end{theo}}

\newcommand{\answer}[5]{\vspace{0.2cm}\noindent$\textbf{(A)}\ #1 \qquad\textbf{(B)}\ #2 \qquad\textbf{(C)}\ #3 \qquad\textbf{(D)}\ #4 \qquad\textbf{(E)}\ #5$}