# slim-deno

Minimal Deno runtime image from scratch, currently weights only *37MB*.

### Build
```sh
docker build -t slim-deno .
```

### Open `repl`
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
