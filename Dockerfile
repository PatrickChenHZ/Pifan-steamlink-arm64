FROM raspbian/stretch

RUN apt-get -y update && \
    apt-get -y install \
	steamlink \
	xterm \
	zenity \
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
	sudo \
	net-tools

#unlock root limit and activate external GPU        
COPY files/steamlink /usr/bin/steamlink

#unlock cpu limit
RUN mkdir -p /root/.local/share/SteamLink && \
    echo '' > /root/.local/share/SteamLink/.ignore_cpuinfo

CMD steamlink
