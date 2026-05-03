FROM gcr.io/distroless/static-debian13
WORKDIR /
COPY bin/server /server
ENTRYPOINT ["/server"]
