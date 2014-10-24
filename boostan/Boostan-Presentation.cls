%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General Configureation          
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Boostan-Presentation}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bidipresentation}}

\ProcessOptions
\LoadClass[11pt,oneside]{bidipresentation}

\usepackage{../style/Boostan-Variable}
\usepackage[usenames,dvipsnames]{color}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage[RL]{flowfram}

\usepackage[scaled=.92]{helvet}
\usepackage{calc}
\usepackage{framed}
\usepackage{amsthm,amssymb,amsmath}
\usepackage{thmtools}
\usepackage{dsfont}
\usepackage{makeidx}
\usepackage{geometry}
\usepackage[usenames,dvipsnames]{color}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{draftwatermark}
\usepackage{pifont}
\usepackage{multirow}
\usepackage{tikz,times}
\usepackage{pstricks}
\usepackage{tikz-qtree}
\usepackage{pgfgantt}
\usepackage{eso-pic}
\usepackage{pst-fun}
\usepackage{../style/Boostan-Environment}
\usepackage{../style/Boostan-Title}
\usepackage{colortbl}
\usepackage{graphicx}
\usepackage{lastpage}
\usepackage{pdfpages}
\usepackage{xparse}
\usepackage{ifthen}
\usepackage{titlesec}
\usepackage{hyperref}
\usepackage[sanitize={name=false,description=false,sort=false,symbol=false},nomain,xindy,acronym]{glossaries}
\usepackage{xepersian}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page Setup       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{%
	paperwidth=230mm,%
	paperheight=180mm,%
	rmargin=50mm,%
	lmargin=8mm,%
	top=20mm,%
	bottom=10mm%
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
% 	\SimplePageTitle@proposal%
%	\SimplePageTitle@proposal@A%
% 	\RCISPPageTitle@proposal%
	\RCISPPageTitle@presentation%
}

%  برگه نخست در مستند را ایجاد می‌کند. در این برگه تنها نام پروردگار
% ذکر می‌شود. برای ایجاد نام پرودگار یک تصویر استفاده می‌شود به نام god.ps
% که باید در پوشه image کنار پرونده اصلی مستند قرار گرفته شده باشد.
\DeclareDocumentCommand{\Godpage}{g g}{	
	\thispagestyle{empty}%
	\begin{center}%
	\IfValueTF{#1}{%
		\IfValueTF{#2}{%
			\includegraphics[width=#2\textwidth]{#1}%
		}{%
			\includegraphics[width=.9\textwidth]{#1}%
		}%
	}{%
		\IfValueTF{#2}{%
			\includegraphics[width=#2\textwidth]{god}%
		}{%
			\includegraphics[width=.6\textwidth]{god}%
		}%
	}%
	\end{center}%
	\newpage%
}%


\def\linktc#1#2{\definecolor{link-text}{#1}{#2}}
\def\sidebartc#1#2{\definecolor{sidebar-text}{#1}{#2}}
\def\rtopbarc#1#2{\definecolor{topbar1-color}{#1}{#2}}
\def\ltopbarc#1#2{\definecolor{topbar2-color}{#1}{#2}}
\def\ltopbartc#1#2{\definecolor{topbar2-text}{#1}{#2}}
\def\rbotbarc#1#2{\definecolor{botbar1-color}{#1}{#2}}
\def\lbotbarc#1#2{\definecolor{botbar2-color}{#1}{#2}}
\def\lbotbartc#1#2{\definecolor{botbar2-text}{#1}{#2}}

\sidebartc{cmyk}{0,0,0,1}
\linktc{cmyk}{0,0,0,0}
\rtopbarc{cmyk}{0.74,0.44,0,0}
\ltopbarc{cmyk}{0.15,0.15,0,0}
\ltopbartc{cmyk}{0,0,0,1}
\rbotbarc{cmyk}{0.15,0.15,0,0}
\lbotbarc{cmyk}{0.94,0.54,0,0}
\lbotbartc{cmyk}{0,0,0,0}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Text And paragraph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{listinggray}{gray}{.98}
\lstset{% general command to set parameter(s)
	language=Java,
	backgroundcolor=\color{listinggray},
	linewidth=.9\textwidth ,
	frameround=fttt,frame=trBL,
	basicstyle=\ttfamily, % print whole listing small
	keywordstyle=\color{blue}\bfseries,
	framexrightmargin=10mm,
	stringstyle=\ttfamily\color{red}, % typewriter type for strings
	lineskip = .5pt,
	captionpos=b, breaklines=true,
	breaklines=true,frame=single, breakatwhitespace=false,
	commentstyle=\color{LimeGreen}, % white comments
	showstringspaces=false} % no special string spaces
	\lstset{
	linewidth=.9\textwidth ,
	frameround=fttt,frame=trBL,
	basicstyle=\ttfamily, % print whole listing small
	framexrightmargin=20mm,
	stringstyle=\ttfamily\color{red}, % typewriter type for strings
	lineskip = .5pt,
	numbers=left,
	showstringspaces=false
}%

\hypersetup{
	pdfmenubar=false,%
	pdfstartview=FitH,%pdfpagemode=FullScreen,
	colorlinks=true,%
	linkcolor=blue,%
	anchorcolor=green,%
	citecolor=magenta,%
	urlcolor=cyan,%
	filecolor=magenta,%
	pdftoolbar=true,%
	pdfpagemode=UseOutlines%
}%

\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithem and programming     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\SetWatermarkLightness{.94}
\SetWatermarkAngle{45}
\SetWatermarkScale{1.5}

\let\oldSetWatermarkText\SetWatermarkText
\DeclareDocumentCommand{\SetWatermarkText}{m g}{%
	\oldSetWatermarkText{#1}
	\IfValueTF{#2}{%%
		\SetWatermarkLightness{#2}
	}{%%
		\SetWatermarkLightness{.97}
	}%%
}%

\graphicspath{%
	{./}%
	{./Pic/}%
	{./images/}%
	{/usr/share/texmf/tex/xelatex/rcisp/images/}%
	{/home/abolfazl/MyData/Picture/Other/book/}%
}

% بسته ای برای رسم اشکال و نمودارها
\usetikzlibrary{mindmap,backgrounds,shadows,shapes,snakes}


\newsavebox\boxa
\newcommand{\genr}[2]{
	\sbox\boxa{\includegraphics[width=#2\textwidth]{#1}}
	\raisebox{-0.3\ht\boxa}{\smash{\usebox\boxa}}
} %

\newcommand{\defaultFont}{%
	\settextfont[Scale=1.3]{B Nazanin}%
	\setlatintextfont[Scale=1.1]{Linux Libertine}%
	\setdigitfont[Scale=1.1]{XB Zar}%
}%

\defaultFont
\defpersianfont\tablefont[Scale=.8]{XM Traffic}
\defpersianfont\pejoheshfont[Scale=1.4]{Titr Bold}
%فونت اسم گروه XB Titre
\defpersianfont\groupfont[Scale=1.4]{Zar}
%% فونت عنوان گزارش
\defpersianfont\titlefont[Scale=2.4]{Titr Bold}
% فونت نسخه گزارش
\defpersianfont\versionfont[Scale=1.6]{Mitra}
\defpersianfont\payanFont[Scale=1.8]{XB Yas}
\defpersianfont\nastaliqgoal[Scale=1.8]{IranNastaliq}
\defpersianfont\secfont[Scale=1.8]{IranNastaliq}
\defpersianfont\nastaliqThank[Scale=4]{IranNastaliq}
\defpersianfont\farsifontshafigh[Scale=1.3]{Adobe Arabic}
\defpersianfont\titrt[Scale=1]{XB Titre}
\defpersianfont\traffict[Scale=1]{B Traffic}
\defpersianfont\farsifontsayeh[Scale=1.5]{XB Kayhan Sayeh}
%\defpersianfont\titlefont[Scale=2.4]{Titr}

\deflatinfont\tableFontEn[Scale=.9]{Adobe Arabic}

\DefaultMathsDigits
\DeclareMathSizes{10}{11}{9}{8}   % For size 10 text
\defpersianfont\titr[Scale=1.1]{XB Titre}%{Titr Farsi}

\makeatletter
\renewcommand{\rotateframe}[2]{
	\if@ttb@rotate
	\rotatebox{#1}{\if@RTL\beginL\fi#2\if@RTL\endL\fi}%
	\else
	#2\relax
	\fi
}%
\makeatother


\makeatletter
%% تعریف سایدبار و محل قرارگیری آن. 
\newstaticframe{45mm}{\paperheight}{\dimexpr(\paperwidth-55mm)}{.01\paperheight}[sidebar]
\setstaticframe*{sidebar}{valign=b}
%% اشکال قرار داده شده در قسمت Sidebar
\DeclareDocumentCommand{\titleSidebar}{m m m m g}{
	\begin{staticcontents*}{sidebar}
	\hspace{3mm}\\
	\IfValueTF{#5}{
		\hspace{8mm}\includegraphics[width=#5\textwidth]{#1}\vspace{2mm}\\
		\hspace{5mm}\includegraphics[width=#5\textwidth]{#2}\vspace{2mm}\\
		\hspace{5mm}\includegraphics[width=#5\textwidth]{#3}\vspace{2mm}\\
		\hspace{5mm}\includegraphics[width=#5\textwidth]{#4}\\
	}{%
		\hspace{5mm}\includegraphics[width=2.2cm]{#1}\vspace{2mm}\\
		\hspace{5mm}\includegraphics[width=2.2cm]{#2}\vspace{2mm}\\
		\hspace{5mm}\includegraphics[width=2.2cm]{#3}\vspace{2mm}\\
		\hspace{5mm}\includegraphics[width=2.2cm]{#4}\\
	}%%
	\hspace{5mm}\\
	\end{staticcontents*}
} %
\makeatother


\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}

\newcounter{setfirstpage}
\setcounter{setfirstpage}{2}


\newdynamicframe[>\value{setfirstpage}]{56mm}{1.29cm}{122mm}{159mm}[topbar1]
\setdynamicframe*{topbar1}{valign=c,backcolor=topbar1-color}
\newdynamicframe[>\value{setfirstpage}]{130mm}{1.29cm}{-8mm}{159mm}[topbar2]
\setdynamicframe*{topbar2}{valign=c,textcolor=topbar2-text,backcolor=topbar2-color}
%%محتویات نواربالا
\begin{dynamiccontents*}{topbar2}
	\quad\bfseries{\rightmark}
\end{dynamiccontents*}


\makeatletter
\setcounter{tocdepth}{1}
\renewcommand\tableofcontents{%
\clearpage\newpage
\linespread{1.5}
\begin{staticcontents*}{sidebar}
	\vspace{\stretch{1}}
    \@starttoc{toc}
    \vspace{\stretch{1}}
\end{staticcontents*}
    }
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        #7}}%
  \fi
  \@xsect{#5}}
  
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0.1em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \if@RTL\leftskip\else\rightskip\fi \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\if@RTL\rightskip\else\leftskip\fi\@tempdima
      \hskip -\if@RTL\rightskip\else\leftskip\fi
      \footnotesize#1\hfill\nobreak\par
    \endgroup
  \fi}
\makeatother
  

%  تنظمیات محیط شکل
% بازنویسی محیط شکل
\makeatletter
\let\oldfigure\figure
\def\figure{\@ifnextchar[\figure@i \figure@ii}
\def\figure@i[#1]{\oldfigure[#1]\centering}
\def\figure@ii{\oldfigure\centering}
\makeatother
  
\newcommand{\goalpage}[2]{%
	\clearpage%
	\AddToShipoutPicture*{%
		\put(-512,0){%
			{%
				\includegraphics[%
					keepaspectratio=false,%
					height=.94\paperheight,%
					width=198mm]{#1}%
			}%
		}%
	}%
	{%
		\Huge\nastaliq\textcolor{BurntOrange}{#2}%
	}%
	\\*[4pt]
}%
  
\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\bgroup
	\settextfont[Scale=.8]{XM Traffic}
	\setlatintextfont[Scale=.9]{Linux Libertine}
	\oldtabular
}{%
	\endoldtabular \egroup
}%

\renewcommand{\arraystretch}{1.2}


\newcommand{\question}{%
	\newpage%
% 	\clearpage
% 	\phantomsection
% 	\setdynamicframe{1}{pages=none}
% 	\setdynamicframe{2}{pages=none}
% 	\begin{staticcontents*}{sidebar}
% 	\end{staticcontents*}
% 	\begin{center}
% 		\distance{3}
% 		\begin{pspicture}(0,-1.3)(10,3)
% 			\psBird[Branch] \rput{-20}(4,1.8){\psBird}
% 		\end{pspicture}
% 		\distance{1}
% 		\LARGE\nastaliqThank{\textcolor{green}{با تشکر از توجه شما}}
% 	\end{center}
% 	\distance{3}
% 	\clearpage
% 	\setdynamicframe{1}{pages=all}
% 	\setdynamicframe{2}{pages=all}
} %
