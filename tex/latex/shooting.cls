\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shooting}

\newif\iftwocol\twocoltrue
\newif\ifpurp\purptrue

\DeclareOption{onecol}{\twocolfalse}
\DeclareOption{blue}{\purpfalse}

\ProcessOptions\relax

\iftwocol
\newcommand\dist{0}
\LoadClass[twocolumn,openany]{book}
\else
\newcommand\dist{0.5}
\LoadClass[openany]{book}
\fi

\RequirePackage[letterpaper,top=2cm,bottom=2cm,left=1.5cm,right=1.5cm,includeheadfoot]{geometry}

\raggedbottom

\setlength{\columnsep}{30pt}

\input{fonts}

\usepackage{newpxtext}
\usepackage{newpxmath}
\let\openbox\relax % This is here because newpxmath and amsthm both define it, prevents conflict

\usepackage{babel}

\usepackage{tikz}
\RequirePackage{tkz-euclide}

\usepackage{asymptote}

\begin{asydef}
size(6cm);
import olympiad;
import cse5;
import geometry;
\end{asydef}

\usepackage{amsmath,amsthm,amssymb}
\usepackage{thmtools}
\usepackage{mdframed}

\RequirePackage{fontawesome}
\RequirePackage{marvosym}
\RequirePackage{pifont}
\RequirePackage{MnSymbol}
\RequirePackage[skaknew]{skak}

% useful operators

\input{mathOperators}

\usepackage{xcolor}

% dennis.sty colors for compatibility

\definecolor{darkmidnightblue}{rgb}{0.0, 0.2, 0.4}
\definecolor{sangria}{rgb}{0.57, 0.0, 0.04}
\definecolor{persianblue}{rgb}{0.11, 0.22, 0.73}

\definecolor{dennispurple}{RGB}{45,0,90} % dark purple
\definecolor{lightpurple}{RGB}{230,230,250}
\definecolor{importantred}{RGB}{100,15,15}

\definecolor{titlered}{RGB}{128, 0.0, 0.0}

% theorem colors

\definecolor{thmblue}{rgb}{0.88, 0.95, 0.98}
\definecolor{darkblue}{RGB}{36,57,108}

\definecolor{thmgreen}{RGB}{207,241,208}
\definecolor{darkgreen}{RGB}{30,70,30}

\definecolor{thmred}{RGB}{240, 200, 200}
\definecolor{darkred}{RGB}{120, 30, 20}

\definecolor{proofbrown}{RGB}{100,40,40}
\definecolor{proofbckg}{HTML}{fffdf5}

\definecolor{darkpurple}{RGB}{45,0,90} % dark purple
\definecolor{lightpurple}{RGB}{230,230,250}

\definecolor{solcolor}{RGB}{0,25,0}

\definecolor{remcolor}{RGB}{220,220,220}

\ifpurp

\definecolor{headpurp}{RGB}{240,230,250}

\definecolor{bgpurp}{RGB}{250,230,250}

\definecolor{npurp}{RGB}{125,50,125}

\definecolor{dpurp}{RGB}{110,45,110}
\else % blue

\definecolor{headpurp}{RGB}{200,230,255}

\definecolor{bgpurp}{RGB}{210,240,255}

\definecolor{npurp}{RGB}{0,40,150}

\definecolor{dpurp}{RGB}{0, 25, 100}
\fi

\definecolor{emred}{rgb}{0.57,0.0,0.04}

\definecolor{bggray}{RGB}{230,230,230}

\usepackage[hypertexnames=false]{hyperref}
\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=emred,
	urlcolor=emred
}

\newcommand{\dbold}[1]{{\bfseries\color{emred}#1}}

%toc setup

\usepackage{tocloft}
\renewcommand{\cfttoctitlefont}{\scshape\bfseries\Huge}
\renewcommand{\cftpartfont}{\hypersetup{linkcolor=dpurp}\notofont\bfseries\large\color{dpurp}}
\renewcommand{\cftchapfont}{\tlffont}

\renewcommand*\contentsname{Table of Contents}

\newcommand{\toc}{
{\hypersetup{linkcolor=black}
\tableofcontents
\pagebreak
}
}

% chess font black magic i do not care to understand

\RequirePackage{adjustbox} % needs adjustbox

\newcommand{\pawnB}[1][1.3ex]{%
\adjustbox{Trim=4.3pt 2.6pt 4.3pt 0pt,width=#1,margin=0.2ex 0ex 0.2ex 0ex}{\BlackPawnOnWhite}%
}%
\newcommand{\rookB}[1][1.58ex]{%
\adjustbox{Trim=3.2pt 2.2pt 3.2pt 0pt,width=#1,raise=0ex,margin=0.1ex 0ex 0.1ex 0ex}{\BlackRookOnWhite}%
}%
\newcommand{\knightB}[1][1.85ex]{%
\adjustbox{Trim=2.3pt 2.35pt 2.5pt 0pt,width=#1,raise=-0.03ex,margin=0.14ex 0ex 0.14ex 0ex}{\BlackKnightOnWhite}%
}%
\newcommand{\bishopB}[1][1.79ex]{%
\adjustbox{Trim=2.3pt 2pt 2.3pt 0pt,width=#1,raise=-0.12ex,margin=0.1ex 0ex 0.1ex 0ex}{\BlackBishopOnWhite}%
}%
\newcommand{\queenB}[1][2.05ex]{%
\adjustbox{Trim=1.2pt 2.2pt 1.2pt 0pt,width=#1,raise=-0.08ex,margin=0.1ex 0ex 0.1ex 0ex}{\BlackQueenOnWhite}%
}%
\newcommand{\kingB}[1][1.95ex]{%
\adjustbox{Trim=2pt 2pt 2pt 0pt,width=#1,raise=-0.06ex,margin=0.13ex 0ex 0.13ex 0ex}{\BlackKingOnWhite}%
}%

\newcommand{\probSymb}{\pawnB}
\newcommand{\reqSymb}{\knightB}

\newcommand{\minpt}[1]{Minimum is {\color{dpurp}[#1\,\probSymb]}. Problems denoted with {\color{importantred}\reqSymb} are required. (They still count towards the point total.)}

\newcommand{\psetquote}[2] % BE CAREFUL WITH THIS. must be DIRECTLY after minpt
{
\begin{flushright}
\begin{tikzpicture}
\draw (0,0) node [right,text width=8.75cm]{
\begin{mdframed}[linecolor=dpurp,leftline=true,rightline=false,bottomline=false,topline=false,linewidth=3pt,backgroundcolor=bgpurp]
{\alegreyafont``#1''}

\vspace{1mm}

\hfill\color{importantred}\fell#2
\end{mdframed}
};

\end{tikzpicture}
\end{flushright}
}

\newenvironment{prob}[2][]
{\parindent=0pt
\stepcounter{problem}
{\robotofont\color{dpurp}[#2~\probSymb]\;\textbf{Problem \theproblem\if\relax\detokenize{#1}\relax\else\hspace{3pt}(#1)\fi}}\hspace{-2pt}
}
{
\vspace{0.2cm}
}

\newenvironment{req}[2][]
{\parindent=0pt
\stepcounter{problem}
{\robotofont\color{importantred}[#2~\reqSymb]\;\textbf{Problem \theproblem\if\relax\detokenize{#1}\relax\else\hspace{3pt}(#1)\fi}}\hspace{-2pt}
}
{
\vspace{0.2cm}
}

% legacyyyy code

%\newcommand{\prob}[3]{
%{\parindent=0pt
%{\robotofont\color{dpurp}[#1\,\probSymb]\textbf{\if\relax\detokenize{#2}\else\hspace{3pt}(#2)\fi}}{\hspace{3pt}#3}
%\vspace{0.2cm}
%}
%}
%
%\newcommand{\req}[3]{
%{\parindent=0pt
%{\robotofont\color{importantred}[#1\,\reqSymb]\textbf{\if\relax\detokenize{#2}\else\hspace{3pt}(#2)\fi}}{\hspace{3pt}#3}
%\vspace{0.2cm}
%}
%}

%section

\usepackage[explicit]{titlesec}
\usepackage{fancybox}
\usepackage{nameref}

\usepackage{circledsteps}

\pgfkeys{/csteps/inner ysep=8pt}
\pgfkeys{/csteps/inner xsep=8pt}
\pgfkeys{/csteps/inner color=dpurp}
\pgfkeys{/csteps/fill color =bgpurp}

% all units in cm, since overlay

\newcommand{\partsize}{\fontsize{50}{60}\selectfont}
\newcommand{\smallpartsize}{\fontsize{28}{33.6}\selectfont}

\newcommand\pl{10} % length of rectangle (cm)
\newcommand\pw{6} % width of rectangle
\newcommand\pshift{0.2} % distance of box lines from each other
\newcommand\vs{2} % vertical shift

\usepackage{etoolbox}
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}
  {}{\errmessage{Cannot patch \string\part}}

\titleformat{\part}{}{}{0em}{
\thispagestyle{empty}
\begin{tikzpicture}[remember picture, overlay]
\coordinate (A) at ($(current page.center)+(0-\pl*1/2-\pshift,\vs+\pw*1/2-\pshift)$);
\coordinate (B) at ($(current page.center)+(0-\pl*1/2-\pshift,\vs-\pw*1/2-2*\pshift)$);
\coordinate (C) at ($(current page.center)+(\pl*1/2-\pshift,\vs-\pw*1/2-\pshift)$);
%
\coordinate (L) at ($(current page.center)+(0-\pl*1/2-2*\pshift,\vs+\pw*1/2-2*\pshift)$);
\coordinate (M) at ($(current page.center)+(0-\pl*1/2-2*\pshift,\vs-\pw*1/2-\pshift)$);
\coordinate (N) at ($(current page.center)+(\pl*1/2-2*\pshift,\vs-\pw*1/2-2*\pshift)$);
%
\draw (A)--(B)--(N);
\draw (L)--(M)--(C);
%
\coordinate (D) at ($(current page.center)+(0-\pl*1/2+\pshift,\vs+\pw*1/2+\pshift)$);
\coordinate (E) at ($(current page.center)+(\pl*1/2+\pshift,\vs+\pw*1/2+2*\pshift)$);
\coordinate (F) at ($(current page.center)+(\pl*1/2+\pshift,\vs-\pw*1/2+\pshift)$);
%
\coordinate (P) at ($(current page.center)+(0-\pl*1/2+2*\pshift,\vs+\pw*1/2+2*\pshift)$);
\coordinate (Q) at ($(current page.center)+(\pl*1/2+2*\pshift,\vs+\pw*1/2+\pshift)$);
\coordinate (R) at ($(current page.center)+(\pl*1/2+2*\pshift,\vs-\pw*1/2+2*\pshift)$);
%
\draw (P)--(E)--(F);
\draw (D)--(Q)--(R);
\node at ($(current page.center)+(0,\vs)$)[align=center]{
\\[1\baselineskip]
{\partsize\partname\;\thepart}\\[2.5\baselineskip]
{\smallpartsize#1}
};
\end{tikzpicture}%
}

\newlength{\mylen}

\usepackage{xstring,xifthen}
\usepackage{ragged2e}

\iftwocol
\titleformat{\section}{\notofont\Large\bfseries}{}{0em}{
\hspace{-12pt}
\settowidth{\mylen}{\thesection}
\begin{tikzpicture}[ anchor = south west]
\node at (0,0) {\color{npurp}\Circled{\thesection}};
\node at (\mylen*1.1+12,0.86) [text width = 8cm,anchor=north west]{
{#1}
};
\end{tikzpicture}
}[\vspace{-0.9cm}]
\else
\titleformat{\section}{\notofont\Large\bfseries}{}{-0.9em}{
\settowidth{\mylen}{\thesection}
\begin{tikzpicture}[ anchor = south west]
\node at (0,0) {\color{npurp}\Circled{\thesection}};
\node at (\mylen*1.1+12,0.86) [text width=17cm, anchor=north west]{
{#1}
};
\end{tikzpicture}
\def\secstring{\thesection}
\StrLen{\secstring}[\seclength]
\ifthenelse{\seclength > 3}{\vspace{-0.65cm}}{}
}[\vspace{-0.45cm}]
\fi

\titleformat{name=\section,numberless}{\notofont\Large\bfseries}{}{0em}{#1}

\titleformat{\subsection}{\notofont\large\bfseries}{\thesubsection}{0.9em}{#1}

\newcommand{\chsize}{\fontsize{28}{34}\selectfont}

\usepackage{nameref}

\newcounter{chapterid}\setcounter{chapterid}{0} % gives each chapter a unique id even if you change the numbering for sols or wtv

\titleformat{\chapter}[display]{}
{
\stepcounter{chapterid}
\begin{tikzpicture}[remember picture,overlay,anchor = north west]
\path (current page.north west) node[below right,fill=headpurp,minimum width=\paperwidth, minimum height=4cm] (box){};
\path (current page.north west) node[below right,fill=dpurp,minimum width=\paperwidth, minimum height=0.4cm] (box){};
\coordinate (ur) at (\paperwidth-55,1.8+\dist);
\path (ur) node[below left,fill=dpurp,minimum width=3cm, minimum height = 3cm](box){
\scalebox{2}{\deffont\Huge\color{white}\bfseries\thechapter}
};
\coordinate (ch) at (\paperwidth-300,0.9+\dist);
\path (ch) node(box){\scalebox{1.5}{\bask\Huge\bfseries\scshape{\chaptername}}};
\end{tikzpicture}
}{0pt}{
\begin{tikzpicture}[remember picture, overlay, anchor=south west]
\node (chtext) at (0,1.65+\dist) {
\parbox{15cm}{\begin{flushleft}\begin{hyphenrules}{nohyphenation}\newpx\chsize#1\end{hyphenrules}\end{flushleft}}
};
\end{tikzpicture}
}[\vspace{3em}\label{\thechapterid}]

%\newcommand{\chapterquote}[2] % meh dont think this is any good
%{
%\begin{tikzpicture}[remember picture,overlay,anchor=north west]
%\coordinate (chq) at (4.2,5.5);
%\node (quo) at (chq) [left,text width=9.1cm,anchor=north]{
%\begin{mdframed}[linecolor=dpurp,leftline=true,rightline=false,bottomline=false,topline=false,linewidth=3pt,backgroundcolor=bgpurp]
%{\bask``#1''}
%
%\vspace{1mm}
%
%\hfill\color{emred}\fell#2
%\end{mdframed}
%};
%
%\end{tikzpicture}
%}

\usepackage{fancyhdr}
\pagestyle{fancy}

\renewcommand{\headrulewidth}{0pt}

\fancyhead{}

\fancyfoot[RO] {\ifnum\value{chapter}>0\relax\scshape{\bfseries\bask \chaptername\;\thechapter}\;\;{\hypersetup{
	colorlinks,
	citecolor=black,
	filecolor=black,
	linkcolor=black,
	urlcolor=black
}\nameref{\thechapterid}}\;\;\;\;\fi\normalsize{\bask \bfseries\thepage}}
\fancyfoot[LE] {\bask\thepage}
\fancyfoot[C] {}

\fancypagestyle{plain}{
\fancyhf{}
\fancyfoot[RO,LE]{\bask\thepage}
\renewcommand{\headrulewidth}{0pt}
}

%theorem spam

\newtheoremstyle{dbox}%                % Name
	{0pt}%                                     % Space above
	{2pt}%                                     % Space below
	{}%                                     % Body font
	{}%                                     % Indent amount
	{\color{npurp}\cha\bfseries}%                            % Theorem head font
	{}%                                    % Punctuation after theorem head
	{\newline}%                                    % Space after theorem head, ' ', or \newline
	{\vspace{1.5pt}\thmname{#1}\thmnumber{ #2}\thmnote{ --- #3}}%

\newtheoremstyle{proof}
{0pt}
{0pt}
{}
{}
{\color{emred}\sffamily\bfseries}
{:}
{4pt}
{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{remark}
{0pt}
{0pt}
{}
{}
{\color{dpurp}\sffamily\bfseries}
{:}
{4pt}
{\thmname{#1}\thmnote{ #3}}

\newtheoremstyle{walk}
{0pt}
{0pt}
{}
{}
{\color{emred}\sffamily\bfseries}
{:}
{0pt}
{\thmname{#1}\thmnote{ #3}}

\theoremstyle{dbox}

\newmdtheoremenv[% settings
backgroundcolor=bgpurp,
nobreak=true,
linecolor=npurp,
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
linecolor=npurp,
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
linecolor=npurp,
linewidth=2pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=false,
bottomline=false,
rightline=false,
leftline=true]{fact}[theo]{Fact}

\newmdtheoremenv[% settings
backgroundcolor=white,
nobreak=true,
linecolor=npurp,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true]{exam}[theo]{Example}

\newmdtheoremenv[% settings
backgroundcolor=white,
nobreak=true,
linecolor=npurp,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true]{exer}[theo]{Exercise}

\newmdtheoremenv[% settings
backgroundcolor=thmblue,
nobreak=true,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=false,
bottomline=false,
rightline=false,
leftline=false]{lemma}[theo]{Lemma}

\newmdtheoremenv[% settings
backgroundcolor=thmblue,
nobreak=true,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=false,
bottomline=false,
rightline=false,
leftline=false]{corollary}[theo]{Corollary}

\theoremstyle{proof}

\newmdtheoremenv[
nobreak=false,
linecolor=emred,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=3pt,
innerbottommargin=3.5pt,
innerleftmargin=4pt
]{pro}{Proof}

\def\endpro{\hfill$\blacksquare$}

\newmdtheoremenv[
nobreak=false,
linecolor=emred,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=3pt,
innerbottommargin=3.5pt,
innerleftmargin=4pt
]{sol}{Solution}

\theoremstyle{remark}

\newmdtheoremenv[
nobreak=false,
linecolor=dpurp,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=3pt,
innerbottommargin=3.5pt,
innerleftmargin=4pt
]{remark}{Remark}

\theoremstyle{walk}

\newmdtheoremenv[
nobreak=false,
linecolor=emred,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=2pt,
innerbottommargin=4pt,
innerleftmargin=4pt
]{walk}{Walkthrough}

\renewcommand{\walk}{{\sffamily\color{emred}\bfseries Walkthrough:~}}

%hints and solutions

\RequirePackage{ifthen}
\RequirePackage{answers}
% Setup counters
\newcounter{hindex}\setcounter{hindex}{0}
\newcounter{hintcounter}\setcounter{hintcounter}{0}
\newcounter{sindex}\setcounter{sindex}{0}
\newcounter{solcounter}\setcounter{solcounter}{0}
% Define \addhint and \gethint
% \addhint is used as \begin{addhint}{type in your hint}\end{addhint}
% \gethint is not used manually.
\newcommand\addhint[1]{%
\stepcounter{hintcounter}%
\ref{hint:\thehintcounter}%
\expandafter\gdef\csname hintlist\thehintcounter\endcsname{#1}%
}
\newcommand\gethint[1]{%
\item \csname hintlist#1\endcsname \label{hint:#1}
}
\newcommand\addsol[1]{%
\stepcounter{solcounter}%
\ref{sol:\thesolcounter}%
\expandafter\gdef\csname sollist\thesolcounter\endcsname{#1}%
}
\newcommand\getsol[1]{%
\item \csname sollist#1\endcsname \label{sol:#1}
}
% You put (typically) \begin{hint}All of your \begin{addhint}..\end{addhint} here\end{hint} so it looks like Hint: # # #
\newenvironment{hint}{\mbox\bgroup\footnotesize\normalfont\textbf{Hints}:}{\hspace{-0.5ex}\egroup}
\newenvironment{hintone}{\mbox\bgroup\footnotesize\normalfont\textbf{Hint}:}{\hspace{-0.5ex}\egroup}
\newenvironment{solu}{\mbox\bgroup\footnotesize\normalfont\textbf{Solution}:}{\hspace{-0.5ex}\egroup}
\RequirePackage{changepage}

% compatibility with dennis sty

\newcommand{\chapterquote}[2]{}

\newcommand{\Item}{\item}

\newcommand{\overarc}{\widehat} % overarc is so ugly anyways

\definecolor{sangria}{rgb}{0.57, 0.0, 0.04} % EEG Cover

\RequirePackage{tcolorbox} % EEG cover

\RequirePackage{enumitem}

% compatibility with lucky sty

\newcommand{\db}{\dbold}

\newcommand{\ansbold}[1]{{\color{dpurp}\mathbf{#1}}}

\input{tikzMacros}

\newcommand{\problems}{\pagebreak\section{Problems}}