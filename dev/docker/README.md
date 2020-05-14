This directory contains a Dockerfile for an image that is capable of building
Coral. To build the image, run the following command:

```
$ docker build -t coral-build .
```

To build coral using the image, run the following:

```
$ docker run -v $(pwd):/data -w /data --rm -t coral-build make
```
