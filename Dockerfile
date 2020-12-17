FROM ubuntu:18.04 as build

ENV DENO_VERSION=v1.6.1

RUN apt-get update && apt-get -y install curl unzip binutils \
        && curl -fsSL https://github.com/jveres/deno-xs/releases/download/${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip --output deno.zip \
        && unzip deno.zip \
        && chmod 777 deno \
        && mv deno /bin/deno

RUN mkdir -p /rootfs
RUN ldd /bin/deno \
         /lib/x86_64-linux-gnu/libnss*.so.* \
    | grep -o -e '\/\(usr\|lib\)[^ :]\+' \
    | sort -u | tee /rootfs.list \
 && echo /bin/deno >> /rootfs.list \
 && echo /bin/cat >> /rootfs.list

RUN cat /rootfs.list | xargs strip
RUN echo 'hosts: files dns' > /etc/nsswitch.conf
RUN echo /etc/nsswitch.conf >> /rootfs.list
RUN cat /rootfs.list | tar -T- -cphf- | tar -C /rootfs -xpf-

FROM scratch
COPY --from=build /rootfs/ /
