#
# Ubuntu Desktop (LXDE) Dockerfile
#
# https://github.com/dockerfile/ubuntu-desktop
#

# Pull base image.
FROM dockerfile/ubuntu

# Install LXDE, VNC server and firefox.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver firefox && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 5901

# run vncserver
RUN vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log
