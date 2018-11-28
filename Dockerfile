FROM alpine:latest
RUN apk update
RUN apk add tor nginx
RUN rm -f /etc/tor/torrc*
COPY ./torrc /etc/tor/torrc
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./init.sh /init.sh
RUN mkdir -p /var/lib/tor
RUN chown -R root:root /var/lib/tor
ENTRYPOINT /init.sh
