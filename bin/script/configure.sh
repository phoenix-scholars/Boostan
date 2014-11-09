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

BOOSTAN_VERSION=trunk
BOOSTAN_REPO_PATH=https://github.com/phoenix-scholars/Boostan


BOOSTAN_BIN_DIR=$BOOSTAN_INS_DIR/bin
BOOSTAN_DOC_DIR=$BOOSTAN_INS_DIR/doc
BOOSTAN_STY_DIR=$BOOSTAN_INS_DIR
BOOSTAN_WRK_DIR=$PWD
BOOSTAN_SRC_DIR=$BOOSTAN_WRK_DIR/src
BOOSTAN_TMP_DIR=$BOOSTAN_WRK_DIR/tmp
BOOSTAN_OUT_DIR=$BOOSTAN_WRK_DIR/output

BOOSTAN_COMMAND=
BOOSTAN_VERBOSE=false

PROJECT_NAME=`basename "$BOOSTAN_WRK_DIR"`
 
while getopts ":c:vV" opt; do
	case $opt in
		c)
			BOOSTAN_COMMAND=$OPTARG
			boostan_log "The command is : %s"  "$OPTARG"
			;;
		V)
			BOOSTAN_VERBOSE=true
			boostan_log "The verbose mode is active"
			;;
		v)
			BOOSTAN_COMMAND=version
			boostan_log "The command is set to version"
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done



function boostan_configure_print(){
	boostan_log_print_header "Here is the configuration table"
	boostan_log_print BOOSTAN_WRK_DIR "$BOOSTAN_WRK_DIR"
	boostan_log_print BOOSTAN_STY_DIR "$BOOSTAN_STY_DIR"
	boostan_log_print PROJECT_NAME  "$PROJECT_NAME"
	boostan_log_print_footer
}