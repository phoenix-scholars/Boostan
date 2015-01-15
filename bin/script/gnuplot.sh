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

BOOSTAN_TOOL_GNUPLOT=gnuplot
BOOSTAN_TOOL_GNUPLOT_EXIST=false
BOOSTAN_TOOL_GNUPLOT_NEED=false

#
# بررسی برنامه‌های gnuplot
#
# برای کار با این پروژها باید مجموعه‌ای از ابزارها در سیستم نصب شده باشد. در اینجا
# بررسی می‌کنیم که این ابزارها نصب شده باشد.
#
#
# \return مقدار 0 اگر ابزارها موجود باشد و 1 اگر این ابزارها وجود نداشته باشد.
#
function boostan_gnuplot_check() {
	BOOSTAN_TOOL_GNUPLOT_NEED=false
	if ! hash "$BOOSTAN_TOOL_GNUPLOT" 2>/dev/null; then
		BOOSTAN_TOOL_GNUPLOT_EXIST=false
		boostan_log "Boostan require %s but it's not installed." "$BOOSTAN_TOOL_GNUPLOT"
	else
		BOOSTAN_TOOL_GNUPLOT_EXIST=true
		boostan_log "Boostan use %s and it's installed." "$BOOSTAN_TOOL_GNUPLOT"
	fi
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(plot\)" -print0 | while read -d $'\0' file
	do
		BOOSTAN_TOOL_GNUPLOT_NEED=true
		if [ "$BOOSTAN_TOOL_GNUPLOT_EXIST" = "true" ]; then
			boostan_log "Boostan requires %s and it's installed." "$BOOSTAN_TOOL_GNUPLOT"
			return 0
		else
			boostan_error "Boostan requires %s but it's not installed." "$BOOSTAN_TOOL_GNUPLOT"
			return 1
		fi
	done
	BOOSTAN_TOOL_GNUPLOT_NEED=false
	boostan_log "Boostan does not require %s in the %s." "$BOOSTAN_TOOL_GNUPLOT" "$1"
	return 0
}

# 
# نمودارها را ایجاد می‌کند
#
# \param $1 مسیر جستجو و تولید نمودارها
#
function boostan_gnuplot_build() {
	boostan_log "Looking for umbrella files in \'%s\'" "$BOOSTAN_WRK_DIR/$1"
	if [ ! -d "$BOOSTAN_WRK_DIR/$1" ]; then
		boostan_log "The path not exist \'%s\'" "$BOOSTAN_WRK_DIR/$1"
		return 1;
	fi
	find "$BOOSTAN_WRK_DIR/$1" -type f -regex ".*\.\(plot\)" -print0 | while read -d $'\0' file
	do
		boostan_log "Processing %s file..." "$file"
	    filename=$(basename "$file")
		directoryname=$(dirname "$file")
	    extension="${filename##*.}"
	    filename="${filename%.*}"
	    echo FILE: "${directoryname}/${filename}.pdf"
	    mkdir "$BOOSTAN_WRK_DIR/$1/$filename"
		gnuplot "$file"
	done
	return 0;
}

function boostan_gnuplot_clean () {
	return 0;
}
