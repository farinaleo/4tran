#!/bin/sh

# Define colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to echo colored output
cecho() {
    local color="$1"
    local message="$2"
    echo
    echo -e "${color}${message}${NC}"
    echo
}

files=`find ./srcs -type f -exec ls -d {} + | grep -E .f90 | tr '\n' ' '`
m_files=`find ./srcs -type f -exec ls -d {} + | grep -E '/m_[^.]+\.f90' | tr '\n' ' '`

requirements_files=`find ./srcs -type f -exec ls -d {} + | grep -E requirement.txt`

# test if the requirements file exists

if [ -z "$requirements_files" ]; then
  cecho "$RED" "---- No requirements file found ----"
else
  cecho "$GREEN" "---- Requirements ----"
  for filepath in $requirements_files; do
    if [ -e "$filepath" ]; then
        cat "$filepath" | tr ' ' '\n'
    else
         cecho "$RED" "File not found: $filepath"
    fi  
  done
  while IFS= read -r line; do
      # get the content of the file and install each package if the line does not start with #
      if [[ ! $line == \#* ]]; then
        cecho "$YELLOW" "---- Installing $line ----"
        apk add --no-cache $line
      fi
  done < $requirements_files
fi

if [ -z "$files" ]; then
  cecho "$RED" "---- No fortran files found ----"
  exit 0
fi
if [ -z "$m_files" ]; then
  cecho "$RED" "---- No fortran module files found ----"
else
  cecho "$GREEN" "---- Used Modules ----"
  for filepath in $m_files; do
    # Get the filename without the directory
    filename=$(basename "$filepath")
    
    # Remove the extension
    filename_no_ext="${filename%.*}"
    
    echo "$filename_no_ext"
  done
  gfortran -ffree-line-length-none -c $m_files
fi
gfortran -ffree-line-length-none -o fortran_exec $files
if [ -z "./fortran_exec" ]; then
 cecho "$RED" "---- Compilation failed ----"
fi
cecho "$GREEN" "---- Execution ----"
./fortran_exec "$@"
cecho "$GREEN" "---- End of Execution ----"
# cat
#gnuplot -persist -e plot data.dat with lines
# cp fortran_exec