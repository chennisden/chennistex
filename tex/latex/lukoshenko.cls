\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lukoshenko}

\LoadClass[openany]{book}

\RequirePackage[letterpaper, top=2cm, bottom=2cm, left=1.5cm, right=1.5cm, includeheadfoot]{geometry}

\raggedbottom

% crucial imports

\usepackage{amsmath,amsthm,amssymb}
\usepackage{thmtools}
\usepackage{mdframed}

\usepackage{asymptote}
\usepackage{tikz}
\usepackage{tkz-euclide}

% dennis imports

\input{universal}

% formatting

\usepackage[explicit]{titlesec}
\usepackage{etoolbox}
\usepackage{fancybox}
\usepackage{nameref}

\usepackage{circledsteps}
\pgfkeys{/csteps/inner ysep=8pt}
\pgfkeys{/csteps/inner xsep=8pt}

% part

\usepackage{anyfontsize}
\newcommand{\partsize}{\fontsize{50}{60}\selectfont}
\newcommand{\smallpartsize}{\fontsize{28}{33.6}\selectfont}

\newcommand\pl{10} % length of rectangle (cm)
\newcommand\pw{6} % width of rectangle
\newcommand\pshift{0.2} % distance of box lines from each other
\newcommand\vs{2} % vertical shift

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
{\newpx\partsize\partname\;\thepart}\\[2.5\baselineskip]
{\newpx\smallpartsize#1}
};
\end{tikzpicture}%
}

% chapter



% problem

\newcounter{problem}\setcounter{problem}{0} % Problem number counter

\newcommand{\minpt}[1]{Minimum is [#1\,\probSymb]. Problems denoted with {\reqSymb} are required. (They still count towards the point total.)}

\newcommand{\psetquote}[2] % BE CAREFUL WITH THIS. must be DIRECTLY after minpt
{
\begin{flushright}
\begin{tikzpicture}
\draw (0,0) node [right,text width=8.75cm]{
\begin{mdframed}[linecolor=black,leftline=true,rightline=false,bottomline=false,topline=false,linewidth=1pt,backgroundcolor=white]
{\alegreyafont``#1''}

\vspace{1mm}

\hfill \fell#2
\end{mdframed}
};

\end{tikzpicture}
\end{flushright}
}

\newcommand{\prob}[3]{
{\parindent=0pt
\stepcounter{problem}
{\robotofont[#1\,\probSymb] Problem \theproblem \textbf{\if\relax\detokenize{#2}\else\hspace{3pt}(#2)\fi}}{\hspace{3pt}#3}
\vspace{0.2cm}
}
}

\newcommand{\req}[3]{
{\parindent=0pt
\stepcounter{problem}
{\robotofont [#1\,\reqSymb] Required Problem \theproblem \textbf{\if\relax\detokenize{#2}\else\hspace{3pt}(#2)\fi}}{\hspace{3pt}#3}
\vspace{0.2cm}
}
}

% theorems

% styles

\newtheoremstyle{luko}
{0pt}
{2pt}
{}
{}
{\cha\bfseries}
{}
{\newline}
{\vspace{1.5pt}\thmname{#1}\thmnumber{ #2}\thmnote{ --- #3}}

\newtheoremstyle{pro}
{0pt}
{2pt}
{}
{}
{\cha\bfseries}
{}
{0pt}
{\thmname{#1}{: #3}}

\newtheoremstyle{lemma}
{0pt}
{2pt}
{}
{}
{\cha\bfseries}
{}
{0pt}
{\thmname{#1}{ --- #3}}

% specific theorems

\theoremstyle{luko}

% full box

\newmdtheoremenv[
backgroundcolor=white,
nobreak=true,
linecolor=black,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true
]{theo}{Theorem}[section]

\newmdtheoremenv[
backgroundcolor=white,
nobreak=true,
linecolor=black,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true
]{defi}[theo]{Definition}

\newmdtheoremenv[
backgroundcolor=white,
nobreak=true,
linecolor=black,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true
]{fact}[theo]{Fact}

\newmdtheoremenv[
backgroundcolor=white,
nobreak=true,
linecolor=black,
linewidth=0.6pt,
innerleftmargin=7pt,
innerrightmargin=7pt,
innertopmargin=7pt,
topline=true,
bottomline=true,
rightline=true,
leftline=true
]{corollary}[theo]{Corollary}

% left line

\newmdtheoremenv[
backgroundcolor=white,
nobreak=false,
linecolor=black,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=2pt,
innerbottommargin=2pt,
innerleftmargin=7pt
]{exam}{Example}

\newmdtheoremenv[
backgroundcolor=white,
nobreak=false,
linecolor=black,
linewidth=1pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
innertopmargin=0pt,
innerbottommargin=2pt,
innerleftmargin=4pt
]{exer}{Exercise}

% boring

\theoremstyle{pro}

\newtheorem*{proofLuko}{Proof}

\newenvironment{pro}[1]{%
    \begin{proofLuko}#1}{%
    \hfill$\qed$\end{proofLuko}%
}

\newtheorem*{sol}{Solution}

\theoremstyle{lemma}

\newtheorem*{lemma}{Lemma}

\newtheorem*{remark}{Remark}