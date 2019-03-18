INPUT_FILE='demoUnsearchable.pdf'
OUTPUT_FILE='demoSearchable.pdf'

echo 'quit()' | gs -dNOPAUSE -sDEVICE=jpeg -r144 -sOutputFile=p%03d.jpg ${INPUT_FILE}

for i in $(ls | egrep -i 'p...\.jpg'); do
 echo item: $i;
 tesseract $i out pdf
 mv out.pdf "${i//jpg/pdf}"
done

echo 'quit()' | gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=${OUTPUT_FILE} p[0-9][0-9][0-9].pdf
rm p[0-9][0-9][0-9].pdf
rm p[0-9][0-9][0-9].jpg
