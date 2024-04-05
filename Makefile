# Makefile for fortran compilation with Docker

ifeq ($(wildcard ./.last_dir),)
	# If it doesn't exist, set directory to ./srcs
	DIRECTORY=./srcs
else
	# If it exists, set directory to its content
	DIRECTORY=$(shell cat .last_dir)
endif

build: # Build the Docker image form the Dockerfile 'Dockerfile'
	docker build -t fortran_compiler .

.PHONY: build

run: # Run the Docker image 'Dockerfile'
	@docker run -it --rm -v ./output:/app/output -v $(DIRECTORY):/app/srcs fortran_compiler "./exec.sh"
.PHONY: run

copy: # Run the Docker image 'Dockerfile'
	@echo -n "Enter directory path: "
	bash select_item.sh
	@echo "Directory path saved"
	@cat ./.last_dir
.PHONY: copy

clean: # Remove the Docker image 'Dockerfile'
	docker rmi -f fortran_compiler
.PHONY: clean

help:
	@echo "build: build the docker image from the Dockerfile 'Dockerfile'"
	@echo "run: run the docker image 'fortran_compiler'"
	@echo "clean: Remove the docker image 'fortran_compiler'"
	@echo "help: show this help message"
.PHONY: help
