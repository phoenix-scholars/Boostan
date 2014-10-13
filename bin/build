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
BUILD_FILE_PATH=$(realpath $0)
PROJECT_PATH=`dirname "$BUILD_FILE_PATH"`
PROJECT_FULL_PATH=`dirname "$PROJECT_PATH"`
PROJECT_NAME=`basename "$PROJECT_FULL_PATH"`

for((i=0;i<107;i++));
do
    printf "-"
done
printf "\n"
printf "| %20s | %80s |\n" PROJECT_PATH "$PROJECT_PATH"
printf "| %20s | %80s |\n" PROJECT_FULL_PATH "$PROJECT_FULL_PATH"
printf "| %20s | %80s |\n" PROJECT_NAME  "$PROJECT_NAME"
for((i=0;i<107;i++));
do
    printf "-"
done
printf "\n"

# Clean project
rm "$PROJECT_FULL_PATH/output/*.pdf"
rm "$PROJECT_FULL_PATH/output/*.gz"

#Make Project diagrams
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

# Check the boostan styles
if [ -d "$PROJECT_PATH/boostan" ]; then
	echo "Boostan styles does not exits?!";
	exit 1;
fi

#Make new document
cd "$PROJECT_FULL_PATH/src"
xelatex -interaction=nonstopmode -synctex=-1 main.tex
xindy -L persian -C utf8 -I xindy -M main -t main.glg -o main.gls main.glo
xelatex -interaction=nonstopmode -synctex=-1 main.tex

#Deploy
cp main.pdf "$PROJECT_PATH/output/${PROJECT_NAME}.pdf"
