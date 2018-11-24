.PHONY: all clean byte native 

OCB_FLAGS = -tag bin_annot -I src/getopt -I src
OCB = ocamlbuild $(OCB_FLAGS)

all: native 

clean:
	$(OCB) -clean
	rm -f *.log *.out *.diff

native:
	$(OCB) coral.native

byte:
	$(OCB) coral.byte

test:
	./testall.sh