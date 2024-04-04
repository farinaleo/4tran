from    alpine:latest

RUN apk add --no-cache bash
RUN apk add gcc gmp isl25 libgfortran libquadmath mpc1 mpfr4 musl zlib libc-dev
RUN apk add gfortran

COPY . /app

WORKDIR /app

RUN gfortran -o hello *.f90 */*.f90

CMD ["./hello"]
