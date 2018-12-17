.PHONY: all clean byte native fn


OCB_FLAGS = -tag bin_annot -I src  -use-ocamlfind -lib unix 
OCB = ocamlbuild $(OCB_FLAGS)

all: clean native 
	./coral.native -r llvm-test.cl

fn: clean native
	./coral.native -r fn-test.cl

clean:
	$(OCB) -clean 
	rm -rf testall.log *.diff *.out main source.ll source.o source.s .ll

native:
	$(OCB) coral.native

byte:
	$(OCB) coral.byte

test: native
	./testall.sh

# Building the tarball

#TESTS = add1

#TESTFILES = $(TESTS:%=test-%.cl) $(TESTS:%=test-%.out)

#TARFILES = ast.ml codegen.ml Makefile _tags coral.ml parsesr.mly README \
        scanner.mll semant.ml testall.sh \ 
#	$(TESTFILES:%=tests/%)

#coral-llvm.tar.gz : $(TARFILES) 
#	cd .. && tar czf coral-llvm/coral-llvm.tar.gz \
# 		$(TARfILES:%=coral-llvm/%

