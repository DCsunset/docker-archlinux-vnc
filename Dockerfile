ARG VERSION

FROM ubuntu:${VERSION:-latest}
LABEL MAINTAINER="DCsunset"

ENV noVNC_version=1.1.0
ENV websockify_version=0.9.0

# Local debug
#COPY ./sources.list /etc/apt/
#COPY ./websockify-${websockify_version}.tar.gz /websockify.tar.gz
#COPY ./noVNC-${noVNC_version}.tar.gz /noVNC.tar.gz

# Install apps
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -yq xfce4 xfce4-goodies \
	tigervnc-standalone-server \
	chromium-browser vim wget \
	python3-numpy python3-setuptools \
	&& rm -rf /var/lib/apt/lists/*

# Install noVNC
RUN wget https://github.com/novnc/websockify/archive/v${websockify_version}.tar.gz -O /websockify.tar.gz \
	&& tar -xvf /websockify.tar.gz -C / \
	&& cd /websockify-${websockify_version} \
	&& python3 setup.py install \
	&& cd / && rm -r /websockify.tar.gz /websockify-${websockify_version} \
	&& wget https://github.com/novnc/noVNC/archive/v${noVNC_version}.tar.gz -O /noVNC.tar.gz \
	&& tar -xvf /noVNC.tar.gz -C / \
	&& cd /noVNC-${noVNC_version} \
	&& ln -s vnc.html index.html \
	&& rm /noVNC.tar.gz

COPY ./config/helpers.rc /root/.config/xfce4/
COPY ./config/chromium-WebBrowser.desktop /root/.local/share/xfce4/helpers/
COPY ./start.sh /

WORKDIR /root

EXPOSE 5900 6080

CMD [ "/start.sh" ]
