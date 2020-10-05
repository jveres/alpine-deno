# alpine-deno

Alpine Linux (`frolvlad/alpine-glibc:alpine-3.11_glibc-2.31`) based Deno image which is less than 65MB in size.

### Open `repl`
```sh
docker run -it --init jveres/alpine-deno:latest repl
```

### Sample Dockerfile
```Dockerfile
FROM jveres/alpine-deno:1.4.4
EXPOSE 80
WORKDIR /app
USER deno
COPY server.ts .
CMD ["run","--allow-net", "server.ts"]
```