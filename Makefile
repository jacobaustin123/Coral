.PHONY: all clean byte native fn

OCB_FLAGS = -tag bin_annot -I src  -use-ocamlfind -lib unix 
OCB = ocamlbuild $(OCB_FLAGS)

all: clean native 
	./coral test.cl

clean:
	$(OCB) -clean
	rm -f a.out main *.ll *.s *.out *.log *.diff coral

native:
	$(OCB) coral.native
	mv coral.native coral 

byte:
	$(OCB) coral.byte

test: native
	./testall.sh

install: native
	cp coral /usr/local/bin/coral
