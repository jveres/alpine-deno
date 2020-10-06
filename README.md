# slim-deno

Minimal Deno runtime image from scratch.

![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/jveres/slim-deno)

### Build
```sh
docker build -t slim-deno .
```

### Opening Deno `repl`
```sh
docker run -it --init slim-deno deno
```

### Sample Dockerfile
```Dockerfile
FROM jveres/slim-deno:1.4.4
EXPOSE 80
COPY server.ts .
CMD ["deno", "run", "-A", "server.ts"]
```
