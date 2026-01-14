%ULBreport.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ULBreport}
\LoadClass[a4paper,12pt]{report}

%%%%Structure%%%%

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%Language
% \RequirePackage{csquotes}
\RequirePackage[hyperref]{csquotes} % Fixes hyperlink issue with citations
\RequirePackage[english]{babel}
% \RequirePackage[backend=biber,citestyle=alphabetic,bibstyle=authoryear]{biblatex}
\RequirePackage[backend=biber, style=alphabetic]{biblatex}

\RequirePackage{tabularx}
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm]{geometry}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{xkeyval}
\RequirePackage{ifthen}

%%%%package tikz%%%%

\RequirePackage{tikz}
\usetikzlibrary{mindmap}
\RequirePackage{chemfig}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}

%%%%Forme%%%%
% Fix chapter heading spacing
\RequirePackage{titlesec}
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}
  {\chaptertitlename\ \thechapter}
  {0pt} % Space between chapter number and title
  {\Huge}
\titlespacing*{\chapter}{0pt}{-30pt}{30pt} % Reduce space before chapter title

\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\arabic{section}} % Remove chapter number
  {1em}
  {}

\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\thesubsection} % Already includes section number
  {1em}
  {}


%Picture package
\RequirePackage{graphicx}
\RequirePackage{textcomp}
\RequirePackage{eurosym}
\RequirePackage{mwe}
\RequirePackage{listings}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{ccaption}
\RequirePackage{colortbl}
\RequirePackage{framed}
\RequirePackage{xcolor}
\RequirePackage{fourier}
\RequirePackage[pages=some]{background}

%%%%Math%%%%

\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\usetikzlibrary{arrows,matrix,positioning}
\usetikzlibrary{3d,calc}
\RequirePackage[makeroom]{cancel}
\RequirePackage{esint}

%%%%Annexe%%%%

\RequirePackage[toc,page]{appendix}
\linespread{1.0}
\renewcommand{\appendixtocname}{Annexes}
\renewcommand{\appendixpagename}{Annexes}

%%%%Couleurs%%%%

\definecolor{apricot}{rgb}{0.98, 0.81, 0.69}
\definecolor{bleu}{rgb}{0.19, 0.55, 0.91}
\definecolor{rouge}{rgb}{0.77, 0.12, 0.23}
\definecolor{vert}{rgb}{0.13, 0.55, 0.13}
\definecolor{antiquefuchsia}{rgb}{0.57, 0.36, 0.51}
\colorlet{shadecolor}{cyan!30!white}
\colorlet{framecolor}{blue!50!black}

%%%%Custom command%%%%

\newcommand{\rouge}[1]{\textcolor{rouge}{#1}}
\newcommand{\bleu}[1]{\textcolor{bleu}{#1}}
\newcommand{\verts}[1]{\textcolor{vert}{#1}}

\makeatletter

%Keys for title page
\define@cmdkey [PRE] {fam} {title}{}
\define@cmdkey [PRE] {fam} {studies}{}
\define@cmdkey [PRE] {fam} {course}{}
\define@cmdkey [PRE] {fam} {author}{}
\define@cmdkey [PRE] {fam} {teacher}{}
\define@cmdkey [PRE] {fam} {date}{}
\define@cmdkey [PRE] {fam} {logo}{}
\define@cmdkey [PRE] {fam} {manyAuthor}[1]{}
%Set default value for the keys (used if not specified)
\presetkeys         [PRE] {fam} {title=titre,
								 studies=,
								 course=,
								 author=Auteurs,
								 teacher=,
								 date=,
								 logo=7,
                                 manyAuthor=8,}{}
\tikzset{vertical custom shading/.code={%
 \pgfmathsetmacro\tikz@vcs@middle{#1}
 \pgfmathsetmacro\tikz@vcs@bottom{\tikz@vcs@middle/2}
 \pgfmathsetmacro\tikz@vcs@top{(100-\tikz@vcs@middle)/2+\tikz@vcs@middle}
\pgfdeclareverticalshading[tikz@axis@top,tikz@axis@middle,tikz@axis@bottom]{newaxis}{100bp}{%
  color(0bp)=(tikz@axis@bottom);
  color(\tikz@vcs@bottom bp)=(tikz@axis@bottom);
  color(\tikz@vcs@middle bp)=(tikz@axis@middle);
  color(\tikz@vcs@top bp)=(tikz@axis@top);
  color(100bp)=(tikz@axis@top)}
  \pgfkeysalso{/tikz/shading=newaxis}
  }
}

% Title command
\newcommand*{\titleULB}[1]{
    % \RequirePackage{fourier} % Load fourier ONLY for the title page
    \setkeys[PRE]{fam}{#1}
    \begingroup
    \BgThispage
	% Replace logo with nothing if not specified
	\ifthenelse{\equal{\cmdPRE@fam@logo}{7}}{}{\centering\includegraphics[height=2.5cm,width=12cm,keepaspectratio]{img/logo_vub_ulb.png}\\}
	{\cmdPRE@fam@studies}
	\begin{center}
	\vspace*{\baselineskip}
	{\bfseries \cmdPRE@fam@course}\\[\baselineskip]
	\rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}
	\rule{\textwidth}{0.4pt}\\[\baselineskip]
	{\Huge \cmdPRE@fam@title}\\[\baselineskip]
	\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt}
	\rule{\textwidth}{1.6pt}\\[\baselineskip]
	\ifthenelse{\equal{\cmdPRE@fam@manyAuthor}{8}}{
	{\Large \cmdPRE@fam@author}\\[\baselineskip]
	{\bfseries \cmdPRE@fam@teacher}}{
	    \begin{minipage}{0.4\textwidth}
	        \begin{flushleft} \large
	        \cmdPRE@fam@author
	        \end{flushleft}
	    \end{minipage}
	    \begin{minipage}{0.4\textwidth}
	        \begin{flushright} \large
	        \cmdPRE@fam@teacher
	        \end{flushright}
	    \end{minipage}
	}
	\vfill
	{\cmdPRE@fam@date}
	\end{center}
	\vspace*{3\baselineskip}
        \pagenumbering{gobble}
	    \clearpage
    \null
    \thispagestyle{empty}
    \newpage

        \newpage
	\tableofcontents
        \endgroup
    \newpage
    \pagenumbering{arabic}
\endgroup}



\makeatother

%Command to put the seal of ULB in Background of the first page
\newcommand{\sceau}[1]{\backgroundsetup{
scale=1,
color=black,
opacity=0.05,
angle=10,
position={12cm,-22cm},
contents={%
  \includegraphics[height=20cm,width=20cm,keepaspectratio]{#1}
  }%
}}


%This is used to force the label alphabetic for the citation of biblio
% begin: excerpt from `alphabetic.bbx'
\DeclareFieldFormat{labelalphawidth}{\mkbibbrackets{#1}}
 
\defbibenvironment{bibliography}
   {\list
      {\printtext[labelalphawidth]{%
         \printfield{prefixnumber}%
     \printfield{labelalpha}%
         \printfield{extraalpha}}}
      {\setlength{\labelwidth}{\labelalphawidth}%
       \setlength{\leftmargin}{\labelwidth}%
       \setlength{\labelsep}{\biblabelsep}%
       \addtolength{\leftmargin}{\labelsep}%
       \setlength{\itemsep}{\bibitemsep}%
       \setlength{\parsep}{\bibparsep}}%
       \renewcommand*{\makelabel}[1]{##1\hss}}
   {\endlist}
   {\item}
% end: excerpt from `alphabetic.bbx'