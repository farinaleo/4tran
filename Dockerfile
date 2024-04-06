FROM alpine:latest

RUN apk add --no-cache bash gcc gmp isl25 libgfortran libquadmath mpc1 mpfr4 musl zlib libc-dev gfortran
RUN apk add --no-cache gcc gfortran make cmake gnuplot gcc g++ libtool make automake \
        autoconf cairo-dev pango-dev gd-dev lua-dev readline-dev libpng-dev libjpeg-turbo-dev libwebp-dev

WORKDIR /app

VOLUME /app/srcs

VOLUME /app/output

COPY exec.sh .

RUN chmod 777 exec.sh