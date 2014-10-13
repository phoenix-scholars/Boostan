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
# نام گروه دانش پژوهان ققنوس ممکن است در محصولات به در آمده شده از این اثر درج
# نشود که در این حالت با مطالبی که در بالا اورده شده در تضاد نیست. برای اطلاع
# بیشتر در مورد حق نشر آدرس زیر مراجعه کنید:
# 
# http://dpq.co.ir/licence
#################################################################################
#configure

#Make Project diagrams
function boostan_build_umbrela() {
	find "$PROJECT_FULL_PATH/attach" -type f -regex ".*\.\(xmi\)" -print0 | while read -d $'\0' file
	do
		echo "Processing $file file..."
	    filename=$(basename "$file")
		directoryname=$(dirname "$file")
	    extension="${filename##*.}"
	    filename="${filename%.*}"
	    echo FILE: "${directoryname}/${filename}.pdf"
	    mkdir "$PROJECT_FULL_PATH/src/image/$filename"
		umbrello --export svg \
			--directory "$PROJECT_FULL_PATH/src/image/$filename" \
			"$file"
	done
	return 0;
}

function boostan_build_svg () {
	find "$PROJECT_FULL_PATH/src/image" -type f -regex ".*\.\(svg\)" -print0 | while read -d $'\0' file
	do
		echo "Processing $file file..."
	    filename=$(basename "$file")
		directoryname=$(dirname "$file")
	    extension="${filename##*.}"
	    filename="${filename%.*}"
	    echo FILE: "${directoryname}/${filename}.pdf"
	    inkscape --export-pdf="${directoryname}/${filename}.pdf" "$file"
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
	xelatex -interaction=nonstopmode -synctex=-1 main.tex
	xindy -L persian -C utf8 -I xindy -M main -t main.glg -o main.gls main.glo
	xelatex -interaction=nonstopmode -synctex=-1 main.tex
	
	#Deploy
	cp main.pdf "$BOOSTAN_WRK_DIR/output/${PROJECT_NAME}.pdf"
	
	cd "$BOOSTAN_WRK_DIR"
	return 0;
}

function boostan_build(){
	#boostan_build_svg
	#boostan_build_umbrela
	boostan_log "Trying to build the project source"
	boostan_build_src
	return 0;
}