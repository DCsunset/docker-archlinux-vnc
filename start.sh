#!/bin/bash

umask 0077                # use safe default permissions
mkdir -p "$HOME/.vnc"     # create config directory
chmod go-rwx "$HOME/.vnc" # enforce safe permissions

if [ ! -z $VNC_PASSWD ]; then
	vncpasswd -f <<< "$VNC_PASSWD" > "$HOME/.vnc/passwd"
	vncserver -fg -localhost no :0
else
	vncpasswd -f <<< "" > "$HOME/.vnc/passwd"
	vncserver -fg --I-KNOW-THIS-IS-INSECURE -SecurityTypes None -localhost no :0
fi

