% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% حق نشر 1392-1402 دانش پژوهان ققنوس
% حقوق این اثر محفوظ است.
% 
% استفاده مجدد از متن و یا نتایج این اثر در هر شکل غیر قانونی است مگر اینکه متن حق
% نشر بالا در ابتدای تمامی مستندهای و یا برنامه‌های به دست آمده از این اثر
% بازنویسی شود. این کار باید برای تمامی مستندها، متنهای تبلیغاتی برنامه‌های
% کاربردی و سایر مواردی که از این اثر به دست می‌آید مندرج شده و در قسمت تقدیر از
% صاحب این اثر نام برده شود.
% 
% نام گروه دانش پژوهان ققنوس ممکن است در محصولات به در آمده شده از این اثر درج
% نشود که در این حالت با مطالبی که در بالا اورده شده در تضاد نیست. برای اطلاع
% بیشتر در مورد حق نشر آدرس زیر مراجعه کنید:
% 
% http://dpq.co.ir/licence
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               General Configureation          
%                        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Boostan-Proposal}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions 
% \LoadClass[11pt,a4paper,onecolumn]{article}
\LoadClass[article,a4paper]{memoir}

\usepackage{../boostan/Boostan-Proposal}


\counterwithout{section}{chapter}
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
% 	\SimplePageTitle@proposal%
% 	\SimplePageTitle@proposal@A%
	\RCISPPageTitle@proposal%
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

\endinput






