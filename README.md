# docker-base-node

Base image for Mantigma's node projects.

## Usage

For a simple node application that follows the standard pattern the following Dockerfile is sufficient:

```
FROM mantigma/base-node:7
```

The expected structure is a ```package.json``` specifying the dependencies and a working ```npm run``` configuration
to start the application.

The base image's ONBUILD will handle the heavy lifting.

## Customizing

Further start time configuration can be done via a application specific entry point script. It is expected to be
at ```/entrypoint-app.sh```.

## Building

For the build process [rocker](https://github.com/grammarly/rocker) is required.

```
# A single node version
rocker build -var NodeVersion=0.12

# All supported versions
./generate.sh
```
