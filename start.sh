#!/bin/bash

umask 0077                # use safe default permissions
mkdir -p "$HOME/.vnc"     # create config directory
chmod go-rwx "$HOME/.vnc" # enforce safe permissions

tigervnc_path="/tigervnc-${tigervnc_version}.x86_64/usr/bin"

# Start TigerVNC
if [ ! -z $VNC_PASSWD ]; then
	${tigervnc_path}/vncpasswd -f <<< "$VNC_PASSWD" > "$HOME/.vnc/passwd"
	${tigervnc_path}/vncserver :0
else
	${tigervnc_path}/vncpasswd -f <<< "" > "$HOME/.vnc/passwd"
	${tigervnc_path}/vncserver -SecurityTypes None :0
fi

# Start noVNC
/noVNC-${noVNC_version}/utils/launch.sh
