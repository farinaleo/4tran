#!/bin/sh

files=`find ./srcs -type f -exec ls -d {} + | grep -E .f90 | tr '\n' ' '`
m_files=`find ./srcs -type f -exec ls -d {} + | grep -E '/m_[^.]+\.f90' | tr '\n' ' '`

requirements_files=`find ./srcs -type f -exec ls -d {} + | grep -E requirement.txt`

# test if the requirements file exists

if [ -z "$requirements_files" ]; then
  echo "---- No requirements file found ----"
else
  while IFS= read -r line; do
      # get the content of the file and install each package if the line does not start with #
      if [[ ! $line == \#* ]]; then
        echo "---- Installing $line ----"
        apk add --no-cache $line
      fi
  done < $requirements_files
fi

if [ -z "$files" ]; then
  echo "---- No fortran files found ----"
  exit 0
fi
gfortran -c $m_files
gfortran -ffree-line-length-none -o fortran_exec $files
./fortran_exec $@
cat
#gnuplot -persist -e plot data.dat with lines
cp fortran_exec