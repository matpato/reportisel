%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% reportisel.cls
%%% ISEL/IPL Report document class
%%%
%%% By Matilde Pós-de-Mina Pato (matilde.pato@isel.pt)
%%% Version of March 2017
%%% Version v1.1:  January 2018 
%%% Version v2.0: October 2019
%%% Version v3.0: September 2020
%%% 
%%%  This work is licensed under the MIT License. 
%%% To view a copy of this license,  visit https://choosealicense.com/licenses/mit/
%%%
%%% This template is vaguely based on a template from the thesisisel.cls
%%%	   ISEL/IPL Dissertation document class (NOT OFFICIAL)
%%%
%%% BUGS and SUGGESTIONS: please send email to "matilde.pato@isel.pt"
%%%     or sumit a ticket in the the project web page at
%%%     https://github.com/matpato/reportisel
%%%
%%% CONTRIBUTERS are welcome. Please contact "matilde.pato@isel.pt"
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING 
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING 
%%% 
%%%   You SHOULD NOT change this file (you are playing with fire!)
%%% 
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING 
%%% WARNING WARNING WARNING WARNING WARNING WARNING WARNING 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisisel}[2012/10/09 ISEL thesis template]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% == Languages ===
\DeclareOption{pt}{% 		//PORTUGUESE
  \let\@language=0%
  \PassOptionsToPackage{portuguese,english}{babel}}

\DeclareOption{en}{%		//ENGLISH
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

% === Type of Document ===
%
% \@degreetype=0	Course report : rpt
% \@degreetype=1	Course preliminary  report:  preprpt

\DeclareOption{rpt}{
	\let\@degreetype=0
	\def\@degree{\@bachelorreport}
	\def\@reporttype{\@reportstr}
}
\DeclareOption{preprpt}{
	\let\@degreetype=1
	\def\@degree{\@bachelorreport}
	\def\@reporttype{\@prereportstr}
}
% == Printable or on Screen Report ===
% Format your report in a way that presents:
% \@printable=1		on paper: onpaper
% \@printable=0		on screen: onscreen 
\DeclareOption{onpaper}{
	\let\@printable=1
}
\DeclareOption{onscreen}{
	\let\@printable=0
}

% == Default Options ===
\ExecuteOptions{
	pt,
	msc,
	onpaper
}
\ProcessOptions

\LoadClass{book}

\RequirePackage[
			breaklinks = true,
			hidelinks,
			colorlinks,
			pdfdisplaydoctitle,
			citecolor=mydarkblue,
			linkcolor=black,
			urlcolor=mydarkblue
			]{hyperref} 

% === Output Document ===			

%  Print on paper 
\if\@printable1
\RequirePackage[top=3cm,
	bottom=3cm,
	inner=3.5cm,
	outer=2.5cm]{geometry}[2010/09/12]

% Print on screen
\else\if\@printable0
\RequirePackage[top=3cm,
	bottom=3cm,
	inner=2.5cm,
	outer=2.5cm]{geometry}[2010/09/12]
\fi\fi			
			
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Latin1
\if\@utf0
\RequirePackage[latin1]{inputenc}
% UTF8
\else\if\@utf1
\RequirePackage[utf8]{inputenc}
\fi\fi

\RequirePackage[T1]{fontenc}

%=================================================
% PACKAGE amsmath, amsthm, amssymb, amsfonts:
%=================================================
% This package is typically required. Among many other things it adds the possibility
% to put symbols in bold by using \boldsymbol (not \mathbf); defines additional 
% fonts and symbols; adds the \eqref command for citing equations. I prefer the style
% "(x.xx)" for referering to an equation than to use "equation x.xx".

\usepackage{txfonts} 
  \let\iint\relax 
  \let\iiint\relax 
  \let\iiiint\relax 
  \let\idotsint\relax 
\usepackage{amsmath, amssymb, amsfonts, verbatim, mathabx}
\usepackage{spverbatim}
%=================================================
% PACKAGE: underline, inparaenum environment 
%=================================================
% underline  
\usepackage{ulem}
% Provides the inparaenum environment (with an optional formatting specification in square brackets)
\usepackage{paralist} 
  
\newcounter{saveenumi}
\newcommand{\seti}{\setcounter{saveenumi}{\value{enumi}}}
\newcommand{\conti}{\setcounter{enumi}{\value{saveenumi}}}

%=================================================
% PACKAGE: tables, appendix, headings, subcaption, wrapfig, float, totalcount
%=================================================
% Beautiful simple tables
\usepackage{booktabs}
\RequirePackage{csquotes}
\RequirePackage{babel}
\RequirePackage[toc]{appendix}

\RequirePackage{ifthen}
\RequirePackage{titlesec}          % To format the headings
\RequirePackage{fancyhdr}        % Headings configuration

% To aggregate multiple figures in a single one with subfigures
% Note: subfigure package does not recognise \textwidth as a number, when it is in fact a number (equivalent to the constant width of the total text block on a page). The way to resolve this is to use the more updated subcaption package
\usepackage{caption}
\usepackage{subcaption}

% To have text wrapping figures
\usepackage{wrapfig}
\usepackage{float}			% Improves the interface for defining floating objects such as figures and tables
%
 
% Set inter-line spacing
\RequirePackage{setspace}        % One-and-half spacing
\onehalfspacing

%=================================================
% PACKAGE: general styles
%=================================================
%\RequirePackage{mathptmx}
\RequirePackage[scaled]{helvet}
\RequirePackage{courier}
\RequirePackage{palatino}
\usepackage{xmpincl}
%\usepackage[a-1b]{pdfx}

%=================================================
% PACKAGE: graphics, ifpdf, xcolor
%=================================================
%\RequirePackage[]{xcolor}
\RequirePackage[]{xcolor}
\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
\usepackage{ifpdf}		% This is now the recommended way for checking for PDFLaTeX:
\ifpdf
	\RequirePackage[pdftex]{graphicx}
	\DeclareGraphicsExtensions{.pdf, .png, .jpg, .tif}	
	\else
		\RequirePackage{graphicx}
		\DeclareGraphicsExtensions{.eps, .png, .jpg}
\fi

%\ifpdf
%	\RequirePackage[pdftex]{graphicx}
%	\DeclareGraphicsExtensions{.pdf, .png, .jpg, .tif}
%	\RequirePackage[pdftex,usenames,dvipsnames]{color}
%%	\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}	
%\else
%	\RequirePackage{graphicx}
%	\DeclareGraphicsExtensions{.eps, .png, .jpg}
%	\RequirePackage[usenames]{color}
%	%\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
%\fi

%=================================================
% PACKAGE: tikz
%=================================================

\RequirePackage{tikz}	%Tikz is probably the most complex and powerful tool to create graphic elements in LATEX. 
\RequirePackage{ctable}
% This can be done in an expandable form using \csname.  Use \Repeat
\RequirePackage{expl3}
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff

%\usepackage[square, comma, sort&compress, numbers]{natbib}
%\usepackage{tocbibind} % Add bibliography/index/contents to Table of Contents. Automatically adds the bibliography and/or the index and/or the contents, etc., to the Table of Contents.

%=================================================
% PACKAGE algorithm and algpseudocode
%=================================================
\usepackage[Algoritmo]{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}

%=================================================
% PACKAGE acronym and nomencl
%=================================================
% This package is most usefull for acronyms. The package garantees that all acronyms definitions 
% are given at the first usage. 
% IMPORTANT: do not use acronyms in titles/captions; otherwise the definition will appear on the table of contents.
% Printing a list of abbreviations or symbols is one of these things (like so many) LaTeX provides a very simple and elegant solution for. 
% The nomencl package implements a few basic commands to do that.
% First load the package in the preamble. The makenomenclature command is required for the generation of the nomenclature file (.nlo). Commenting it out is a convenient way to “switch it off”.
%
\usepackage[printonlyused,withpage]{acronym}
%\usepackage[
%	intoc]               % show listings as entries in table of contents      
%	{nomencl}
%\makenomenclature
\usepackage[
	nogroupskip,
	sort=use,
	translate=babel,
	%nonumberlist, % do not show page numbers
	acronym,        	% generate acronym listing
	toc                	% show listings as entries in table of contents
	]          				% use section level for toc entries
	{glossaries}
\glsdisablehyper
\makenoidxglossaries

\setglossarystyle{long} %long3colheader
% style=long,header=none,border=none,cols=2 &
\addtolength{\glspagelistwidth}{1cm}
\addtolength{\glsdescwidth}{2.5cm}
\renewcommand*{\glsnamefont}[1]{\bfseries #1}%

%=================================================
% PACKAGE listings, fancyvrb, fvextra
%=================================================
%
% The ‘listings’ package is loaded at the beginning of a LATEX file in the preamble
% Here is an example of my \lset{} declaration for ‘R’ code. 
% Then, after having including this (also in the preamble), I simply include my external ‘R’ files. 
% They can be included using an:
% \include{ } - like interface to the external files;
% by using the command \lstinputlisting{./code.R} to include the code from the file code.R which % is located in the same directory as the ‘LATEX’ source file.
%
\usepackage{listings}
%listings package provides a key called inputpath for specifying a path where \lstinputlisting should search for source files.
\newcommand*\lstinputpath[1]{\lstset{inputpath=#1}}
\usepackage{fancyvrb}
\usepackage{fvextra}

\renewcommand{\lstlistoflistings}{
	\begingroup
	\tocfile{\lstlistlistingname}{lol}
	\endgroup
}


%=================================================
% PACKAGE pdfpages and pdflscape
%=================================================
\usepackage{pdfpages} % include pdf file
% The pdflscape package adds PDF support to the landscape environment of package lscape, by setting the PDF/Rotate page attribute.
\usepackage{pdflscape}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Some relevant strings
\gdef\@singlemauthorstr{Aluno}
\gdef\@manymauthorstr{Alunos}
\gdef\@singlefauthorstr{Aluna}
\gdef\@manyfauthorstr{Alunas}

\gdef\@singlemadviserstr{Professor}
\gdef\@singlefadviserstr{Professora}
\gdef\@manymadviserstr{Professores}
\gdef\@manyfadviserstr{Professoras}

\gdef\@reportstr{Relatório para a 
Unidade Curricular de \@course \\da \@majorfield}
\gdef\@prereportstr{Relatório intermédio para a 
Unidade Curricular de \@course \\da \@majorfield}

\gdef\@presentationtext{\@reporttype}

%% Language Dependent

\gdef\@abstrnamePT{Resumo}
\gdef\@abstrnameEN{Abstract}

\gdef\@keywordsnamePT{Palavras-chave}
\gdef\@keywordsnameEN{Keywords}


% Portuguese
\if\@language0
  	\gdef\@notdefined{NÃO DEFINIDO}
  	\gdef\acknowledgementsname{Agradecimentos} 
  	
  	\addto\captionsportuguese{% Replace "english" with the language you use
  		\renewcommand{\contentsname}{Índice}%
	}
	
 	\renewcommand*{\listtablename}{Lista de Tabelas}
	\renewcommand*{\listfigurename}{Lista de Figuras}
	
  	\def\appendixname{Anexos}

  	\def\glossaryname{Main}
 		\addto{\captionsportuguese}{
 			\renewcommand*{\acronymname}{Lista de Abreviaturas e Siglas}
 			\renewcommand*{\glossaryname}{Glossário}
 			\renewcommand*{\pagelistname}{Páginas}
 			\renewcommand*{\entryname}{Notação}
	}
 
	\def\lstlistlistingname{Listagens}
	  	\addto{\captionsportuguese}{%
			%\renewcommand*{\lstlistingname}{Listagem}%
			\renewcommand*{\lstlistingname}{Listagem}% Listing -> Algorithm
			\renewcommand{\lstlistlistingname}{Lista de Listagens}% List of Listings -> List of Algorithms
	}
	
	\renewcommand{\algorithmicrequire}{\textbf{Dados: }}
	\renewcommand{\algorithmicensure}{\textbf{Resultado: }}
	
% English
\else\if\@language1
  	\gdef\@notdefined{UNDEFINED}
  	\gdef\acknowledgementsname{Acknowledgments}
  	\def\appendixname{Appendix}

	\def\lstlistlistingname{Listings}
	  	\addto{\captionsenglish}{%
			%\renewcommand*{\lstlistingname}{Listagem}%
			\renewcommand*{\lstlistingname}{Listing}% Listing -> Algorithm
			\renewcommand{\lstlistlistingname}{List of \lstlistingname s}% List of Listings -> List of Algorithms
	}
	  	
\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DEFINE LOGO AND IMAGE IN FRONTPAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ADD ISEL's LOGO and IMAGE in frontpage
\newcommand{\logo}[1]{
	\parbox[t][0.15\paperheight]{0.1\paperwidth}{%
	\vfill
	\raggedleft% or better \raggedleft see comments below
	%\centering
	\includegraphics[scale=0.5]{#1}%
	\vfill
}}

\newcommand{\image}[1]{
	\parbox[t][6cm][c]{12cm}{%
	\vfill
	\centering
	\includegraphics[height=6cm,width=12cm]{#1}%
	\vfill
}}

\newcommand{\noimage}{
\parbox[t][6cm][c]{12cm}{%
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CREATING A TITLE PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
\def\@theauthorgender{m}	% default for female authors
\newcount\@theauthorcount	% number of authors
\@theauthorcount 0\relax

\def\author{%
  \@ifnextchar [%
    {\@pauthor[]}%
    {\@pauthor[][m]}}

% #1 = [] for author
% #2 = [m] or [f]
% #3 = {name}
\def\@pauthor[#1][#2]#3#4{%
  \expandafter\advance\csname @the#1authorcount\endcsname 1\relax
  \ifx#2m
  	\def\@the#1authorgender{m}
  \else\ifx#2f
  	\def\@the#1authorgender{f}
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
			\@theauthorstr[#1]
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\synctex=1 % Uase synctex
\brokenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\quotefont{\normalfont\normalsize}
\newcommand\quotefonti{\it\normalsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Including chapters and similars
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\ptabstractfile#1{%
  \gdef\@ptabstractfile{#1}}
\def\@ptabstractfile{\@empty}

\def\enabstractfile#1{%
  \gdef\@enabstractfile{#1}}
\def\@enabstractfile{\@empty}
% \def\@enabstractfile{~enabstractfile \@notdefined}

\if\@language0   % Sumário-PT + Abstract-EN for report in Portuguese
\def\@ptabstractfile{~ptabstractfile \@notdefined}
\else\if\@language1   % Abstract-EN + Sumário-PT for report in English
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
 	
\def\reportmainmatter{%
	\mainmatter
	\pagestyle{fancy}
	\fancyhead{}
	\setlength{\headheight}{15pt}
	\fancyhead[RO,LE]{\leftmark\hfill\rightmark}
	\def\chaptermark##1{\markboth{\fontfamily{ptm}% Times New Roman (ptm) or Helvetica (phv)
		\selectfont\footnotesize\thechapter.\ \textsc{##1}}{}}
	\def\sectionmark##1{\markright{\fontfamily{ptm}%
	 	\selectfont\footnotesize\thesection.\ ##1}}
	\if\@language0   % Report in  Portuguese
		\selectlanguage{portuguese}
	\else\if\@language1   % Report in English
		\selectlanguage{english}
	\fi\fi
}

\def\endreportmainmatter{%
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
	\reportmainmatter
	\newcount\@myi
	\@myi 0\relax
	\loop
		\advance\@myi 1\relax
		\def\@chapname{\expandafter\csname @chapterfile\number\@myi\endcsname}
		\@input@{\@chapname}
	\ifnum \@myi < \@chapcount
	\repeat
	\endreportmainmatter
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

% To process lists and other stuff
\RequirePackage{etoolbox}
%\usepackage{pgffor}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Conditional list of figure, table, listings - listoffigures, listoftables and lstlistoflistings only if listings are present
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \usepackage[figure,table,lstlisting]{totalcount}

\newcommand\conditionalLoF{%
  	\iftotalfigures\listoffigures\fi
  	}
\newcommand\conditionalLoT{%
 	 \iftotaltables\listoftables\fi
 	}
\newcommand\conditionalLoL{%
  	\iftotallstlistings\lstlistoflistings\fi
  	} 
%\newcommand\conditionalLoA{%
%  \iftotallstnomenclature\lstlistofnomenclature\fi}     
%  \listofnomenclature{ll}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Deal with optional lists in the frontmatter: listoftables, listoffigures, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FRONTPAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{reportisel-files/frontpage.clo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractEN{%
  \selectlanguage{english}
  \gdef\@keywordsname{\@keywordsnameEN}
  \chapter*{\@abstrnameEN}
}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resumo (Abstract in Portuguese)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\abstractPT{%
  \selectlanguage{portuguese}
  \gdef\@keywordsname{\@keywordsnamePT}
  \chapter*{\@abstrnamePT}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Keywords
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapter files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand*{\MaxNumOfChapters}{10}% Adjust these two settings for your needs.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sectioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers & footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%http://tex.stackexchange.com/questions/15971/bibliography-with-page-numbers
%URL linebreak in footnote
%\usepackage{breakurl}
\usepackage[
	style=ieee, %{ieee, numeric, alphabetic, authoryear, authortitle, verbose, apa, chem-acs, chem-angew, mla, nature, science, nejm, phys},
%defernumbers=true, 
	backend=bibtex, %{bibtex, biber}
	sorting=debug, %{none, nty, nyt, nyvt, anyt, anyvt, ynt, debug},
	%dashed=false, 
	maxnames=20,
	maxcitenames=3,
	giveninits=false,
	citestyle=nature,
	natbib=true,%
	doi=true,%
	%url=false,%
	isbn=true,%
	%urldate=long,
	%uniquename=false,
	%uniquelist=false
]{biblatex}

%%%% The important part:
\DefineBibliographyStrings{portuguese}{%
	bibliography = {Referências},
    references = {Referências},
    page={pág.},
    pages={páginas},
    and={\&},
  	mathesis = {Tese de Mestrado},
  	phdthesis = {Tese de Doutoramento}
}

\DefineBibliographyStrings{english}{%
	bibliography = {References},
    references = {References},
    page={page},
    pages={pages},
    %and={\&}  	
}

\def\UrlBreaks{\do\/\do-}
%\usepackage[square, comma, sort&compress, numbers]{natbib}

\usepackage{tocbibind} % Add bibliography/index/contents to Table of Contents. Automatically adds the bibliography and/or the index and/or the contents, etc., to the Table of Contents.

% If you want to break on URL numbers
\setcounter{biburlnumpenalty}{9000}
% If you want to break on URL lower case letters
\setcounter{biburllcpenalty}{9000}
% If you want to break on URL UPPER CASE letters
\setcounter{biburlucpenalty}{9000}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Appendixes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcount\@appxcount
\@appxcount 0\relax

\def\appendixfile#1{%
	\advance\@appxcount 1\relax
	\expandafter\gdef\csname @appendixfile\number\@appxcount\endcsname{Appendixes/#1}
}

\ifx\@appendixfile\@empty
	\def\printappendixes{}
\else
	\def\printappendixes{
		\appendix
		\newcount\@myi
		\@myi 0\relax
		\loop
			\advance\@myi 1\relax
			\def\@appxname{\expandafter\csname @appendixfile\number\@myi		\endcsname}
		\@input@{\@appxname}
		\ifnum \@myi < \@appxcount
		\repeat
	}
\fi