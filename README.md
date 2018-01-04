# reportisel
Template para relatório escrito em LaTex

1. Instructions

This document will serve as a template for the preparation of a report for the Programming curricular unit. To create a report of a higher grade you can see 
https://github.com/matpato/thesisisel.

	\documentclass[
		rpt,		%  rpt, preprpt - Technical Report or Preparatory Technical Report
		pt,		% (*) pt, en - languages 
		twoside,	% (*) twoside, oneside - single or double sided printing
		12pt,		% (*) 12pt, 11pt, 10pt - use font size
		a4paper,	% the paper size/format
		utf8,		% (*) utf8, latin1	- Text encoding: Linux, Mac or Windows
		hyperref = true,% Hyperlinks in citations: true(*) false
		listof=totoc
		]{reportisel} 

	1.1 How to run

	Nomenclature:
		$ pdflatex template
		$ makeindex template.nlo -s nomencl.ist -o template.nls
		$ pdflatex template (twice)

	Bibliography:
		$ pdflatex template
		$ bibtex template
		$ pdflatex template (twice)

#

2. Description

reportisel This is the main directory and includes:

	2.1 Appendixes: Directory with tex files with a section or table of subsidiary matter at the end of a book or document;
	2.2 Logo: Directory with Faculty logos;
	2.3 Chapters: Directory where to put user files (text and figures);
		
		2.3.1 scripts: Directory with useful bash scripts, e.g., for cleaning all temporary files;
		2.3.2 img: Directory with all images to use in the chapters, e.g. \texttt{ra-raster.png};
	
	2.4 alpha-pt.bst: A file with bibliography names in portuguese, e.g., 'Relatório Técnico' e 'Tese de Mestrado' instead of 'Technical Report' and 'Master Thesis'. This file is used automatically if Portuguese is selected as the main language (see below);
	2.5 defaults.tex: A file with the main default values for the package (institution name, faculty's logo, degree name and similars - TO CHANGE BY THE USER);
	2.6 personaldataofreport.tex: A file with the main default values for the package (identification of report as well as the author and professor - TO CHANGE BY THE USER);
	2.7 template.tex: The main file. You should run  \texttt{LaTeX} in this one. Please refrain from changing the file content outside of the well defined area;
	2.8 bibliography.bib: The bib file. An easy way to find to import citation into bibtex is select option "Show links to import citation into BibTex" in \href{http://scholar.google.pt/scholar_settings?hl=en&as_sdt=0,5}{Scholar google settings}.
	2.9 reportisel.cls: The  LaTeX class file for the thesis{} style. Currently, some of the defaults are stored here instead of \verb!defaults.tex!. This file should not be changed, unless you're ready to play with fire! :) - DO NOT CHANGE);
	
#

3. Some informations

The template will first automatically place the abstract in the language of the main text and then the abstract in the other language. For example, if the dissertation is written in Portuguese, the abstract will appear first in Portuguese, then in English, followed by the main text in Portuguese.

#

4. How to write using LaTex

	https://www.latex-project.org
	https://www.sharelatex.com/learn/Creating_a_document_in_LaTeX
	http://www4.di.uminho.pt/~jcr/AULAS/didac/manuais/manual-latex.pdf

	tikZ and PGF: http://www.texample.net/tikz/

# 

5. Available Software

	1. Texmaker is a free, modern and cross-platform LaTeX editor for linux, macosx and windows systems that integrates many tools needed to develop documents with LaTeX, in just one application. (source: http://www.xm1math.net/texmaker/)

	2. MiKTeX (pronounced mick-tech) is an up-to-date implementation of TeX/LaTeX and related programs. TeX is a typesetting system written by Donald Ervin Knuth who says that it is intended for the creation of beautiful books - and especially for books that contain a lot of mathematics. (source: https://miktex.org)

	3. ShareLaTeX is an open-source online real-time collaborative LaTeX editor. We run a hosted version at http://www.sharelatex.com, but you can also run your own local version, and contribute to the development of ShareLaTeX. (source: https://pt.sharelatex.com)
	
	4. Overleaf is an online LaTeX and Rich Text collaborative writing and publishing tool that makes the whole process of writing, editing and publishing scientific documents much quicker and easier. (source: https://www.overleaf.com)

# 

Author:

	Matilde Pós-de-Mina Pato

September, 18th 2017 


this package and template are not official for ISEL/IPL.