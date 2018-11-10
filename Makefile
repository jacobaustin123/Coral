.PHONY: all clean byte native 

OCB_FLAGS = -tag bin_annot -I src/getopt -I src -use-ocamlfind
OCB = ocamlbuild $(OCB_FLAGS)

all: native 
	./comp.sh llvm-test.cl

clean:
	$(OCB) -clean

native:
	$(OCB) coral.native

byte:
	$(OCB) coral.byte
