#!/bin/bash
llc source.ll -o source.s && gcc source.s -o main
