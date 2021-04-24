% Class file for laboratory exercises by Christos Dalamagkas
% Refer to README on how to use custom commands.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{EdipyLabs}
\LoadClass[11pt,a4paper]{article}

\RequirePackage[usenames,dvipsnames,svgnames,table,xcdraw]{xcolor}

%%%%% PROGRAMMING TOOLS
\RequirePackage{suffix}
\RequirePackage{etoolbox}

%%%%% LANGUAGE AND FONTS 
\RequirePackage{xltxtra,xgreek,fontspec}
\RequirePackage[T1]{fontenc}
\setmainfont{Times New Roman} 			 % main font
\setmonofont{Courier New}			 	 % for commands
\RequirePackage[greek]{datetime2} 		 % show greek date correctly using \today command
\renewcommand{\today}{\ifcase\month\or%
Ιανουάριος\or Φεβρουάριος\or Μάρτιος\or% 
Απρίλιος\or Μάιος\or Ιούνιος\or Ιούλιος%
\or Αύγουστος\or Σεπτέμβριος\or% 
Οκτώβριος\or Νοέμβριος\or% 
Δεκέμβριος\fi\ \number \year}			 % nominative instead of genitive 
\RequirePackage{amsmath}

%%%%% SPACING AND GEOMETRY
\RequirePackage{parskip}
\RequirePackage[textwidth=17cm,
textheight=23cm]{geometry} 							% document geometry
\addtolength{\voffset}{0.5cm}						% vertical space between top of page and bottom of header
\RequirePackage{setspace}							% set space between lines
\RequirePackage{tocloft}							% change spacing of ToC, LoF, LoT
\RequirePackage[flushmargin, hang, bottom]{footmisc}% optimize footer spacing
\addtolength{\footnotesep}{2.5mm}					% space between footnotes
\RequirePackage{float} 								% provides H option for precise position of float environments
\RequirePackage{array} 								% extra option for arrays and columns format ( like m{} ) 
\newcommand{\dnormalspacing}{1.25}					% line spacing
\renewcommand{\baselinestretch}{\dnormalspacing}    % set line stretching
\RequirePackage{titlesec}							% customize space and place of section, subsection	
\setlength{\parindent}{0pt}							% no horizontal space on new paragraph

%\AtBeginEnvironment{enumerate}{\vspace*{-0.3cm}}
\RequirePackage{multirow}
\RequirePackage[inline]{enumitem}
\setlist{itemsep=1pt}

%%%%% BOXES AND LAYOUTS
\RequirePackage{fancybox} 	 % boxes that include boxing commands (\Sbox, \fbox, \ovalbox etc)
\RequirePackage{changepage}  % page layout customization
\RequirePackage{booktabs}	 % extra commands for tables like \cmidrule{}
\RequirePackage{tabularx}
\RequirePackage{fancyhdr}	 % customize footer and header layouts
\pagestyle{fancy}														
\fancyhf{}	
\lhead{\footnotesize Εργαστήριο \LabNumber: \LabTitle}									 						
\rhead{\footnotesize Εργαστήριο Δικτύων και Προηγμένων Υπηρεσιών}		% COURSE title, change it if you want to
\cfoot{\noindent\makebox[\linewidth]{\rule{0.75cm}{0.4pt}}\\\thepage} 	% custom page number format 
\tocloftpagestyle{fancy} 												% tocloft resets header of toc page
\newcolumntype{?}{>{\global\let\currentrowstyle\relax}}					
\newcolumntype{^}{>{\currentrowstyle}}									
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}%
  #1\ignorespaces}
\RequirePackage[framemethod=tikz]{mdframed}
\usepackage{longtable}
\usepackage{adjustbox}
\usepackage{listings}

%%%%% COLOURS, GRAPHICS AND FIGURES
\RequirePackage{graphicx} 					% more options for \includegraphics
\RequirePackage{soul}				% soul provides \hl for highlighting text
%\RequirePackage{easyReview}
\RequirePackage[font={small,singlespacing},
labelfont={bf},
textfont={it},
justification={justified},
margin=0pt]{caption}						% customization of captions on figures 

\RequirePackage{tikz}						% used to create \keystroke command
\usetikzlibrary{shadows}
\graphicspath{{./figures/}}  				% All imported figures must be in a folder named 'figures'
\RequirePackage{awesomebox}
\RequirePackage{fontawesome5}
\setlength{\aweboxvskip}{1ex}
\setlength{\aweboxrulewidth}{1.5pt}
\setlength{\aweboxleftmargin}{12mm}

%%%%% EFORMS AND METADATA CUSTOMIZATION
\usepackage[%draft=true,
%pdfa=true,
bookmarksopen=true,
unicode=true,
pdfdisplaydoctitle=true,
breaklinks
]{hyperref}
\RequirePackage{eforms}
\everyTextField{\BC{0 0 1}\BG{0.98 0.92 0.73}}
\everyRadioButton{\BC{0 0 1}\BG{0.98 0.92 0.73}}
\RequirePackage{hyperxmp}

%%%%% License
\RequirePackage[type={CC},modifier={by-sa},version={4.0}]{doclicense}

%\RequirePackage[a-3b]{pdfx}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEW COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{assignmentbox}{\begin{awesomeblock}[blue]{\aweboxrulewidth}{\faEdit}{blue}}{\end{awesomeblock}}
\newenvironment{questionbox}{\begin{awesomeblock}[blue]{\aweboxrulewidth}{\faQuestion}{blue}}{\end{awesomeblock}}
\newenvironment{givecommandbox}{\begin{awesomeblock}[ForestGreen]{\aweboxrulewidth}{\faTerminal}{ForestGreen}}{\end{awesomeblock}}

\newcommand*\keystroke[1]{			% new command that shows computer keys graphically like Ctrl, letters etc 
	\tikz[baseline=(key.base)]
	\node[%
	draw,
	fill=white,
	drop shadow={shadow xshift=0.25ex,shadow yshift=-0.25ex,fill=black,opacity=0.75},
	rectangle,
	rounded corners=2pt,
	inner sep=2pt,
	line width=0.5pt,
	font=\scriptsize\ttfamily
	](key) {#1\strut};
}

\newcommand{\HRule}{\noindent\makebox[\linewidth]{\rule{5cm}{0.4pt}}} % Defines a new command for the horizontal lines

% Interface commands to customize first page
\newcommand{\SetLabNumber}[1]{\newcommand{\LabNumber}{#1}}
\newcommand{\SetLabTitle}[1]{\newcommand{\LabTitle}{#1}}
\newcommand{\SetAuthor}[1]{\newcommand{\Author}{#1}}
\newcommand{\SetLabDescription}[1]{\newcommand{\LabDescription}{#1}}
\newcommand{\SetLabPrerequisites}[1]{\newcommand{\LabPrerequisites}{#1}}

%Coloring tabulars
\newcommand{\FormatFirstRow}{\rowcolor{gray!50}}
\definecolor{lightgray}{gray}{0.9}

% New command to represent inline CLI commands
\newcommand{\cmd}[1]{\texttt{\textbf{#1}}}

% New environment to illustrate CLI commands

\lstnewenvironment{CommandBox}
{%
\lstset{%
	basicstyle=\ttfamily, %
	escapeinside=``,%
	tabsize=5, %
	keepspaces
%	backgroundcolor=\color{lightgray}
}}%
{}

\surroundwithmdframed[%
backgroundcolor		= gray!5,
linewidth			= 0.75pt,
innertopmargin		= 1ex,
innerbottommargin	= 0ex,
splittopskip		= \topskip,
skipabove			= \topskip,
skipbelow			= \topskip,
innerleftmargin		= 5pt]{CommandBox}

\newenvironment{CommandTable}[2]	% Table with multiple commands and description (fixed optimized width for big commands)
{\def\savedcaption{\caption{#1}}%
\def\savedlabel{#2}%
	\begin{table}[ht]
		\centering\renewcommand{\arraystretch}{1.5}
		%\begin{adjustwidth}{-1cm}{0cm}
			\begin{adjustbox}{width=\textwidth, center}
			\begin{tabular}{m{10cm}m{8cm}}
				\FormatFirstRow\textbf{Εντολή}&\textbf{Περιγραφή}
			\end{tabular}
			\end{adjustbox}
			\rowcolors{1}{white}{lightgray}
			\begin{adjustbox}{width=\textwidth, center}
			\begin{tabular}{>{\ttfamily}m{10cm}m{8cm}}
}{
			\end{tabular}
			\end{adjustbox}
		%\end{adjustwidth}
		\savedcaption\label{tab:\savedlabel}
	\end{table}
}

\newenvironment{CommandTable*}[4]	% Table with multiple commands and description (custom width of each column)
{\def\savedcaption{\caption{#1}}%
\def\savedlabel{#2}%
	\begin{table}[ht]
		\centering\renewcommand{\arraystretch}{1.5}
		%\begin{adjustwidth}{-1cm}{0cm}
			\begin{adjustbox}{width=\textwidth, center}
			\begin{tabular}{m{#3}m{#4}}
				\FormatFirstRow\textbf{Εντολή}&\textbf{Περιγραφή}
			\end{tabular}
			\end{adjustbox}
			\rowcolors{1}{white}{lightgray}
			\begin{adjustbox}{width=\textwidth, center}
			\begin{tabular}{>{\ttfamily}m{#3}m{#4}}
}{
			\end{tabular}
			\end{adjustbox}
		%\end{adjustwidth}
		\savedcaption\label{tab:\savedlabel}
	\end{table}
}

\newenvironment{CommandTableAuto}[2]  % Table with multiple commands and description (auto width for small commands)
{\def\savedcaption{\caption{#1}}%
\def\savedlabel{#2}%
	\begin{table}[ht]
		\centering\renewcommand{\arraystretch}{1.5}
		\rowcolors{2}{lightgray}{white}
		\begin{tabular}{>{\ttfamily}ll}
			\FormatFirstRow{\bfseries\rmfamily Εντολή}&\textbf{Περιγραφή}\\
}{
			\end{tabular}
		\savedcaption\label{tab:\savedlabel}
	\end{table}
}

\newenvironment{MyTabularAuto}[2]{		% Custom tabular environment for automatic coloring with automatic sizing
	\rowcolors{2}{lightgray}{white}\renewcommand{\arraystretch}{1.5}
	\begin{tabular}{ll}
	\FormatFirstRow\textbf{#1} & \textbf{#2}\\
}{\end{tabular}}

\newenvironment{MyTabular}[3]{		% Custom tabular environment for automatic coloring with automatic sizing
	\begin{adjustbox}{width=\textwidth, center}
	\rowcolors{2}{lightgray}{white}\renewcommand{\arraystretch}{1.5}
	\begin{tabular}{#3}
	\FormatFirstRow\textbf{#1} & \textbf{#2}\\
}{\end{tabular}\end{adjustbox}}

\newenvironment{IpAddressTable}[2]{		% Custom table environment for Ip addressing table
	\def\savedlabel{#2}%
	\def\savedcaption{#1}
	\begin{table}[H]
		\centering\renewcommand{\arraystretch}{1.1}
		%\begin{adjustbox}{width=\textwidth, center}
		\begin{tabular}{c>{\bfseries\ttfamily}c>{\bfseries\ttfamily}l>{\bfseries\ttfamily}l>{\bfseries\ttfamily}c}
			%\rowstyle{\normalfont\bfseries}
			\FormatFirstRow
			\normalfont\textbf{Συσκευή} & \normalfont\textbf{Διεπαφή} & \normalfont\textbf{Διεύθυνση IP} & \normalfont\textbf{Μάσκα υποδικτύου} & \normalfont\textbf{Προεπιλεγμένη πύλη}\\
}{
		\end{tabular}
		%\end{adjustbox}
		\caption{\savedcaption}\label{tab:\savedlabel}
	\end{table}
}

\newenvironment{IpAddressTableNoDefaultRoute}[2]{		% Custom table environment for Ip addressing table no default route
	\def\savedlabel{#2}%
	\def\savedcaption{#1}
	\begin{table}[H]
		\centering\renewcommand{\arraystretch}{1.1}
		%\begin{adjustbox}{width=\textwidth, center}
		\begin{tabular}{c>{\bfseries\ttfamily}c>{\bfseries\ttfamily}l>{\bfseries\ttfamily}l>{\bfseries\ttfamily}c}
			%\rowstyle{\normalfont\bfseries}
			\FormatFirstRow
			\normalfont\textbf{Συσκευή} & \normalfont\textbf{Διεπαφή} & \normalfont\textbf{Διεύθυνση IP} & \normalfont\textbf{Μάσκα υποδικτύου} \\
		}{
		\end{tabular}
		%\end{adjustbox}
		\caption{\savedcaption}\label{tab:\savedlabel}
	\end{table}
}

\newenvironment{VlanTable}[2]{		% Custom table environment for VLAN assignment
	\def\savedlabel{#2}%
	\def\savedcaption{#1}
	\begin{table}[H]
		\centering\renewcommand{\arraystretch}{1.1}
		\begin{tabular}{ccllc}
			\FormatFirstRow
			\textbf{VLAN ID} & \textbf{Όνομα VLAN} & \textbf{Συσκευή - Θύρα} \\
}{
		\end{tabular}
		\caption{\savedcaption}\label{tab:\savedlabel}
	\end{table}
}

\newcommand\ip[1]{\texttt{\textbf{#1}}}
\newcommand\tab[1][1cm]{\hspace*{#1}}	% Command to insert tab of 1cm (or sth custom)

\newcommand{\FirstPage}{	% Command to create first page of document
	\begin{titlepage}
		\centering % Center everything on the page
		\includegraphics[scale=0.4]{icte-uowm.pdf}\\[1cm]

		%	HEADING SECTIONS
		\textsc{\Huge Πανεπιστημιο Δυτικησ Μακεδονιασ}\\[0.5cm] % University name
		\textsc{\Large Τμημα Μηχανικων Πληροφορικησ και Τηλεπικοινωνιων}\\[0.5cm] % Department name
		\large{Εργαστήριο Δικτύων και Προηγμένων Υπηρεσιών}\\[0.5cm] % course title

		%	TITLE SECTION
		\rule{\linewidth}{0.5mm}\\[0.25cm]
			{\LARGE\bfseries Εργαστήριο \LabNumber: \LabTitle}\\ % Lab title
		\rule{\linewidth}{0.5mm}\\[1.25cm]
		
		%	AUTHOR SECTION
		\begin{minipage}{0.5\textwidth}
			\begin{flushleft}
				\textit{Επιμέλεια:}\\[0.125cm]
				\Author\\
			\end{flushleft}
		\end{minipage}%
		\begin{minipage}{0.5\textwidth}
			\begin{flushright}
				\textit{Επιβλέπουσα:}\\[0.125cm]
				Δρ. Μαλαματή Λούτα\\
			\end{flushright}
		\end{minipage}
			
		\vfill % Fill the rest of the page with whitespace

		%	DATE SECTION
		{\doclicenseImage[imagewidth=8em]\\[0.25cm]%\includegraphics[scale=0.75]{by-sa.pdf}\\[0.25cm]
			\large Κοζάνη, \today} 
		
	\end{titlepage}
}

\newcommand\Initialize{	% \Initialize (ToC, ToF and ToT at the same page).
	\FirstPage
	% \titlespacing*{〈command〉}{〈left〉}{〈before-sep〉}{〈after-sep〉}[〈right-sep〉]
	%\titlespacing*{\section}{0cm}{0cm}{2ex}				% [default] no extra space between section
	\section*{Περιγραφή}
	\textbf{Λέξεις κλειδιά}: \LabDescription \par
	\textbf{Προαπαιτούμενες γνώσεις}: \LabPrerequisites\par
	\renewcommand{\baselinestretch}{\dnormalspacing}
	\small\vspace{0.25cm}
	\titlespacing{\section}{0cm}{0.75cm}{0cm}
		\tableofcontents
	\titlespacing{\section}{0cm}{0.75cm}{0.25cm}	
		\listoffigures
		\listoftables
	\titlespacing*{\section} {0pt}{2.5ex plus 1ex minus .2ex}{2ex plus .2ex}
	\titlespacing*{\subsection} {0pt}{2.25ex plus 1ex minus .2ex}{0.75ex plus .2ex}	
	\renewcommand{\baselinestretch}{\dnormalspacing}\normalsize
	\newpage
}

\newcommand\NIC{\normalfont NIC}
\newcommand\SVI{\normalfont SVI}

\AtEndPreamble{
	\hypersetup{%
		pdftitle={Εργαστήριο \LabNumber: \LabTitle},%
		pdfauthor={\Author},%
		pdfsubject={Εργαστήριο Δικτύων και Προηγμένων Υπηρεσιών Πανεπιστημίου Δυτικής Μακεδονίας},%
		pdfcreator={XeLaTeX with EdipyLabs.cls},%
		pdfkeywords={\LabDescription},%
		pdflang={el}%
	}
}
\endinput