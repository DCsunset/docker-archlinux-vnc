#!/bin/bash

umask 0077                # use safe default permissions
chmod go-rwx "$HOME/.vnc" # enforce safe permissions
chmod +x "$HOME/.vnc/xstartup"

# chromium
sed -i 's/\/usr\/bin\/chromium/\/usr\/bin\/chromium --no-sandbox/g' /usr/share/applications/chromium.desktop

# Start TigerVNC
if [ ! -z $VNC_PASSWD ]; then
	vncpasswd -f <<< "$VNC_PASSWD" > "$HOME/.vnc/passwd"
	vncserver -rfbport 5900
else
	vncpasswd -f <<< "" > "$HOME/.vnc/passwd"
	vncserver -rfbport 5900 -SecurityTypes None
fi

# Start noVNC
/noVNC-${noVNC_version}/utils/launch.sh
