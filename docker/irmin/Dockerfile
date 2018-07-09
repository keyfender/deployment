FROM alpine

EXPOSE 8443 8080
RUN set -ex ;\
    apk add --no-cache --purge -U \
       opam sudo make bash gcc musl-dev \
       gmp gmp-dev libressl-dev linux-headers m4 perl zlib-dev ;\
    adduser -D irmin ;\
    mkdir /data ;\
    chown irmin /data ;\
    export OPAMYES=1 ;\
    opam init ;\
    opam switch 4.06.1 ;\
    eval $(opam config env) ;\
    opam update ;\
    opam install irmin-unix ;\
    mv ~/.opam/4.06.1/bin/irmin / ;\
    apk del opam make bash gcc musl-dev gmp-dev libressl-dev \
       linux-headers m4 perl zlib-dev ;\
    rm -rf /var/cache/apk/* ;\
    rm -rf ~/.opam
USER irmin
WORKDIR /home/irmin
ENTRYPOINT [ "/irmin" ]
VOLUME /data
CMD [ "init", \
      "-a", "http://0.0.0.0:8080", \
      "-d", \
      "--verbosity=info", \
      "-s", "git", \
      "--root", "/data" \
    ]
