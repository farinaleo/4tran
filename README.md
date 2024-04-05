# Docker 4tran Compiler

Welcome to the Docker 4tran Compiler project! This repository provides a Docker image configured with a Fortran compiler, enabling you to compile and run Fortran code in a hassle-free environment.

## Features

- Pre-configured Docker image with Fortran compiler.
- Easy setup and usage.
- Compatible with various Fortran projects and environments.

## Usage

1. **Install Docker**: Make sure Docker is installed on your system. If not, you can download it from [Docker's official website](https://www.docker.com/get-started).

2. **Create the Docker image**: Pull the Docker image by running the following command:

    ```bash
    make
    ```
3. **Add your code to the srcs folder**

4. **Input your project path**: Once the image is created, you can change the default project location (./srcs by default) with:

   ```bash
    make copy
    ```

5. **Run the Docker container**: Once the image is created, you can run a Docker container with the Fortran compiler using the following command and it will output the code result:

    ```bash
    make run
    ```

## Documentation
- Quickstart: https://fortran-lang.org/learn/quickstart/

## Contributing

Contributions are welcome! If you encounter any issues, have suggestions, or want to contribute enhancements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- Thanks to the creators of Docker for providing an amazing platform.
- Thanks to the Fortran community for their continuous support and contributions.
