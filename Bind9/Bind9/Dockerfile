FROM alpine:3.12

MAINTAINER gnuhurd <sinagamenet@gmail.com>

RUN apk --update add bind bind-dnssec-tools

EXPOSE 53

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
