FROM arm32v7/debian:buster

RUN apt-get -y update && apt-get -y install gnupg2 zenity && \
    echo deb http://archive.raspberrypi.org/debian/ stretch main ui >> /etc/apt/sources.list && \
    apt-key adv --fetch-keys http://archive.raspberrypi.org/debian/raspberrypi.gpg.key  && \
    apt-get -y update && \
    apt-get -y install \
	libraspberrypi0 \
        libraspberrypi-dev  \
        libraspberrypi-doc  \
        libraspberrypi-bin  \
	steamlink \
	xterm \
	curl \
	libevdev2:armhf \
	libglib2.0-0:armhf \
	libgudev-1.0-0:armhf \
	libinput10:armhf \
	libjpeg62-turbo:armhf \
	libmtdev1:armhf \
	libraspberrypi0:armhf \
	libusb-1.0-0:armhf \
	libwacom2:armhf \
	libxcb-xkb1:armhf \
	libxkbcommon0:armhf \
	libxkbcommon-x11-0:armhf \
	net-tools

#unlock root limit and allow VC4 GPU        
COPY files/steamlink /usr/bin/steamlink

#unlock cpu limit
RUN mkdir -p /root/.local/share/SteamLink && \
    echo '' > /root/.local/share/SteamLink/.ignore_cpuinfo

CMD steamlink
