FROM alpine:3.18

USER root

WORKDIR /root

COPY setup.bash .

RUN sh setup.bash
