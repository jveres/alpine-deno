FROM ubuntu:18.04

ENV DENO_VERSION=1.4.4

RUN apt-get update && apt-get -y install curl unzip binutils \
        && curl -fsSL https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip --output deno.zip \
        && unzip deno.zip \
        && chmod 777 deno \
        && mv deno /bin/deno

RUN mkdir -p /rootfs
RUN ldd /bin/deno \
        /lib/x86_64-linux-gnu/libnss_files.so.* \
        /lib/x86_64-linux-gnu/libnss_dns.so.* \
    | grep -o -e '\/\(usr\|lib\)[^ :]\+' \
    | sort -u | tee /rootfs.list \
 && echo /bin/deno >> /rootfs.list

RUN cat /rootfs.list | xargs strip
RUN cat /rootfs.list | tar -T- -cphf- | tar -C /rootfs -xpf-

FROM scratch
COPY --from=0 /rootfs/ /