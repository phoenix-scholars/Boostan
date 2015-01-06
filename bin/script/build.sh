#!/bin/bash
#################################################################################
# حق نشر 1392-1402 دانش پژوهان ققنوس
# حقوق این اثر محفوظ است.
# 
# استفاده مجدد از متن و یا نتایج این اثر در هر شکل غیر قانونی است مگر اینکه متن حق
# نشر بالا در ابتدای تمامی مستندهای و یا برنامه‌های به دست آمده از این اثر
# بازنویسی شود. این کار باید برای تمامی مستندها، متنهای تبلیغاتی برنامه‌های
# کاربردی و سایر مواردی که از این اثر به دست می‌آید مندرج شده و در قسمت تقدیر از
# صاحب این اثر نام برده شود.
# 
# نام گروه دانش پژوهان ققنوس ممکن است در محصولات به دست آمده از این اثر درج
# نشود که در این حالت با مطالبی که در بالا اورده شده در تضاد نیست. برای اطلاع
# بیشتر در مورد حق نشر آدرس زیر مراجعه کنید:
# 
# http://dpq.co.ir/licence
#################################################################################
#configure

#Make Project diagrams
function boostan_build_umbrello() {
	boostan_log "Looking for umbrello files in \'%s\'" "$BOOSTAN_WRK_DIR/$1"
	if [ ! -d "$BOOSTAN_WRK_DIR/$1" ]; then
		boostan_log "The path not exist \'%s\'" "$BOOSTAN_WRK_DIR/$1"
		return 1;
	fi
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(xmi\)" -print0 | while read -d $'\0' file
	do
		boostan_log "Processing %s file..." "$file"
	    filename=$(basename "$file")
		directoryname=$(dirname "$file")
	    extension="${filename##*.}"
	    filename="${filename%.*}"
	    echo FILE: "${directoryname}/${filename}.pdf"
	    mkdir "$BOOSTAN_WRK_DIR/$1/$filename"
		umbrello --export svg \
			--directory "$BOOSTAN_WRK_DIR/$1/$filename" \
			"$file"
	done
	return 0;
}

#
# تمام SVG‌ها را به PS تبدیل می‌کند
#
# به صورت مستقیم نمی‌توان این نوع تصاویر را در متن آورد از این رو نیاز است آنها را به
# ساختارهای دیگری تبدیل کنند.
#
function boostan_build_svg () {
	boostan_log "Looking for SVG files in \'%s\'" "$BOOSTAN_WRK_DIR/$1"
	if [ ! -d "$BOOSTAN_WRK_DIR/$1" ]; then
		boostan_log "The path not exist \'%s\'" "$BOOSTAN_WRK_DIR/$1"
		return 1;
	fi
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(svg\)" -print0 | while read -d $'\0' file
	do
		boostan_log "Processing %s file..." $file
	    filename=$(basename "$file")
		directoryname=$(dirname "$file")
	    extension="${filename##*.}"
	    filename="${filename%.*}"
	    boostan_log "FILE: \"%s\"" "${directoryname}/${filename}.ps"
	    inkscape \
	    	--export-ps="${directoryname}/${filename}.ps" "$file"
	done
	return 0;
}

#
# XXX: maso 1393/7:Libro office ODG
# یک نوع از ساختارهای داده‌ای که معمولا برای ایجاد نمودار استفاده می‌شود، ساختارهای odg است. از این رو 
# نیاز است که از این ساختار نیز حمایت شود. با فرض این که ابزارهای Libro office نصب است می‌توان با استفاده
# از دستور زیر یک پرونده را به pdf و یا هر ساختار دیگری تبدیل کرد:
# oodraw --headless --convert-to pdf [document.odg]
#
# Param 1 : root path
#
function boostan_build_odg () {
	boostan_log "Looking for ODG files in \'%s\'" "$BOOSTAN_WRK_DIR/$1"
	if [ ! -d "$BOOSTAN_WRK_DIR/$1" ]; then
		boostan_log "The path not exist \'%s\'" "$BOOSTAN_WRK_DIR/$1"
		return 1;
	fi
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(odg\)" -print0 | while read -d $'\0' file
	do
		boostan_log "Processing \'%s\' file..." $file
		filename=$(basename "$file")
		directoryname=$(dirname "$file")
		extension="${filename##*.}"
		filename="${filename%.*}"
		oodraw \
			--headless \
			--convert-to pdf \
			--outdir "${directoryname}" \
			"$file"
		boostan_log "The output of the input odg file is stored in \'%s\'" "${directoryname}/${filename}.pdf"
	done
	return 0;
}

function boostan_build_src() {
	# Check the boostan styles
	if [ ! -d "$BOOSTAN_WRK_DIR/boostan" ]; then
		echo "Boostan styles does not exits?!";
		boostan_log "Boostan styles does not exits in the path (%s)" "$BOOSTAN_WRK_DIR/boostan"
		return 1;
	fi
	
	#Make new document
	cd "$BOOSTAN_SRC_DIR"
	xelatex  -synctex=1 -interaction=nonstopmode --src-specials main.tex
	xindy -L persian -C utf8 -I xindy -M main -t main.glg -o main.gls main.glo
	bibtex main
	makeindex main.idx
	xelatex -synctex=1 -interaction=nonstopmode --src-specials main.tex
	xelatex -synctex=1 -interaction=nonstopmode --src-specials main.tex
	
	#Deploy
	cp main.pdf "$BOOSTAN_WRK_DIR/output/${PROJECT_NAME}.pdf"
	
	cd "$BOOSTAN_WRK_DIR"
	return 0;
}

function boostan_build(){
	boostan_log "Trying to build the project umbrello files"
	boostan_build_umbrello image
	boostan_build_umbrello src/image
	boostan_build_umbrello attachment
	boostan_log "Trying to build the project SVG files"
	boostan_build_svg image
	boostan_build_svg src/image
	boostan_build_svg attachment
	boostan_log "Trying to build the project ODG files"
	boostan_build_odg image
	boostan_build_odg src/image
	boostan_build_odg attachment
	boostan_log "Trying to build the project source"
	boostan_build_src
	return 0;
}
