from    alpine:latest

RUN apk add --no-cache bash
RUN apk add gcc gmp isl25 libgfortran libquadmath mpc1 mpfr4 musl zlib libc-dev
RUN apk add gfortran

COPY . /app

WORKDIR /app

VOLUME ./compiled_projects

RUN find . -type f -exec ls -d {} + | grep .f90 | tr '\n' ' ' > files.txt

RUN echo coucou
RUN echo $(cat files.txt)

RUN gfortran -o compiled_project $(cat files.txt)

RUN cp compiled_project ./compiled_projects

CMD ["./compiled_project"]
