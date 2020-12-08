# deno-xsim

Minimal Deno runtime container image.

![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/jveres/deno-xsim)

### Build
```sh
docker build -t deno-xsim .
```

### Deno `repl`
```sh
docker run -it --rm --init deno-xsim deno
```

### Sample Dockerfile
```Dockerfile
FROM jveres/deno-xsim:latest
EXPOSE 80
COPY server.ts .
CMD ["deno", "run", "-A", "server.ts"]
```
