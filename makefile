######################
#      Makefile      #
######################

include .env
filename=${FILENAME}
base-info= \
\def\foo{${FOO}} \

make: pdf clean-tmp

pdf: 
	xelatex "${base-info}\input{${filename}}"
	xelatex "${base-info}\input{${filename}}"

word-count:
	pandoc ${filename}.tex -t plain -o ${filename}.txt
	tr -d '\r\n -' < ${filename}.txt | wc -m > ${filename}-wordcount.txt

clean-tmp:
	rm -f *.log *.aux *.out *.dvi *.bbl *.blg *.snm *.toc *.nav

clean:
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg,snm,toc,nav}