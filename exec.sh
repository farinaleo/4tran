#!/bin/sh

find ./srcs -type f -exec ls -d {} + | grep -E .f90 | tr '\n' ' ' > files.txt
gfortran -o fortran_exec $(cat files.txt)
./fortran_exec
cp fortran_exec /app/output