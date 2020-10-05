# alpine-deno

Slim Deno runtime image from scratch, currently weights only *37MB*.

### Build
```sh
docker build -t alpine-deno .
```

### Open `repl`
```sh
docker run -it --init alpine-deno deno
```

### Sample Dockerfile
```Dockerfile
FROM jveres/alpine-deno:1.4.4
EXPOSE 80
WORKDIR /app
USER deno
COPY server.ts .
CMD ["deno", "run", "-A", "server.ts"]
```