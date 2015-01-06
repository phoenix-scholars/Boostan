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

# Check the Boostan styles and tools
function boostan_update(){
	tools_path=(boostan boostan-en)
	for tool_path in ${tools_path[*]}
	do
		if [ -d "$tool_path" ]; then
			boostan_log "%s exist, trying to update." "$tool_path"
			rm -fR "$tool_path"
		else
			boostan_log "%s does not exist, try to create new one." "$tool_path"
		fi
		svn checkout $BOOSTAN_REPO_PATH/$BOOSTAN_VERSION/$tool_path
		boostan_log "%s is checked out." "$tool_path"
		rm -fR $tool_path/.svn
	done
	return 0;
}

