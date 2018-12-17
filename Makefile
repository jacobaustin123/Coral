.PHONY: all clean byte native 

OCB_FLAGS = -tag bin_annot -I src  -use-ocamlfind -lib unix 
OCB = ocamlbuild $(OCB_FLAGS)

all: native 

clean:
	$(OCB) -clean
	rm -f *.log *.out *.diff main source.*

native:
	$(OCB) coral.native

byte:
	$(OCB) coral.byte

test: native
	./testall.sh
