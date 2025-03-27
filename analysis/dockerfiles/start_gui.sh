#!/bin/bash

# Start a virtual framebuffer (Xvfb) to create a virtual display
Xvfb :1 -screen 0 1280x800x24 &
export DISPLAY=:1

# (The kasmweb/desktop-deluxe base image should already have a desktop environment running;
# if not, you might start one here.)

# Start x11vnc to allow VNC connections (if necessary)
x11vnc -display :1 -forever -nopw -listen 0.0.0.0 &

# Start noVNC to proxy the VNC connection to a web browser (port 6080)
websockify --web=/usr/share/novnc 6080 localhost:5900 &

# Optionally, start Jupyter Lab (port 8888) for additional interactivity
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root &

# Optionally, auto-launch SLEAP's GUI (e.g., sleap-label) if desired
# sleap-label &

# Keep the container running indefinitely
tail -f /dev/null
