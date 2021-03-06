FROM docker:stable AS docker-cli

FROM alpine

COPY --from=docker-cli /usr/local/bin/docker /usr/local/bin/docker

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
