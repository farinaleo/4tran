FROM alpine:latest

RUN apk add --no-cache bash gcc gmp isl25 libgfortran libquadmath mpc1 mpfr4 musl zlib libc-dev gfortran

WORKDIR /app

COPY . .

RUN mkdir /output \
    && gfortran -o /output/hello *.f90

VOLUME /output

CMD ["./output/hello"]