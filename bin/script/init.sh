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

function boostan_init_create_skelaton() {
	project_dirs=(\
		image \
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
	return 0;
}

# Create the template project
function boostan_init_apply_template(){
	# Check the source folder
	if [ -d "$BOOSTAN_SRC_DIR" ]; then
		return 0;
		boostan_log "The source folder exist."
	fi
	mkdir -p "$BOOSTAN_SRC_DIR"
	# Check the template
	if [ ! -d "$BOOSTAN_TEM_DIR/$BOOSTAN_TEMPLATE" ]; then
		boostan_log "The template \'%s\' does not exist" "$BOOSTAN_TEMPLATE"
		return 1;
	fi
	# copy the project template
	boostan_log "Sync the \'%s\' with the \'%s\'" \
		"$BOOSTAN_SRC_DIR"  \
		"$BOOSTAN_TEM_DIR/$BOOSTAN_TEMPLATE" 
	rsync -rt \
		"$BOOSTAN_TEM_DIR/$BOOSTAN_TEMPLATE/" \
		"$BOOSTAN_SRC_DIR/"
	return 0;
}

# Check the Boostan styles and tools
function boostan_init_checkout(){
	tools_path=(boostan boostan-en)
	for tool_path in ${tools_path[*]}
	do
		if [ -d "$tool_path" ]; then
			boostan_log "$tool_path" "$tool_path exist, please try update command."
		else
			#mkdir -p "$BOOSTAN_WRK_DIR/$tool_path"
			cp -fR "$BOOSTAN_INS_DIR/$tool_path" "$BOOSTAN_WRK_DIR/$tool_path"
		fi
	done
	return 0;
}


function boostan_init(){
	boostan_init_create_skelaton
	boostan_init_apply_template
	boostan_init_checkout
	return 0;
}