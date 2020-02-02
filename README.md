# docker-ubuntu-vnc

An Ubuntu docker image to provide VNC access to
Xfce desktop environment.

## Usage

```
docker run -d -p 5900:5900 -e VNC_PASSWD=password dcsunset/ubuntu-vnc
```

If `VNC_PASSWD` is not set,
then the security type of vncserver is set to None,
it is **insecure** when exposing the container on the Internet.

## Exposed ports

* 5900: Used for VNC interface

## Installed applications

To make the image lightweight,
only the following applications are installed by default:

* Xfce desktop
* TigerVNC server
* Vim
* Chromium browser

## Fonts

If non-latin characters are not displayed well,
install the font packs based on your needs.

To install the Indian font pack:

```
sudo apt-get install fonts-indic
```

To install the CJK font pack:

```
sudo apt-get install fonts-noto-cjk
```

To install the international font pack:

```
sudo apt-get install fonts-noto
```

## Build

To use the latest Ubuntu image:

```
docker build -t ubuntu-vnc .
```

Or specify a version:

```
docker build --build-arg VERSION=18.04 -t ubuntu-vnc .
```
