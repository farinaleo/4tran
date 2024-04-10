# Makefile for fortran compilation with Docker

ifeq ($(wildcard ./.last_dir),)
	# If it doesn't exist, set directory to ./srcs
	DIRECTORY=./srcs
else
	# If it exists, set directory to its content
	DIRECTORY=$(shell cat .last_dir)
endif

Arguments := $(filter-out $@,$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS)))



build: # Build the Docker image form the Dockerfile 'Dockerfile'
	docker build -t fortran_compiler .

.PHONY: build

run: # Run the Docker image 'Dockerfile'
	-@docker run -it --rm -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ./output:/app/output -v $(DIRECTORY):/app/srcs fortran_compiler "./exec.sh" $(Arguments) 2>/dev/null || true
.PHONY: run

enter_the_matrix:
	-@docker run -it -e DISPLAY=$$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ./output:/app/output -v $(DIRECTORY):/app/srcs fortran_compiler "bash"
copy: # Run the Docker image 'Dockerfile'
	@bash select_item.sh
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

.SILENT:
%::
	@true
