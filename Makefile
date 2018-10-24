.PHONY: all clean byte native 

OCB_FLAGS = -tag bin_annot -I getopt -I src
OCB = ocamlbuild $(OCB_FLAGS)

all: native byte 

clean:
	$(OCB) -clean

native:
	$(OCB) coral.native

byte:
	$(OCB) coral.byte
