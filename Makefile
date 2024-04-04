# Makefile for fortan compilation with Docker

ifndef SRC_DIR
SRC_DIR = ./srcs
endif

build: # Build the Docker image form the Dockerfile 'Dockerfile'
	docker build -t fortran_compiler .

.PHONY: build

run: # Run the Docker image 'Dockerfile'
	@docker run --rm -v ./output:/app/output -v $(SRC_DIR):/app/srcs fortran_compiler "./exec.sh"
.PHONY: run

.PHONY: compile

clean: # Remove the Docker image 'Dockerfile'
	docker rmi -f fortran_compiler
.PHONY: clean

help:
	@echo "build: build the docker image from the Dockerfile 'Dockerfile'"
	@echo "run: run the docker image 'fortran_compiler'"
	@echo "clean: Remove the docker image 'fortran_compiler'"
	@echo "help: show this help message"
.PHONY: help
