FROM alpine:latest

RUN apk add --no-cache bash gcc gmp isl25 libgfortran libquadmath mpc1 mpfr4 musl zlib libc-dev gfortran

WORKDIR /app

COPY . .


RUN find srcs -type f -exec ls -d {} + | grep -E .f90 | tr '\n' ' ' > files.txt


RUN gfortran -o fortran_exec $(cat files.txt)

VOLUME /app/output

CMD cp fortran_exec /app/output