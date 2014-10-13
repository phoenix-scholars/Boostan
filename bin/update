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
TOOL_PATH=$(realpath $0)

PROJECT_PATH=`pwd`
PROJECT_FULL_PATH=`dirname "$PROJECT_PATH"`
PROJECT_NAME=`basename "$PROJECT_FULL_PATH"`

BOOSTAN_VERSION=trunk
BOOSTAN_REPO_PATH=https://github.com/phoenix-scholars/Boostan

function printLog(){
	printf "| %20s | %110s |\n" "$1" "$2"
}

function printLogTitle(){
	for((i=0;i<137;i++));
	do
	    printf "-"
	done
	printf "\n"
}

function printLogFooter(){
	for((i=0;i<137;i++));
	do
	    printf "-"
	done
	printf "\n"
}

function printConfigurations(){
	printLogTitle
	printLog PROJECT_PATH "$PROJECT_PATH"
	printLog PROJECT_FULL_PATH "$PROJECT_FULL_PATH"
	printLog PROJECT_NAME  "$PROJECT_NAME"
	printLogFooter
}

# Check the Boostan styles and tools
function updateTools(){
	currentPath=`pwd`
	tools_path=(boostan boostan-en)
	for tool_path in ${tools_path[*]}
	do
		if [ -d "$tool_path" ]; then
			printLog "$tool_path" "$tool_path exist, and we try to update."
			rm -fR "$tool_path"
		else
			printLog "$tool_path" "$tool_path does not exist, try to create new one."
		fi
		svn checkout $BOOSTAN_REPO_PATH/$BOOSTAN_VERSION/$tool_path
		printLog "$tool_path" "$tool_path is checked out."
		rm -fR $tool_path/.svn
	done
	cd "$curentPath"
}

printConfigurations
updateTools
