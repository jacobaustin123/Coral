#!/bin/bash
./coral.native -c $1 > source.ll && llc source.ll -o source.s && gcc source.s -o main && echo "=======" && ./main
