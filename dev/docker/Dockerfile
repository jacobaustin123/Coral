FROM ubuntu:18.04
VOLUME ["/data", "/opam"]

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y --no-install-recommends m4 make clang sudo \
    ocaml opam llvm-6.0-dev m4 cmake pkg-config aspcud ca-certificates python && \
    rm -rf /var/lib/apt/lists

RUN useradd -ms /bin/sh coral

USER coral
ENV OPAMYES 1

WORKDIR /home/coral

RUN opam init
RUN opam install llvm

WORKDIR /data

ENV CAML_LD_LIBRARY_PATH="/home/coral/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs"
ENV MANPATH="/home/coral/.opam/system/man:"
ENV PERL5LIB="/home/coral/.opam/system/lib/perl5"
ENV OCAML_TOPLEVEL_PATH="/home/coral/.opam/system/lib/toplevel"
ENV PATH="/home/coral/.opam/system/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"