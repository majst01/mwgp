FROM gcr.io/distroless/static-debian12
WORKDIR /
COPY bin/server /server
ENTRYPOINT ["/server"]
