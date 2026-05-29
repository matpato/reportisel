%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% reportisel.cls
%%% ISEL/IPL Report document class
%%%
%%% By Matilde Pós-de-Mina Pato (matilde.pato@isel.pt)
%%% Version of March 2017
%%%
%%%  This work is licensed under the MIT License. 
%%% To view a copy of this license, visit https://choosealicense.com/licenses/mit/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{reportisel}[2012/10/09 ISEL report template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{pt}{%
  \let\@language=0%
  \PassOptionsToPackage{portuguese,english}{babel}}

\DeclareOption{en}{%
  \let\@language=1%
  \PassOptionsToPackage{portuguese,english}{babel}}

\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}

\PassOptionsToClass{a4paper}{report}
\DeclareOption{a4}{\PassOptionsToClass{a4paper}{report}}
\DeclareOption{a4paper}{\PassOptionsToClass{a4paper}{report}}

\PassOptionsToClass{12pt}{report}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{report}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{report}}

\let\@utf=1
\DeclareOption{latin1}{\let\@utf=0}
\DeclareOption{utf8}{\let\@utf=1}

\DeclareOption{rpt}{%
  \let\@degreetype=0
  \def\@degree{\@bachelorreport}
  \def\@reporttype{\@reportstr}}

\DeclareOption{preprpt}{%
  \let\@degreetype=1
  \def\@degree{\@bachelorreport}
  \def\@reporttype{\@prereportstr}}

\DeclareOption{onscreen}{\let\@printable=0}
\DeclareOption{onpaper}{\let\@printable=1}

\ExecuteOptions{pt,onscreen}
\ProcessOptions

\LoadClass{book}

% No blank pages
\renewcommand{\cleardoublepage}{\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[
  breaklinks=true,
  hidelinks,
  colorlinks,
  pdfdisplaydoctitle,
  citecolor=mydarkblue,
  linkcolor=black,
  urlcolor=mydarkblue
]{hyperref}

\if\@printable1
  \RequirePackage[top=3cm,bottom=3cm,inner=3.5cm,outer=2.5cm]{geometry}
\else\if\@printable0
  \RequirePackage[top=3cm,bottom=3cm,inner=2.5cm,outer=2.5cm]{geometry}
\fi\fi

\if\@utf0
  \RequirePackage[latin1]{inputenc}
\else\if\@utf1
  \RequirePackage[utf8]{inputenc}
\fi\fi

\RequirePackage[T1]{fontenc}

\usepackage{txfonts}
  \let\iint\relax
  \let\iiint\relax
  \let\iiiint\relax
  \let\idotsint\relax
\usepackage{amsmath,amssymb,amsfonts,verbatim,mathabx}
\usepackage{spverbatim}
\usepackage{ulem}
\usepackage{paralist}

\newcounter{saveenumi}
\newcommand{\seti}{\setcounter{saveenumi}{\value{enumi}}}
\newcommand{\conti}{\setcounter{enumi}{\value{saveenumi}}}

\usepackage{booktabs}
\RequirePackage{csquotes}
\RequirePackage{babel}
\RequirePackage[toc]{appendix}
\RequirePackage{ifthen}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{wrapfig}
\usepackage{float}
\RequirePackage{setspace}
\onehalfspacing

\RequirePackage[scaled]{helvet}
\RequirePackage{courier}
\RequirePackage{palatino}
\usepackage{xmpincl}

\RequirePackage[]{xcolor}
\definecolor{mydarkblue}{rgb}{0.0,0.08,0.45}
\usepackage{ifpdf}
\ifpdf
  \RequirePackage[pdftex]{graphicx}
  \DeclareGraphicsExtensions{.pdf,.png,.jpg,.tif}
\else
  \RequirePackage{graphicx}
  \DeclareGraphicsExtensions{.eps,.png,.jpg}
\fi

\RequirePackage{tikz}
\RequirePackage{ctable}
\RequirePackage{expl3}
\ExplSyntaxOn
\cs_new_eq:NN \Repeat \prg_replicate:nn
\ExplSyntaxOff

\usepackage[Algoritmo]{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}

\usepackage[printonlyused,withpage]{acronym}
\usepackage[
  nogroupskip,
  sort=use,
  translate=babel,
  acronym,
  toc
]{glossaries}
\glsdisablehyper
\makenoidxglossaries
\setglossarystyle{long}
\addtolength{\glspagelistwidth}{1cm}
\addtolength{\glsdescwidth}{2.5cm}
\renewcommand*{\glsnamefont}[1]{\bfseries #1}

\usepackage{fancyvrb}
\usepackage{fvextra}
\usepackage{listings}
\newcommand*\lstinputpath[1]{\lstset{inputpath=#1}}
\renewcommand{\lstlistoflistings}{%
  \chapter*{\lstlistlistingname}%
  \@starttoc{lol}%
}

\usepackage{pdfpages}
\usepackage{pdflscape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% GENERAL PURPOSE MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parskip}{\medskipamount}
\setlength{\parindent}{0pt}
\def\@lopcchapterspace{\relax}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LABELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\gdef\@singlemadviserstr{Professor}
\gdef\@singlefadviserstr{Professora}
\gdef\@manymadviserstr{Professores}
\gdef\@manyfadviserstr{Professoras}

\gdef\@reportstr{Relatório para a
Unidade Curricular de \@course \\da \@majorfield}
\gdef\@prereportstr{Relatório intermédio para a
Unidade Curricular de \@course \\da \@majorfield}

\gdef\@presentationtext{\@reporttype}

\gdef\@abstrnamePT{Resumo}
\gdef\@abstrnameEN{Abstract}
\gdef\@keywordsnamePT{Palavras-chave}
\gdef\@keywordsnameEN{Keywords}

\if\@language0
  \gdef\@notdefined{NÃO DEFINIDO}
  \gdef\acknowledgementsname{Agradecimentos}
  \addto\captionsportuguese{\renewcommand{\contentsname}{Índice}}
  \renewcommand*{\listtablename}{Lista de Tabelas}
  \renewcommand*{\listfigurename}{Lista de Figuras}
  \def\appendixname{Anexos}
  \def\glossaryname{Main}
  \addto{\captionsportuguese}{%
    \renewcommand*{\acronymname}{Lista de Abreviaturas e Siglas}
    \renewcommand*{\glossaryname}{Glossário}
    \renewcommand*{\pagelistname}{Páginas}
    \renewcommand*{\entryname}{Notação}
  }
  \def\lstlistlistingname{Listagens}
  \addto{\captionsportuguese}{%
    \renewcommand*{\lstlistingname}{Listagem}
    \renewcommand{\lstlistlistingname}{Lista de Listagens}
  }
  \renewcommand{\algorithmicrequire}{\textbf{Dados: }}
  \renewcommand{\algorithmicensure}{\textbf{Resultado: }}
\else\if\@language1
  \gdef\@notdefined{UNDEFINED}
  \gdef\acknowledgementsname{Acknowledgments}
  \def\appendixname{Appendix}
  \def\lstlistlistingname{Listings}
  \addto{\captionsenglish}{%
    \renewcommand*{\lstlistingname}{Listing}
    \renewcommand{\lstlistlistingname}{List of \lstlistingname s}
  }
\fi\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LOGO AND IMAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\logo}[1]{%
  \parbox[t][0.15\paperheight]{0.1\paperwidth}{%
    \vfill\centering
    \includegraphics[scale=.1]{#1}%
    \vfill
  }}

\newcommand{\image}[1]{%
  \parbox[t][6cm][c]{12cm}{%
    \vfill\centering
    \includegraphics[height=6cm,width=12cm]{#1}%
    \vfill
  }}

\newcommand{\noimage}{\parbox[t][6cm][c]{12cm}{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% COVER DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\universitylogo#1{\gdef\@universitylogo{#1}}
\def\@universitylogo{~universitylogo \@notdefined}

\def\faculty#1{\gdef\@faculty{#1}}
\def\@faculty{~faculty \@notdefined}

\def\department#1{\gdef\@department{#1}}
\def\@department{~department \@notdefined}

\def\majorfield#1{\gdef\@majorfield{#1}}
\def\@majorfield{~majorfield \@notdefined}

\def\course#1{\gdef\@course{#1}}
\def\@course{~course \@notdefined}

\@input@{Config/defaults}

\def\theday#1{\gdef\@theday{#1}}
\def\@theday{~theday \@notdefined}

\def\themonth#1{\gdef\@themonth{#1}}
\def\@themonth{~themonth \@notdefined}

\def\theyear#1{\gdef\@theyear{#1}}
\def\@theyear{~theyear \@notdefined}

%% Authors (at most 3): \author[]{number}{name}{e-mail}
\newcount\@theauthorcount
\@theauthorcount 0\relax

\def\author{%
  \@ifnextchar [{\@pauthor[]}{\@pauthor[]}}

\def\@pauthor[#1]#2#3#4{%
  \expandafter\advance\csname @the#1authorcount\endcsname 1\relax
  \expandafter\gdef\csname @#1authornum\expandafter\number\csname @the#1authorcount\endcsname\endcsname{#2}
  \expandafter\gdef\csname @#1authorname\expandafter\number\csname @the#1authorcount\endcsname\endcsname{#3}
  \expandafter\gdef\csname @#1authoremail\expandafter\number\csname @the#1authorcount\endcsname\endcsname{#4}
}

\def\printauthor[#1]#2{%
  \ifcsname @#1authornum#2\endcsname
    \expandafter\csname @#1authornum#2\endcsname\ : &
    \expandafter\csname @#1authorname#2\endcsname
    \hspace*{.25em}(\expandafter\csname @#1authoremail#2\endcsname)\vspace*{.5em}\\
  \fi
}

%% Professors (at most 2): \professor[m|f]{Name}{Category}
\def\@theprofessorgender{f}
\newcount\@theprofessorcount
\@theprofessorcount 0\relax

\def\professor{%
  \@ifnextchar [{\@pprofessor[]}{\@pprofessor[][m]}}

\def\@pprofessor[#1][#2]#3#4{%
  \expandafter\advance\csname @the#1professorcount\endcsname 1\relax
  \ifx#2m
    \expandafter\def\csname @the#1professorgender\endcsname{m}
  \else\ifx#2f
    \expandafter\def\csname @the#1professorgender\endcsname{f}
  \else
    \errhelp{Please be gentle and follow the template recommendations.}
    \errmessage{Please specify professor gender using [m] or [f]!}
  \fi\fi
  \expandafter\gdef\csname @#1professorname\expandafter\number\csname @the#1professorcount\endcsname\endcsname{#3}
  \expandafter\gdef\csname @#1professorcat\expandafter\number\csname @the#1professorcount\endcsname\endcsname{#4}
}

\def\@theprofessorstr[#1]{%
  \@ptheprofessorstr[#1]%
    {\expandafter\csname @the#1professorcount\endcsname}%
    {\expandafter\csname @the#1professorgender\endcsname}%
}

\def\@ptheprofessorstr[#1]#2#3{%
  \ifnum #2 > 1
    \expandafter\csname @many#3adviserstr\endcsname
  \else
    \expandafter\csname @single#3adviserstr\endcsname
  \fi
}

\def\printprofessor[#1]#2{%
  \ifcsname @#1professorname#2\endcsname
    \ifnum #2 = 1
      & \\[-2ex]
      \@theprofessorstr[#1]:
    \fi
    &
    \expandafter\csname @#1professorcat#2\endcsname\
    \expandafter\csname @#1professorname#2\endcsname\\
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\synctex=1
\brokenpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ABSTRACT FILES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ptabstractfile#1{\gdef\@ptabstractfile{#1}}
\def\@ptabstractfile{\@empty}

\def\enabstractfile#1{\gdef\@enabstractfile{#1}}
\def\@enabstractfile{\@empty}

\def\printabstract{%
  \if\@language0
    \selectlanguage{portuguese}
    \@input@{Chapters/\@ptabstractfile}\global\let\@ptabstractfile\@empty
    \ifx\@enabstractfile\@empty\else
      \selectlanguage{english}
      \@input@{Chapters/\@enabstractfile}\global\let\@enabstractfile\@empty
      \selectlanguage{portuguese}
    \fi
  \else\if\@language1
    \selectlanguage{english}
    \@input@{Chapters/\@enabstractfile}\global\let\@enabstractfile\@empty
    \ifx\@ptabstractfile\@empty\else
      \selectlanguage{portuguese}
      \@input@{Chapters/\@ptabstractfile}\global\let\@ptabstractfile\@empty
      \selectlanguage{english}
    \fi
  \fi\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MAIN MATTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titlespacing*{\chapter}{0pt}{-20pt}{30pt}

\def\reportmainmatter{%
  \mainmatter
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[R]{\nouppercase{\leftmark}}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \setlength{\headheight}{15pt}
  \def\chaptermark##1{\markboth{\fontfamily{lmr}\selectfont\footnotesize\thechapter.\ ##1}{}}
  \def\sectionmark##1{\markright{\fontfamily{lmr}\selectfont\footnotesize\thesection.\ ##1}}
  \if\@language0
    \selectlanguage{portuguese}
  \else\if\@language1
    \selectlanguage{english}
  \fi\fi
}

\def\endreportmainmatter{%
  \fancyhead{}
  \lhead{\nouppercase{\textsc{\leftmark}}}
  \rhead{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcount\@chapcount
\@chapcount 0\relax

\def\chapterfile#1{%
  \advance\@chapcount 1\relax
  \expandafter\gdef\csname @chapterfile\number\@chapcount\endcsname{Chapters/#1}
}

\def\printchapters{%
  \reportmainmatter
  \newcount\@myi \@myi 0\relax
  \loop
    \advance\@myi 1\relax
    \def\@chapname{\expandafter\csname @chapterfile\number\@myi\endcsname}
    \@input@{\@chapname}
  \ifnum \@myi < \@chapcount\repeat
  \endreportmainmatter
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% APPENDIXES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcount\@appxcount
\@appxcount 0\relax

\def\appendixfile#1{%
  \advance\@appxcount 1\relax
  \expandafter\gdef\csname @appendixfile\number\@appxcount\endcsname{Appendixes/#1}
}

\def\printappendixes{%
  \appendix
  \newcount\@myi \@myi 0\relax
  \loop
    \advance\@myi 1\relax
    \def\@appxname{\expandafter\csname @appendixfile\number\@myi\endcsname}
    \@input@{\@appxname}
  \ifnum \@myi < \@appxcount\repeat
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONDITIONAL LISTS AND FRONT MATTER LISTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[figure,table,lstlisting]{totalcount}

\newcommand\conditionalLoF{\iftotalfigures\listoffigures\fi}
\newcommand\conditionalLoT{\iftotaltables\listoftables\fi}
\newcommand\conditionalLoL{\iftotallstlistings\lstlistoflistings\fi}

\def\@printlist#1{#1\clearpage}

\def\addlisttofrontmatter#1{\listgadd{\@frontmatter@list}{#1}}

\def\printotherlists{%
  \clearpage
  \forlistloop{\@printlist}{\@frontmatter@list}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FRONT PAGE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{iselreport-files/frontpage.clo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ABSTRACT ENVIRONMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\abstractEN{%
  \selectlanguage{english}
  \gdef\@keywordsname{\@keywordsnameEN}
  \chapter*{\@abstrnameEN}
}

\def\abstractPT{%
  \selectlanguage{portuguese}
  \gdef\@keywordsname{\@keywordsnamePT}
  \chapter*{\@abstrnamePT}
}

\def\@keywordsname{\@defaultkeywordsname}
\def\keywords{%
  \par\vskip\baselineskip\noindent{\bf\@keywordsname: }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TABLE OF CONTENTS AND SECTIONING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}
  {\chaptertitlename\ \thechapter}
  {20pt}
  {\Huge\bfseries}
  [\vspace{1ex}\titlerule]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BIBLIOGRAPHY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[
  style=ieee,
  backend=bibtex,
  sorting=debug,
  maxnames=20,
  maxcitenames=3,
  giveninits=false,
  citestyle=nature,
  natbib=true,
  doi=true,
  isbn=true,
]{biblatex}

\DefineBibliographyStrings{portuguese}{%
  bibliography = {Referências},
  references   = {Referências},
  page         = {pág.},
  pages        = {páginas},
  and          = {\&},
  mathesis     = {Tese de Mestrado},
  phdthesis    = {Tese de Doutoramento},
}

\DefineBibliographyStrings{english}{%
  bibliography = {References},
  references   = {References},
  page         = {page},
  pages        = {pages},
}

\def\UrlBreaks{\do\/\do-}
\setcounter{biburlnumpenalty}{9000}
\setcounter{biburllcpenalty}{9000}
\setcounter{biburlucpenalty}{9000}