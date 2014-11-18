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

# Clean ODG
function boostan_clean_odg () {
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(odg\)" -print0 | while read -d $'\0' file
	do
		boostan_log "Processing \'%s\' file..." $file
		filename=$(basename "$file")
		directoryname=$(dirname "$file")
		extension="${filename##*.}"
		filename="${filename%.*}"
		boostan_log "The output of the input odg file is stored in \'%s\'" "${directoryname}/${filename}.pdf"
		rm -f "${directoryname}/${filename}.pdf"
	done
	return 0;
}

#clean svg
function boostan_clean_svg () {
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(svg\)" -print0 | while read -d $'\0' file
	do
	    filename=$(basename "$file")
		directoryname=$(dirname "$file")
	    extension="${filename##*.}"
	    filename="${filename%.*}"
	    boostan_log "Try to delete the file \'%s\'." "${directoryname}/${filename}.ps"
	    rm -f "${directoryname}/${filename}.ps"
	done
	return 0;
}

# Clean project
function boostan_clean_project(){
	boostan_log "Trying to clean the output directory (%s)" "$BOOSTAN_OUT_DIR"
	cd "$BOOSTAN_OUT_DIR"
	rm -fR ./*
	
	boostan_log "Trying to clean the temp directory (%s)" "$BOOSTAN_TMP_DIR"
	cd "$BOOSTAN_TMP_DIR"
	rm -fR ./*
	
	cd "$BOOSTAN_WRK_DIR"
	return 0;
}


function boostan_clean_src() {
	# Check the boostan styles
	if [ ! -d "$BOOSTAN_WRK_DIR/boostan" ]; then
		echo "Boostan styles does not exits?!";
		boostan_log "Boostan styles does not exits in the path (%s)" "$BOOSTAN_WRK_DIR/boostan"
		return 1;
	fi
	
	#Make new document
	cd "$BOOSTAN_SRC_DIR"
	rm -f \
		*.acn \
		*.aux \
		*.bbl \
		*.blg \
		*.idx \
		*.ilg \
		*.ind \
		*.glg \
		*.glo \
		*.gls \
		*.idx \
		*.xdy \
		*.log \
		*.out \
		*.toc \
		*.synctex.gz \
		main.pdf
		
	cd "$BOOSTAN_WRK_DIR"
	return 0;
}

function boostan_clean(){
	boostan_clean_project
	boostan_clean_odg image
	boostan_clean_odg src/image
	boostan_clean_odg attach
	boostan_clean_svg image
	boostan_clean_svg src/image
	boostan_clean_svg attach
	boostan_clean_src
	return 0;
}