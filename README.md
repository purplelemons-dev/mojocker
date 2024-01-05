# Mojocker

mojocker is a [docker](https://www.docker.com/get-started/) container for [Mojo](https://docs.modular.com/mojo/)!

Your code will appear in a directory of your choice, whether by development in mojocker and then exporting, or importing prexisting code.

mojocker runs python 3.11 and is hosted on debian 12 bookworm *slim*

the entire container is [~1.76GB](https://www.wolframalpha.com/input?i=1.76GB).

## Install

### Install with
```bash
docker pull purplelemons/mojocker:latest
```

### Run with
```bash
docker run -it -v < local dir >:/opt/mojocker purplelemons/mojocker
```
You can add `--rm` in the arguments to automatically delete the container (but not your code) when 

## Build

### Get
```bash
git clone https://github.com/purplelemons-dev/mojocker && \
cd mojocker
```

&nbsp;

### Build
```bash
docker compose build
```

### *or*

### Compose and run
```bash
docker compose run -i -v < local dir >:/opt/mojocker --build
```
