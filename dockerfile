FROM alpine:3.6 as alpine

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
RUN apk add -U --no-cache ca-certificates

# ADD cacert.pem /usr/local/share/ca-certificates/foo.crt
COPY cert.cer /etc/ssl/certs/
RUN  update-ca-certificates

# FROM scratch
# COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs