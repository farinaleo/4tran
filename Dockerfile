FROM alpine:latest

RUN apk add --no-cache bash gcc gmp isl25 libgfortran libquadmath mpc1 mpfr4 musl zlib libc-dev gfortran

WORKDIR /app

VOLUME /app/srcs

VOLUME /app/output

COPY exec.sh .

RUN chmod 777 exec.sh