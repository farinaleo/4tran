# Docker 4tran Compiler

Welcome to the Docker Fortran Compiler project! This repository provides a Docker image configured with a Fortran compiler, enabling you to compile and run Fortran code in a hassle-free environment.

## Features

- Pre-configured Docker image with Fortran compiler.
- Easy setup and usage.
- Compatible with various Fortran projects and environments.

## Usage

1. **Install Docker**: Make sure Docker is installed on your system. If not, you can download it from [Docker's official website](https://www.docker.com/get-started).

2. **Pull the Docker image**: Pull the Docker image by running the following command:

    ```bash
    docker pull yourusername/fortran-compiler:latest
    ```

3. **Run the Docker container**: Once the image is downloaded, you can run a Docker container with the Fortran compiler using the following command:

    ```bash
    docker run -it --rm -v /path/to/your/fortran/code:/code yourusername/fortran-compiler:latest
    ```

    Replace `/path/to/your/fortran/code` with the path to your Fortran code directory.

4. **Compile your Fortran code**: Inside the Docker container, navigate to the `/code` directory and compile your Fortran code using the appropriate compiler commands.

5. **Run your Fortran executable**: After compiling, you can run your Fortran executable directly from the Docker container.

## Documentation
- Quickstart: https://fortran-lang.org/learn/quickstart/

## Contributing

Contributions are welcome! If you encounter any issues, have suggestions, or want to contribute enhancements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- Thanks to the creators of Docker for providing an amazing platform.
- Thanks to the Fortran community for their continuous support and contributions.
