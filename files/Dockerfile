FROM debian:latest
MAINTAINER builder_live_clamav
RUN apt update
RUN apt install -y clamtk live-build
RUN mkdir -m 0777 /shared
COPY ./logo.svg /var/logo.svg
COPY ./logo.png /var/logo.png
COPY ./docker_entrypoint.sh /docker_entrypoint.sh
COPY ./shortcuts /shortcuts
ENTRYPOINT ["sh", "/docker_entrypoint.sh"]

