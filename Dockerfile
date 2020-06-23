FROM alpine:3.11

RUN apk add --no-cache bash curl jq findutils base64

ADD entrypoint.sh /entrypoint.sh
ADD src /src

ENTRYPOINT ["/entrypoint.sh"]
