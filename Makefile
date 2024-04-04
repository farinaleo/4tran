# Makefile for fortan compilation with Docker

build: # Build the Docker image form the Dockerfile 'Docker.fortran_compiler'
	docker build -t Docker.fortran_compiler .
.PHONY: build

run: # Run the Docker image 'Docker.fortran_compiler'
	docker run -it Docker.fortran_compiler
.PHONY: run

clean: # Remove the Docker image 'Docker.fortran_compiler'
	docker rmi Docker.fortran_compiler
.PHONY: clean

help:
	@echo "build: build the docker image from the Dockerfile 'Docker.fortran_compiler'"
	@echo "run: run the docker image 'Docker.fortran_compiler'"
	@echo "clean: Remove the docker image 'Docker.fortran_compiler'"
	@echo "help: show this help message"
.PHONY: help