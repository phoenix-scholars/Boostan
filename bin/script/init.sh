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

function boostan_init_create_skelaton() {
	project_dirs=(\
		attach \
		src \
		src/image \
		tmp \
		output \
	)
	for project_dir in ${project_dirs[*]}
	do
		if [ -d "$BOOSTAN_WRK_DIR/$project_dir" ]; then
			boostan_log "The \"%s\" is created before, try update command." "$project_dir"
		else
			mkdir -p "$BOOSTAN_WRK_DIR/$project_dir"
			boostan_log "%s is created." "$project_dir"
		fi
	done
	project_files=(\
		README \
		LICENSE \
		src/main.tex \
	)
	for project_file in ${project_files[*]}
	do
		if [ -f "$BOOSTAN_WRK_DIR/$project_file" ];
		then
			boostan_log "%s is created before, try update command." "$project_file"
		else
			touch "$BOOSTAN_WRK_DIR/$project_file"
			boostan_log "%s is created." "$project_file" 
		fi
	done
}

# Check the Boostan styles and tools
function boostan_init_checkout(){
	tools_path=(boostan boostan-en bin)
	for tool_path in ${tools_path[*]}
	do
		if [ -d "$tool_path" ]; then
			boostan_log "$tool_path" "$tool_path exist, please try update command."
		else
			svn checkout $BOOSTAN_REPO_PATH/$BOOSTAN_VERSION/$tool_path
			boostan_log "$tool_path" "$tool_path is checked out."
			rm -fR $tool_path/.svn
		fi
	done
}


function boostan_init(){
	boostan_init_create_skelaton
	boostan_init_checkout
}