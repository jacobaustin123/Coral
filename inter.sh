#!/bin/bash
llc $1 -o source.s && gcc source.s -o main && ./main
