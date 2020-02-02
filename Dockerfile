ARG VERSION

FROM ubuntu:${VERSION:-latest}
LABEL MAINTAINER="DCsunset"

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -yq xfce4 xfce4-goodies \
	tigervnc-standalone-server \
	chromium-browser vim

COPY ./config/helpers.rc /root/.config/xfce4/
COPY ./config/chromium-WebBrowser.desktop /root/.local/share/xfce4/helpers/
COPY ./start.sh /

EXPOSE 5900 80

CMD [ "/start.sh" ]
