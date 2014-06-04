all:cl
	for ifile in images/*.png; do \
		convert $$ifile $${ifile%.*}.eps; \
	done
	./paper
	ruby genonepage.rb
	platex    -kanji=euc jointry
	pbibtex   -kanji=euc jointry
	platex    -kanji=euc jointry
	platex    -kanji=euc jointry
	dvipdfmx  -f hiragino.map -p a4 jointry
	open jointry.pdf
cl:
	/bin/rm -f *~ *.log *.dvi *.blg *.aux *.out *.bbl *.pdf .\!* .\#* jointry.tex mask.tex

mask:cl
	for ifile in images/*.png; do \
		convert $$ifile $${ifile%.*}.eps; \
	done
	./paper
	ruby genonepage.rb mask
	platex    -kanji=euc mask
	pbibtex   -kanji=euc mask
	platex    -kanji=euc mask
	platex    -kanji=euc mask
	dvipdfmx  -f hiragino.map -p a4 mask
	open mask.pdf
