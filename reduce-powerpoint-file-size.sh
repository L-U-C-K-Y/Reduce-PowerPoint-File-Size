#!/bin/bash

if [[ -z $1 ]]; then echo $0 input_pptx [output_pptx]; exit; fi
if [[ ! -f $1 ]]; then echo File $1 not found; exit; fi
if [[ -z $2 ]]; then out=${1/.pptx/-compressed.pptx}; else out=$2; fi

[[ -d xtractd ]] && rm -i -r xtractd
[[ -f $out ]] && rm -i "$out"

# uncompress poiwerpoint
unzip "$1" -d xtractd

cd xtractd/ppt/media

# convert tiff to png
for x in *.tiff; do sips -s format png $x --out ${x/.tiff/.png}; done

# remove tiff
rm *.tiff

# resize images to 1920
sips -Z 1920 *.png
sips -Z 1920 *.jpg

# compress images
/Applications/ImageOptim.app/Contents/MacOS/ImageOptim *.png *.jpg *.jpeg *.svg

cd ..

# link png files
sed -i '' -e 's/\(Target="[^"]*\)tiff"/\1png"/g' slides/_rels/*.rels
# sed -i '' -e 's/\(typeface="\)[^"]*"/\1Calibri"/g' slides/*.xml notesSlides/*.xml slideLayouts/*.xml slideMasters/*.xml

cd ..

# compress folder again
zip -r "../$out" *

cd ..

# remove uncompressed folder
rm -r xtractd

# open the file
# open "$out"