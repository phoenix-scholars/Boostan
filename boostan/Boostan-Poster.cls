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
\ProvidesClass{Boostan-Poster}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{a0poster}}
\ProcessOptions 
\LoadClass[landscape,a0b,final]{a0poster}

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
\usepackage{epsfig}
\usepackage{multicol}
\usepackage{pstricks,pst-grad}
\usepackage{xepersian}

\usepackage{background}


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

\graphicspath{%
	{./}%
	{../}%
	{./images/}%
	{../images/}%
	{./image/}%
	{../image/}%
	{/usr/share/texmf/tex/xelatex/dpq/images}%
}


