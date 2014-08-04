%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               General Configureation          
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Boostan-Article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions 
\LoadClass[11pt,a4paper,twocolumn]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              package management       
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{amsthm,amssymb,amsmath}
\usepackage{geometry}
\usepackage[usenames,dvipsnames]{color}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{draftwatermark}
\usepackage{fourier}
\usepackage[scaled=.92]{helvet}
\usepackage{calc}
\usepackage{pifont}
\usepackage[font=footnotesize,labelformat=empty]{subfig}
\usepackage{multirow}
\usepackage{makeidx}
\usepackage{listings}
\usepackage{framed}
\usepackage{algorithm,algorithmic}
\usepackage{caption}
\usepackage{graphicx}
\usepackage{tikz,times}
\usepackage{hyperref}
\usepackage[sanitize={name=false,description=false,sort=false},nomain,xindy,acronym]{glossaries}
\usepackage{xepersian}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Geometry       
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{top=17.7mm, bottom=20mm, left=27.7mm, right=25mm}
\setlength{\columnwidth}{66.7mm}
\setlength{\columnsep}{10mm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Fonts       
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\settextfont[Scale=1.15]{B Nazanin}   
\setlatintextfont[Scale=1]{Times New Roman}
\setdigitfont[Scale=1.1]{XB Zar}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              General Environment       
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\theoremstyle{plain}
\newtheorem{theorem}{قضیه}
\newtheorem{lemma}{لم}
\newtheorem{proposition}{گزاره}

\newtheorem{note}{نکته}
\newtheorem{warning}{اخطار}

\theoremstyle{definition}
\newtheorem{definition}{تعریف}
\newtheorem{example}{مثال}
\newtheorem{prob}{سوال}

\theoremstyle{remark}
\newtheorem{corollary}{نتیجه}
\newtheorem{remark}{ملاحظه}






%% دستوراتی برای محیط itemize برای حل مشکل قرار دادن bullet و circle در آن. 
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\makeatother

\renewcommand{\figurename}{شکل}
\renewcommand{\listfigurename}{فهرست شکلها}
\renewcommand{\listtablename }{فهرست جدولها}


% دستور لازم برای تعریف محیط lr برای این که بدون هیچ مشکلی بتوان در عنوان فصل و
% یا بخش انگلیسی نوشت، نکته مهم: این دستورات باید به عنوان آخرین دستورات استایل
% شما باشد.
\makeatletter
\let\orig@lr\lr
\renewcommand*{\lr}[1]{\texorpdfstring{\orig@lr{#1}}{#1}}
\makeatother



























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                              Algorithem and programming     
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\floatname{algorithm}{الگوریتم}

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
\lstnewenvironment{xml}{
	\latin
	\lstset{language=Java}
}{
	\endlatin
}
\lstnewenvironment{shell}{
	\latin
	\lstset{language=Java}
}{
	\endlatin
}

\lstnewenvironment{ned}{
	\latin
	\lstset{language=Java}
}{
	\endlatin
}


\lstnewenvironment{ini}{
	\latin
	\lstset{language=Java}
}{
	\endlatin
}

\hypersetup{
	% موقعی که فایل پی دی اف خروجی را باز می کنید صفحه به صورت عریض و بزرگ باز می شود.
	pdfmenubar=false,
	pdfstartview=FitH,
	pdfpagemode=FullScreen,
	%pagebackref=true,
	%bookmarks=true,
	% در قسمت مراجع شماره صفحه ای که به آن مرجع ارجاع داده است را وارد می کند،
	% مواردی که
	% برای فعال سازی این که شماره اشکال را به صورت ارجاعی نشان دهد
	%hyperfigures=true,
	% به جای استفاده از مربع قرمز دور موارد ارجاعی از لینک های رنگی استفاده کند
	colorlinks=true,
	% رنگ برخی از لینک ها در زیر تعریف شده است.
	linkcolor=blue,
	anchorcolor=green,
	citecolor=magenta,
	urlcolor=cyan,
	filecolor=magenta,
	pdftoolbar=true,
	pdftitle = {Watermarking and Steganography},
	pdfkeywords = {Watermarking, Steganography, Steganalysis},
	%bookmarksopen = true,
	pdfpagemode=UseOutlines
}



\graphicspath{{./}{./Pic/}{./Pic/perm/}{./images/}{/usr/share/texmf/tex/xelatex/rcisp/images}}






