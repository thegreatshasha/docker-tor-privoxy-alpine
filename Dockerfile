FROM alpine:edge

EXPOSE 8118 9050

RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' \
    >> /etc/apk/repositories && \
    apk --update add privoxy tor@testing runit@testing

RUN apk add --update bash && rm -rf /var/cache/apk/*
#RUN apk add openssh
#RUN rc-update add sshd
#RUN /etc/init.d/sshd start

COPY service /etc/service/

CMD ["runsvdir", "/etc/service"]
