%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% reportisel.cls
%%% ISEL/IPL Report document class
%%%
%%% By Matilde Pós-de-Mina Pato (mpato@deetc.isel.ipl.pt)
%%% Version1.0 of March 2017
%%%
%%% This template is vaguely based on a template from the
%%%    reportisel.cls
%%%	   ISEL/IPL Dissertation document class (NOT OFFICIAL)
%%%
%%% BUGS and SUGGESTIONS: please send email to "mpato@deetc.isel.ipl.pt"
%%% CONTRIBUTERS are welcome. Please contact "mpato@deetc.isel.ipl.pt"
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportisel}[2017/03/13 ISEL report template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% == Languages ===
\DeclareOption{pt}{%
  \let\@language=0%
  \PassOptionsToPackage{portuguese,english}{babel}}

\DeclareOption{en}{%
  \let\@language=1%
  \PassOptionsToPackage{portuguese,english}{babel}}

% == Printing ===
\DeclareOption{oneside}{%
  \PassOptionsToClass{oneside}{book}}

\DeclareOption{twoside}{%
  \PassOptionsToClass{twoside}{book}}

% == Paper type/format (dfault A4) ===
\PassOptionsToClass{a4paper}{book} % Default paper format

\DeclareOption{a4}{%
	\PassOptionsToClass{a4paper}{book}}

\DeclareOption{a4paper}{%
	\PassOptionsToClass{a4paper}{book}}

% == Font Size ===
\PassOptionsToClass{12pt}{book} % Default point size

\DeclareOption{11pt}{%
	\PassOptionsToClass{11pt}{book}}

\DeclareOption{12pt}{%
	\PassOptionsToClass{12pt}{book}}


% == Text Encoding ===
\let\@utf=1
\DeclareOption{latin1}{\let\@utf=0}
\DeclareOption{utf8}{\let\@utf=1}

% == Type of Document ===
%\let\@degreetype=3
\DeclareOption{rpt}{
	\let\@degreetype=0
	\def\@degree{\@bachelorreport}
	\def\@dissertationtype{\@rptdissertationtstr}
}
\DeclareOption{preprpt}{
	\let\@degreetype=1
	\def\@degree{\@mastersdegree}
	\def\@dissertationtype{\@preprptdissertationtstr}
}


% == Default Options ===
\ExecuteOptions{pt,rpt}
\ProcessOptions

\LoadClass{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Latin1
\if\@utf0
\RequirePackage[latin1]{inputenc}
% UTF8
\else\if\@utf1
\RequirePackage[utf8]{inputenc}
\fi\fi

\RequirePackage[T1]{fontenc}

%====================================================================
% PACKAGE amsmath, amsthm, amssymb, amsfonts:
%====================================================================
% This package is typically required. Among many other things it adds the possibility
% to put symbols in bold by using \boldsymbol (not \mathbf); defines additional 
% fonts and symbols; adds the \eqref command for citing equations. I prefer the style
% "(x.xx)" for referering to an equation than to use "equation x.xx".

%\RequirePackage{amsmath,amsfonts,amssymb,amsthm,verbatim, mathabx} 

\RequirePackage{csquotes}
\RequirePackage{babel}

\RequirePackage[toc]{appendix}

% \RequirePackage{tabularx}
 
\RequirePackage{ifthen}

\RequirePackage{titlesec}           % To format the headings
\RequirePackage{fancyhdr}        % Headings configuration

% Set inter-line spacing
\RequirePackage{setspace}           % One-and-half spacing
\onehalfspacing

%\RequirePackage{mathptmx}
\RequirePackage[scaled]{helvet}
\RequirePackage{courier}
\RequirePackage{palatino}

%\usepackage{multicol}
%\usepackage{minted}

\usepackage{ifpdf}		% This is now the recommended way for checking for PDFLaTeX:
\ifpdf
	\RequirePackage[pdftex]{graphicx}
	\DeclareGraphicsExtensions{.pdf, .png, .jpg, .tif}
	\RequirePackage[pdftex,usenames,dvipsnames]{xcolor}
	\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
	\RequirePackage[pdftex,
		breaklinks = true,
		colorlinks,
		pdfdisplaydoctitle,
		citecolor=mydarkblue,
		linkcolor=black,
		urlcolor=mydarkblue]{hyperref}
	\else
		\RequirePackage{graphicx}
		\DeclareGraphicsExtensions{.eps, .png, .jpg}
		\RequirePackage[usenames,dvipsnames]{xcolor}
		\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
		\RequirePackage[breaklinks = true,
			colorlinks,
			pdfdisplaydoctitle,
			citecolor=mydarkblue,
			linkcolor=black,
			urlcolor=mydarkblue]{hyperref}
\fi

%====================================================================
% PACKAGE hyperref
%====================================================================
% Set links for references and citations in document
% Some MiKTeX distributions have faulty PDF creators in which case this package will not work correctly
% Long live Linux :D
\hypersetup{ a4paper=true,
             pdftitle={ },
             pdfauthor={ },
             pdfsubject={ },
             pdfcreator={Matilde Pato},
             pdfkeywords={ }
             }
%
\RequirePackage[top=3cm,
	bottom=3cm,
	inner=3.5cm,
	outer=2.5cm]{geometry}[2017/03/13]
% \setlength{\marginparwidth}{2cm}

\RequirePackage{ctable}

% This can be done in an expandable form using \csname.  Use \Repeat
\RequirePackage{expl3}
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff

\usepackage[square, comma, sort&compress, numbers]{natbib}
\usepackage{tocbibind} % Add bibliography/index/contents to Table of Contents. Automatically adds the bibliography and/or the index and/or the contents, etc., to the Table of Contents.

%====================================================================
% PACKAGE pdfpages and pdflscape
%====================================================================
\usepackage{pdfpages} % include pdf file
% The pdflscape package adds PDF support to the landscape environment of package lscape, by setting the PDF/Rotate page attribute.
\usepackage{pdflscape}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \let\origcleardoublepage=\cleardoublepage
 \def\cleardoublepage{%
   \newpage{\pagestyle{empty}\origcleardoublepage}
 }

% 
% No identation
\setlength{\parskip}{\medskipamount}
\setlength{\parindent}{0pt}
% 

%%
% For use with the pseudocode package
 \def\@lopcchapterspace{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEFINE LOGO AND IMAGE IN FRONTPAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Add ISEL's logo  in frontpage
\newcommand{\logo}[1]{
\parbox[t][0.15\paperheight]{0.1\paperwidth}{%
\vfill
\raggedleft% or better \raggedleft see comments below
%\centering
\includegraphics[scale=0.5]{#1}%
\vfill
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Some relevant strings

\gdef\@singlemauthorstr{Autor}
\gdef\@manymauthorstr{Autores}

\gdef\@singlemadviserstr{Professor}
\gdef\@manymadviserstr{Professores}

\gdef\@bachelordissertationstr{Relatório}

\gdef\@rptdissertationtstr{Relatório para a 
Unidade Curricular de \@course \\da \@majorfield}
\gdef\@preprptdissertationtstr{Relatório intermédio para a 
Unidade Curricular de \@course \\da \@majorfield}

\gdef\@presentationtext{\@dissertationtype}

%% Language Dependent

\gdef\@abstrnamePT{Resumo}
\gdef\@abstrnameEN{Abstract}

\gdef\@keywordsnamePT{Palavras-chave}
\gdef\@keywordsnameEN{Keywords}


% Portuguese
\if\@language0
  	\gdef\@notdefined{NÃO DEFINIDO}
  	
  	\addto{\captionsportuguese}{%	
  		\renewcommand{\contentsname}{Índice}
  	}
  	\def\appendixname{Anexos}
  	\addto{\captionsportuguese}{%
  		\renewcommand{\bibname}{Referências}
  	} 
	\def\lstlistlistingname{Listagens}
	  	\addto{\captionsportuguese}{%
			\renewcommand*{\lstlistlistingname}{Listagens}
			\renewcommand*{\lstlistingname}{Listagem}%
	}
	
% English
\else\if\@language1
  	\gdef\@notdefined{UNDEFINED}
  	\def\appendixname{Appendix}
\fi\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CREATING A TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 \def\universitylogo#1{%
   \gdef\@universitylogo{#1}}
 \def\@universitylogo{~universitylogo \@notdefined}

 \def\faculty#1{%
   \gdef\@faculty{#1}}
 \def\@faculty{~faculty\@notdefined}
 
 \def\department#1{%
   \gdef\@department{#1}}
 \def\@department{~department\@notdefined}

\def\majorfield#1{%
  \gdef\@majorfield{#1}}
\def\@majorfield{~majorfield \@notdefined}

\def\course#1{%
  \gdef\@course{#1}}
\def\@course{~course \@notdefined}
 
\@input@{defaults}

%% Date
\def\theday#1{\gdef\@theday{#1}}
\def\@theday{~theday \@notdefined}

\def\themonth#1{\gdef\@themonth{#1}}
\def\@themonth{~themonth \@notdefined}

\def\theyear#1{\gdef\@theyear{#1}}
\def\@theyear{~theyear \@notdefined}

%% Authors identification (at most 3 of each)
%% \author[m|f]{Category}{Name}
%% where N i a number from 1 to 4
\def\@theauthorgender{f}	% default for female authors
\newcount\@theauthorcount	% number of authors
\@theauthorcount 0\relax

\def\author{%
  \@ifnextchar [%
    {\@pauthor[]}%
    {\@pauthor[][m]}}

% #1 = [] for author
% #2 = [m] or [f]
% #3 = {name}
% #4 = {category}
\def\@pauthor[#1][#2]#3#4{%
  \expandafter\advance\csname @the#1authorcount\endcsname 1\relax
  \ifx#2m
  	\expandafter\def\csname @the#1authorgender\endcsname{m}
  \else\ifx#2f
  \else
  \typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please specify #1author gender using [m] or [f] as the second^^J%
!  argument of the "#1author" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   \errhelp{Please be gentle and follow the template recommendations.}
   \errmessage{Please specify author gender!}
  \fi\fi
  \expandafter\gdef\csname @#1authorname\expandafter\number\csname @the#1authorcount\endcsname\endcsname{#3}
  \expandafter\gdef\csname @#1authorcat\expandafter\number\csname @the#1authorcount\endcsname\endcsname{#4}
	}

\def\@theauthorstr[#1]{%
	\@ptheauthorstr[#1]{\expandafter\csname @the#1authorcount\endcsname}{\expandafter\csname @the#1authorgender\endcsname}
	}

\def\@ptheauthorstr[#1]#2#3{%
	\ifnum #2 > 1
  		\expandafter\csname @many#3#1authorstr\endcsname
	\else
  		\expandafter\csname @single#3#1authorstr\endcsname
	\fi
	}

\def\printauthor[#1]#2{%
	\ifcsname @#1authorname#2\endcsname
		\ifnum #2 = 1
			& \\[-2ex]
			\@theauthorstr[#1]:
		\fi
		&
		\expandafter\csname @#1authorcat#2\endcsname\
		\expandafter\csname @#1authorname#2\endcsname
	\\
	\fi
	}

% -----------------
%% Advisors identification (at most 2 of each)
%% \adviser[m|f]{Category}{Name}
%% where N i a number from 1 to 2
\def\@theadvisergender{f}	% default for female advisers
\newcount\@theadvisercount	% number of advisers
\@theadvisercount 0\relax

\def\adviser{%
  \@ifnextchar [%
    {\@padviser[]}%
    {\@padviser[][m]}}

% #1 = [] for adviser
% #2 = [m] or [f]
% #3 = {name}
% #4 = {category}
\def\@padviser[#1][#2]#3#4{%
  \expandafter\advance\csname @the#1advisercount\endcsname 1\relax
  \ifx#2m
  	\expandafter\def\csname @the#1advisergender\endcsname{m}
  \else\ifx#2f
  \else
  \typeout{^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
!  Please specify #1adviser gender using [m] or [f] as the second^^J%
!  argument of the "#1adviser" macro.  See the template! ;)^^J%
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!^^J%
}
   \errhelp{Please be gentle and follow the template recommendations.}
   \errmessage{Please specify adviser gender!}
  \fi\fi
  \expandafter\gdef\csname @#1advisername\expandafter\number\csname @the#1advisercount\endcsname\endcsname{#3}
  \expandafter\gdef\csname @#1advisercat\expandafter\number\csname @the#1advisercount\endcsname\endcsname{#4}
	}

\def\@theadviserstr[#1]{%
	\@ptheadviserstr[#1]{\expandafter\csname @the#1advisercount\endcsname}{\expandafter\csname @the#1advisergender\endcsname}
	}

\def\@ptheadviserstr[#1]#2#3{%
	\ifnum #2 > 1
  		\expandafter\csname @many#3#1adviserstr\endcsname
	\else
  		\expandafter\csname @single#3#1adviserstr\endcsname
	\fi
	}

\def\printadviser[#1]#2{%
	\ifcsname @#1advisername#2\endcsname
		\ifnum #2 = 1
			& \\[-2ex]
			\@theadviserstr[#1]:
		\fi
		&
		\expandafter\csname @#1advisercat#2\endcsname\
		\expandafter\csname @#1advisername#2\endcsname
	\\
	\fi
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\synctex=1 % Uase synctex
\brokenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\it\normalsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Including chapters and similars
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ptabstractfile#1{%
  \gdef\@ptabstractfile{#1}}
\def\@ptabstractfile{\@empty}

\def\enabstractfile#1{%
  \gdef\@enabstractfile{#1}}
\def\@enabstractfile{\@empty}
% \def\@enabstractfile{~enabstractfile \@notdefined}

\if\@language0   % Sumário-PT + Abstract-EN for thesis in Portuguese
\def\@ptabstractfile{~ptabstractfile \@notdefined}
\else\if\@language1   % Abstract-EN + Sumário-PT for thesis in English
\def\@enabstractfile{~enabstractfile \@notdefined}
\fi\fi


\def\printabstract{%
	\if\@language0   % Sumário-PT + Abstract-EN for thesis in Portuguese
		\selectlanguage{portuguese}
		\@input@{Chapters/\@ptabstractfile}\global\let\@ptabstractfile\@empty
		\ifx\@enabstractfile\@empty
		\else
			\selectlanguage{english}
			\@input@{Chapters/\@enabstractfile}\global\let\@enabstractfile\@empty
			\selectlanguage{portuguese}
		\fi
	\else\if\@language1   % Abstract-EN + Sumário-PT for thesis in English
		\selectlanguage{english}
		\@input@{Chapters/\@enabstractfile}\global\let\@enabstractfile\@empty
		\ifx\@ptabstractfile\@empty
		\else
			\selectlanguage{portuguese}
			\@input@{Chapters/\@ptabstractfile}\global\let\@ptabstractfile\@empty
			\selectlanguage{english}
		\fi
	\fi\fi
}

\def\thesismainmatter{%
	\mainmatter
	\pagestyle{fancy}
	\fancyhead{}
	\setlength{\headheight}{15pt}
	\fancyhead[RO,LE]{\leftmark\hfill\rightmark}
	\def\chaptermark##1{\markboth{\fontfamily{ptm}% Times New Roman (ptm) or Helvetica (phv)
		\selectfont\footnotesize\thechapter.\ \textsc{##1}}{}}
	\def\sectionmark##1{\markright{\fontfamily{ptm}%
	 	\selectfont\footnotesize\thesection.\ ##1}}
	\if\@language0   % Thesis in  Portuguese
		\selectlanguage{portuguese}
	\else\if\@language1   % Thesis in English
		\selectlanguage{english}
	\fi\fi
}

\def\endthesismainmatter{%
	\fancyhead{}
	\lhead{\nouppercase{\textsc{\leftmark}}}
	\rhead{}
}

% Chapters
\newcount\@chapcount
\@chapcount 0\relax

\def\chapterfile#1{%
	\advance\@chapcount 1\relax
	\expandafter\gdef\csname @chapterfile\number\@chapcount\endcsname{Chapters/#1}
}

\def\printchapters{%
	\thesismainmatter
	\newcount\@myi
	\@myi 0\relax
	\loop
		\advance\@myi 1\relax
		\def\@chapname{\expandafter\csname @chapterfile\number\@myi\endcsname}
		\@input@{\@chapname}
	\ifnum \@myi < \@chapcount
	\repeat
	\endthesismainmatter
}


% Appendixes
\newcount\@appxcount
\@appxcount 0\relax

\def\appendixfile#1{%
	\advance\@appxcount 1\relax
	\expandafter\gdef\csname @appendixfile\number\@appxcount\endcsname{Chapters/#1}
}

\def\printappendixes{%	
	\appendix
	\newcount\@myi
	\@myi 0\relax
	\loop
		\advance\@myi 1\relax
		\def\@appxname{\expandafter\csname @appendixfile\number\@myi\endcsname}
		\@input@{\@appxname}
	\ifnum \@myi < \@appxcount
	\repeat
}

% To process lists and other stuff
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conditional list of figure, table, listings - listoffigures, listoftables and lstlistoflistings only if listings are present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[final]{listings}
\usepackage[figure,table,lstlisting]{totalcount}

\newcommand\conditionalLoF{%
  \iftotalfigures\listoffigures\fi}
\newcommand\conditionalLoT{%
  \iftotaltables\listoftables\fi}
\newcommand\conditionalLoL{%
  \iftotallstlistings\lstlistoflistings\fi}  
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Deal with optional lists in the frontmatter: listoftables, listoffigures, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@printlist#1{ %
		#1\cleardoublepage
}

\def\addlisttofrontmatter#1{ %
		\listgadd{\@frontmatter@list}{#1}
}

\def\printotherlists{ %
		\cleardoublepage
		\forlistloop{\@printlist}{\@frontmatter@list} %
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Frontpage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\frontpage{

\thispagestyle{empty}
\newgeometry{tmargin=0.5cm,bmargin=0.5cm,lmargin=2cm,rmargin=2cm}

\begin{minipage}{0.3\textwidth}
% Put logo
	\logo{\@universitylogo}
\end{minipage}

\begin{center}

%Define font style (ptm=Times New Roman)
	\fontfamily{ptm}


\vspace{0.25cm}	
% Name of Department
	\fontsize{14}{16.8}
	\selectfont
	\textbf{\@department}

\vspace{0.65cm}
% Title of Dissertation
	\fontsize{18}{21.6}
	\selectfont
	\textbf{\@title}\\[0.75cm]

\vspace{0.2cm}	
% Name of Authors
	\fontsize{13}{14.4}
	\selectfont
	\ctable[
		cap=,
		caption=,
		label=,
		pos=h,
		maxwidth=1\linewidth,
		doinside=\hspace*{-0.1cm},
	]{rX}{}{ 
		\printauthor[]{1}
		\printauthor[]{2}
		\printauthor[]{3}
}

\vspace{0.9cm}	
%% Degree
	\fontsize{12}{13}
	\selectfont
	\@presentationtext
	
	\vfill
	% Advisers
	\fontsize{11}{14.4}
	\selectfont
	\ctable[
		cap=,
		caption=,
		label=,
		pos=h,
		maxwidth=1\linewidth,
		doinside=\hspace*{-0.1cm},
	]{rX}{}{ 
		\printadviser[]{1}
		\printadviser[]{2}
}


\vfill\vfill\vfill

% Date
\fontsize{10}{12.2}
\selectfont
\textbf{\@theday ~ -- ~ \@themonth ~ -- ~  \@theyear}

\pagebreak

\begin{minipage}{0.3\textwidth}
% Put logo
	\logo{\@universitylogo}
\end{minipage}


\vspace{0.25cm}	
% Name of Department
	\fontsize{14}{16.8}
	\selectfont
	\textbf{\@department}


\vspace{0.65cm}
% Title of Dissertation
	\fontsize{18}{21.6}
	\selectfont
	\textbf{\@title}\\[0.75cm]

\vspace{1.5cm}	
% Name of Candidate
	\fontsize{14}{16.8}
	\selectfont
	\textbf{
		\ctable[
			cap=,
			caption=,
			label=,
			pos=h,
			maxwidth=1\linewidth,
			doinside=\hspace*{0.1cm},
		]{rX}{}{ 
		\toprule
		\printauthor[]{1}\\
		\ifnum \@theauthorcount > 1		
		\midrule	
		\printauthor[]{2}\\
		\ifnum \@theauthorcount > 2
		\midrule	
		\printauthor[]{3}
		\fi\fi
}}


\vspace{0.75cm}
% Degree
	\fontsize{12}{13}
	\selectfont
	\@presentationtext
	
\vfill\vfill

\vfill\vfill\vfill

% Date
\fontsize{10}{12.2}
\selectfont
\textbf{\@themonth, \@theyear}
	
\end{center}
\restoregeometry
\cleardoublepage %\newpage
\thispagestyle{empty}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Quote
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\quote{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\thispagestyle{empty}
	~\\[2cm]
    \begin{flushright}
    \begin{minipage}{100mm}
    \quotefonti
    \begin{flushright}}
\def\endquote{
	\end{flushright}
    \normalfont
    \end{minipage}
	\end{flushright}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractPT{%
  \selectlanguage{portuguese}
  \gdef\@keywordsname{\@keywordsnamePT}
  \chapter*{\@abstrnamePT}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractEN{%
  \selectlanguage{english}
  \gdef\@keywordsname{\@keywordsnameEN}
  \chapter*{\@abstrnameEN}
}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sectioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{3}

\definecolor{backGrayColor}{rgb}{0.7,0.7,0.7} % Background title color

\titleformat{\chapter}[display]
{\bfseries\Huge}				% format
{\hfill\colorbox{backGrayColor}{\fontsize{80}{100}\selectfont{\textcolor{white}{\thechapter}}}} % label
{1ex}							% sep
{%\titlerule
  \vspace{2ex}\filleft}			% before
[\vspace{1cm}					%\titlerule
]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Common listing def: R and Java example
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% == Color Definitions ===
\definecolor{olivegreen}    {cmyk}{0.64, 0 , 0.95, 0.40}
\definecolor{dkgreen}{rgb}{0,0.6,0}	
\definecolor{midnightblue}  {cmyk}{0.98, 0.13, 0 , 0.43}
%%      

%% R       
\lstset{ 
	language=R, 					% the language of the code
	basicstyle=\scriptsize\ttfamily,  % the size of the fonts that are used for the code
	commentstyle=\ttfamily\color{dkgreen}, % comment style
    numbers=left,     % where to put the line-numbers; possible values are (none, left, right)
   	numberstyle=\ttfamily\color{gray}, 
	stepnumber=2,  % the step between two line-numbers. If it's 1, each line will be numbered
    numbersep=5pt, 				% how far the line-numbers are from the code	
    xleftmargin=\parindent,
    backgroundcolor=\color{white},  % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}
	showspaces=false,   % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  	showstringspaces=false,  % underline spaces within strings only
  	showtabs=false,               % show tabs within strings adding particular underscores
	stringstyle=\ttfamily, 		 % typewriter type for strings
	frame=single, 					 % adds a frame around the code
	rulesepcolor=\color{black},
	columns=fullflexible,
   	tabsize=2,                       % sets default tabsize to 2 spaces
   	captionpos=b, 				% sets the caption-position to bottom
	breakatwhitespace=false,% sets if automatic breaks should only happen at whitespace
  	breaklines=true,              % sets automatic line breaking
   	title=\lstname                 % show the filename of files included with \lstinputlisting; also try caption instead of title
    escapeinside={},         		% if you want to add LaTeX within your code
    keywordstyle=\ttfamily\color{midnightblue}\itshape, % keyword style
	morekeywords={} 
	}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Common listing def - JAVA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Listings
%\usepackage{fancyvrb}
\colorlet{lstKeywordsColor}{MidnightBlue}
\colorlet{lstKeywordsAltColor}{BrickRed}
\colorlet{lstCommentsColor}{ForestGreen}
\colorlet{lstStringColor}{BrickRed}
% Usage: \begin{javalst}[Caption]{Label}
\lstnewenvironment{javalst}[2][]%
{\lstset{language=java,basicstyle=\small\tt,frame=tb,captionpos=b,caption=#1,label={lst:#2},tabsize=2}}%
{}%
\lstnewenvironment{xmllst}[2][]%
{\lstset{language=XML,basicstyle=\small\tt,frame=tb,captionpos=b,caption=#1,label={lst:#2},tabsize=2}}%
{}%
\lstnewenvironment{lst}[2][]%
{\lstset{basicstyle=\footnotesize\tt,frame=tb,captionpos=b,caption=#1,label={lst:#2},tabsize=2}}%
{}%

% For inline code
\newcommand{\codejava}[1]{\lstinline[basicstyle=\tt,%
		keywordstyle=\color{lstKeywordsColor}\bfseries,%
		commentstyle=\color{lstCommentsColor},%
		stringstyle=\color{lstStringColor},% 		
		language=Java]|#1|}

%for code in file
% usage \lstfromfile{language}{caption}{label}{path}
\newcommand{\lstfromfile}[5]
{	\lstinputlisting[language=#1,basicstyle=\small\tt,frame=tb,captionpos=b,
commentstyle=\color{lstCommentsColor},stringstyle=\color{lstStringColor},
keywordstyle=\color{lstKeywordsColor}\bfseries,caption=#2,label={#3},tabsize=2,#5]{#4}
}

%define java language
\lstset{ %
language=java,                % choose the language of the code
basicstyle=\footnotesize\ttfamily,       % the size of the fonts that are used for the code
numbers=left,                   % where to put the line-numbers
numberstyle=\tiny,      % the size of the fonts that are used for the line-numbers
stepnumber=1,                   % the step between two line-numbers. If it is 1 each line will be numbered
numbersep=5pt,                  % how far the line-numbers are from the code
backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
showspaces=false,               % show spaces adding particular underscores
showstringspaces=false,         % underline spaces within strings
showtabs=false,                 % show tabs within strings adding particular underscores
frame=single,           % adds a frame around the code
tabsize=2,          % sets default tabsize to 2 spaces
captionpos=b,           % sets the caption-position to bottom
breaklines=true,        % sets automatic line breaking
breakatwhitespace=false,    % sets if automatic breaks should only happen at whitespace
escapeinside={\%*}{*)},          % if you want to add a comment within your code
stringstyle= \color{lstStringColor},
keywordstyle = \color{lstKeywordsColor}\bfseries,
commentstyle=\color{lstCommentsColor}\itshape,
}