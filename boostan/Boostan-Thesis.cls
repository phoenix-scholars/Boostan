%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               General Configureation          
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Boostan-Proposal}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions 
% \LoadClass[11pt,a4paper,onecolumn]{article}
\LoadClass[book,a4paper]{memoir}

\usepackage{../style/Boostan-Thesis}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Page Setup       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{top=17.7mm, bottom=20mm, left=27.7mm, right=25mm}
\setlength{\columnwidth}{66.7mm}
\setlength{\columnsep}{10mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                TITLE PAGE  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
	\SimplePageTitle@proposal%
% 	\SimplePageTitle@proposal@A%
% 	\RCISPPageTitle@proposal%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Text And paragraph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \renewcommand{\baselinestretch}{1.5}
\settextfont[Scale=1.4]{B Nazanin} 
\setlatintextfont[Scale=1.2]{Times New Roman}
\linespread{1.5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              List       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% دستوراتی برای محیط itemize برای حل مشکل قرار دادن bullet و circle در آن. 
\makeatletter
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\makeatother

\makeatletter
\renewcommand{\figurename}{شکل}
\renewcommand{\listfigurename}{فهرست شکلها}
\renewcommand{\listtablename }{فهرست جدولها}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Algorithem and programming     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\floatname{algorithm}{الگوریتم}

\makeatletter
\lstset{ %
	language=Java,                  % the language of the code
	basicstyle=\footnotesize,       % the size of the fonts that are used for the code
	numbers=left,                   % where to put the line-numbers
	numberstyle=\footnotesize,      % the size of the fonts that are used for the line-numbers
	stepnumber=2,                   % the step between two line-numbers. If it's 1, each line 
	                                % will be numbered
	numbersep=5pt,                  % how far the line-numbers are from the code
	backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
	showspaces=false,               % show spaces adding particular underscores
	showstringspaces=false,         % underline spaces within strings
	showtabs=false,                 % show tabs within strings adding particular underscores
	frame=single,                   % adds a frame around the code
	tabsize=2,                      % sets default tabsize to 2 spaces
	captionpos=b,                   % sets the caption-position to bottom
	breaklines=true,                % sets automatic line breaking
	breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
	title=\lstname,                 % show the filename of files included with \lstinputlisting;
	                                % also try caption instead of title
	escapeinside={\%*}{*)},         % if you want to add a comment within your code
	morekeywords={*,...}            % if you want to add more keywords to the set
}
\makeatother

\makeatletter
\hypersetup{
	pdfmenubar=false,
	pdfstartview=FitH,
	pdfpagemode=FullScreen,
	colorlinks=true,
	linkcolor=blue,
	anchorcolor=green,
	citecolor=magenta,
	urlcolor=cyan,
	filecolor=magenta,
	pdftoolbar=true,
	pdftitle = {Watermarking and Steganography},
	pdfkeywords = {Watermarking, Steganography, Steganalysis},
	pdfpagemode=UseOutlines,
	pdftitle={\@title - \@date},
	pdfauthor={\@author},
	unicode=true
}
\makeatother



\endinput







