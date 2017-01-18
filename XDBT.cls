\NeedsTeXFormat{LaTeX2e}[2017/01/13]
\ProvidesClass{XDBT}[2017/01/13 v1.0 XD Bachelor Thesis class]


%%%%--------Environment Settings--------%%%%

\LoadClass[cs4size,a4paper,fancyhdr,fntef, UTF8]{ctexbook}[2017/01/13]
\usepackage{CJK}
\usepackage{indentfirst}
\usepackage{titlesec}

\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{caption2}
\RequirePackage{booktabs,tabularx}
\RequirePackage{graphicx}
\RequirePackage[square,sort&compress,numbers,super]{natbib}
\AtEndOfPackage{\makeatletter\input{XDBT.cfg}\makeatother}

\graphicspath{{graphics/}}

%% hyperlink & bookmarks
\usepackage[CJKbookmarks,xetex,unicode]{hyperref}
\usepackage{bookmark}
\hypersetup{
unicode=true, % non-Latin characters in Acrobat’s bookmarks
pdftoolbar=true, % show Acrobat’s toolbar?
pdfmenubar=true, % show Acrobat’s menu?
pdffitwindow=true, % page fit to window when opened
pdftitle={管理：任务、责任、实践}, % title
pdfauthor={彼得·F·德鲁克}, % author
pdfsubject={管理学}, % subject of the document
pdfnewwindow=true, % links in new window
pdfkeywords={}, % list of keywords
colorlinks=true , % false: boxed links; true: colored links
linkcolor=black, % color of internal links
citecolor=black, % color of links to bibliography
filecolor=black, % color of file links
urlcolor=black % color of external links
}



%% (re)new variables
\renewcommand{\chapter}{\if@openright\clearpage\else\clearpage\fi
\global\@topnum\z@ \@afterindentfalse \secdef\@chapter\@schapter}

\renewcommand\contentsname{\XDBT@label@content}
\renewcommand\title[1]{\def\XDBT@value@title{#1}}
\newcommand\rtitle[1]{\def\XDBT@value@rtitle{#1}}
\renewcommand\author[1]{\def\XDBT@value@author{#1}}
\newcommand\class[1]{\def\XDBT@value@class{#1}}
\newcommand\studentNumber[1]{\def\XDBT@value@studentNumber{#1}}
\newcommand\institute[1]{\def\XDBT@value@institute{#1}}
\newcommand\major[1]{\def\XDBT@value@major{#1}}
\newcommand\advisor[1]{\def\XDBT@value@advisor{#1}}

\renewcommand{\floatpagefraction}{0.80}
\renewcommand{\captionlabeldelim}{}
\renewcommand{\captionfont}{\small}

\renewcommand{\theequation}{\thechapter-\arabic{equation}}

% abstract page
\newcommand\rChapter[2]{%
    \chapter*{#1}
	\chaptermark{#2}
}
\newenvironment{abstract}{\rChapter{\XDBT@label@abstract}{\XDBT@label@abstract}}
{}
\newenvironment{enabstract}{\rChapter{\bf \XDBT@label@enabstract}{\XDBT@label@enabstract}}
{}
\newcommand\keywords[1]{%
    \vspace{2ex}\noindent{\heiti\zihao{-4} \XDBT@label@keywords} \heiti\zihao{-4}#1}
\newcommand\enkeywords[1]{%
    \vspace{2ex}\noindent{\bf\zihao{-4} \XDBT@label@enkeywords} \bf\zihao{-4}#1}

\newcommand\tChapter[2]{%
    \chapter{#1}
	\chaptermark{#2}
}
\newcommand\bChapter[1]{%
    \chapter[#1]{#1}%
}
\renewenvironment{thanks}{\tChapter{\XDBT@label@thanks}{\XDBT@label@thanks}}
{}
\renewenvironment{thebibliography}[1]
     {\bChapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%% code block
\usepackage{listings}
\usepackage{color}

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{ %
  language=Octave,                % the language of the code
  basicstyle=\footnotesize,           % the size of the fonts that are used for the code
  numbers=left,                   % where to put the line-numbers
  numberstyle=\tiny\color{gray},  % the style that is used for the line-numbers
  stepnumber=2,                   % the step between two line-numbers. If it's 1, each line 
                                  % will be numbered
  numbersep=5pt,                  % how far the line-numbers are from the code
  backgroundcolor=\color{white},      % choose the background color. You must add \usepackage{color}
  showspaces=false,               % show spaces adding particular underscores
  showstringspaces=false,         % underline spaces within strings
  showtabs=false,                 % show tabs within strings adding particular underscores
  frame=single,                   % adds a frame around the code
  rulecolor=\color{black},        % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. commens (green here))
  tabsize=2,                      % sets default tabsize to 2 spaces
  captionpos=b,                   % sets the caption-position to bottom
  breaklines=true,                % sets automatic line breaking
  breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
  title=\lstname,                   % show the filename of files included with \lstinputlisting;
                                  % also try caption instead of title
  keywordstyle=\color{blue},          % keyword style
  commentstyle=\color{dkgreen},       % comment style
  stringstyle=\color{mauve},         % string literal style
  escapeinside={\%*}{*)},            % if you want to add LaTeX within your code
  morekeywords={*,...}               % if you want to add more keywords to the set
}


%%%%--------Layout Settings--------%%%%

%% set margin with left:3cm,right:2cm,up:3cm,down:2cm
\oddsidemargin 1.46 true cm
\evensidemargin -0.54 true cm
\topmargin -0.54 true cm
\headheight 11pt
\headsep 17.3527pt
\textheight 24.7 true cm
\textwidth 15 true cm
\footskip 0 cm
\parskip 0.5ex plus 0.25ex minus 0.25ex
\setlength{\parindent}{2em}

\hbadness=10000

\tolerance=50000

\setcounter{secnumdepth}{4}

%% titles style
\titleformat{\chapter}[hang]{\heiti\bfseries\center\zihao{\XDBT@value@FSchapter}}{第\CTEXnumber{\num}{\thechapter}{\num}章}{1em}{\zihao{\XDBT@value@FSchapter}}
\titlespacing*{\chapter} {0pt}{5pt}{15pt}

\titleformat{\section}[hang]{\songti\bfseries\center\zihao{\XDBT@value@FSsection}}{\thesection}{1em}{\zihao{\XDBT@value@FSsection}}
\titlespacing*{\section} {0pt}{15pt}{10pt}

\titleformat{\subsection}[block]{\songti\bfseries\zihao{\XDBT@value@FSmainText}}{\thesubsection}{1em}{\zihao{\XDBT@value@FSmainText}}
\titlespacing*{\subsection} {0pt}{10pt}{7pt}
%% header
\fancypagestyle{content}{%
    \fancyhf{}
    \fancyhead[CE]{\songti\zihao{5} {\XDBT@value@title\XDBT@value@rtitle}}
    \fancyhead[CO]{\songti\zihao{5} \leftmark}
    \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
    \renewcommand{\headrulewidth}{0.75pt}%
}

\pagestyle{fancy}
    \fancyhf{}
 	\fancyhead[C]{\songti\zihao{5} \leftmark}
    \fancyhead[LE,RO]{\songti\zihao{-5} ~\thepage~}
    \renewcommand{\headrulewidth}{0.75 pt}%


%% set line spacing. ratio: 1:(14.5pt)
\renewcommand{\baselinestretch}{1.24}

%% define the underline
\def\XDBT@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\XDBTunderline{\@ifnextchar[\XDBT@underline\CTEXunderline}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    %\thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


%% make title
\renewcommand\maketitle{%
	\cleardoublepage
	\thispagestyle{empty}
    \begin{flushright}
        \bf\songti\zihao{-4}
        \XDBT@label@class~ \XDBTunderline[100pt]{\XDBT@value@class}\\
        \XDBT@label@studentNumber~ \XDBTunderline[100pt]{\XDBT@value@studentNumber}
    \end{flushright}
    
	\begin{center}
		\vskip \stretch{2}
			\includegraphics[width=9cm]{xdText}
		\vskip \stretch{1}
	  		{\heiti\zihao{0}\ziju{0.25} \XDBT@label@thesis}
	  	\vskip \stretch{2}
	  		\includegraphics[width=5cm]{xdSign}
	  	\vskip \stretch{2}
	  		\heiti\zihao{\XDBT@value@FSchapter} \XDBT@label@title~ \XDBTunderline[250pt]{~\XDBT@value@title~}
	  	\vskip \stretch{0.5}
	  						{~~~~~~~~~~~~~~} \XDBTunderline[250pt]{~\XDBT@value@rtitle~}
	  	\vskip \stretch{0.5}
	  		\heiti\zihao{\XDBT@value@FSchapter} \XDBT@label@institute~
	  		\songti\zihao{\XDBT@value@FSlabel}\XDBTunderline[250pt]{~\XDBT@value@institute~}
	  	\vskip \stretch{0.5}
	  		\heiti\zihao{\XDBT@value@FSchapter} \XDBT@label@major~
	  		\songti\zihao{\XDBT@value@FSlabel}\XDBTunderline[250pt]{~\XDBT@value@major~}
	  	\vskip \stretch{0.5}
	  		\heiti\zihao{\XDBT@value@FSchapter} \XDBT@label@author~
	  		\songti\zihao{\XDBT@value@FSlabel}\XDBTunderline[250pt]{~\XDBT@value@author~}
	  	\vskip \stretch{0.5}
	  		\heiti\zihao{\XDBT@value@FSchapter} \XDBT@label@advisor~
	  		\songti\zihao{\XDBT@value@FSlabel}\XDBTunderline[250pt]{~\XDBT@value@advisor~}
	\end{center}
	
	\clearpage
	\if@twoside
	\thispagestyle{empty}
		\vspace*{\stretch{1}}
		\begin{footnotesize}
			\noindent
			Author by Liu-Yao (derektanko@gmail.com)\\
			Typeset by \LaTeXe{}
		\end{footnotesize}
		\cleardoublepage
	\fi
}


\newtheoremstyle{break}% name
    {}%      Space above, empty = `usual value'
    {}%      Space below
    {\itshape}% Body font
    {}%         Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries}% Thm head font
    {.}%        Punctuation after thm head
    {\newline}% Space after thm head: \newline = linebreak
    {}%         Thm head spec


%%%%--------initialize values--------%%%%
\makeatletter
	\def\XDBT@value@title{~~~~~（论~文~题~目）~~~~~}
	\def\XDBT@value@rtitle{~}
	\def\XDBT@value@institute{~~~~~（这里填写学院）~~~~~}
	\def\XDBT@value@major{~~~~~（这里填写专业）~~~~~}
	\def\XDBT@value@author{~~~~~（这里填写学生姓名）~~~~~}
	\def\XDBT@value@advisor{~~~~~（这里填写老师姓名）~~~~~}
	\def\XDBT@value@class{X-XXXX}
	\def\XDBT@value@studentNumber{XXXXXX}

	\def\tagform@#1{\maketag@@@{式\ignorespaces(#1)\unskip\@@italiccorr}}
\makeatother

\endinput