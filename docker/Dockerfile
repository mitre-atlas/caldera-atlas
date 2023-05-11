FROM caldera:latest
SHELL ["/bin/bash", "-c"]
WORKDIR /usr/src/app

RUN apt install -y python3-venv
RUN python3 -m venv /root/venv/cf_venv
RUN source /root/venv/cf_venv/bin/activate && git clone -b main https://github.com/Azure/counterfit.git && cd ./counterfit && pip install counterfit[dev] && deactivate

# Default HTTP port for web interface and agent beacons over HTTP
EXPOSE 8888

# Default HTTPS port for web interface and agent beacons over HTTPS (requires SSL plugin to be enabled)
EXPOSE 8443

# TCP and UDP contact ports
EXPOSE 7010
EXPOSE 7011/udp

# Websocket contact port
EXPOSE 7012

# Default port to listen for DNS requests for DNS tunneling C2 channel
EXPOSE 8853

# Default port to listen for SSH tunneling requests
EXPOSE 8022

# Default FTP port for FTP C2 channel
EXPOSE 2222

ENTRYPOINT ["python3", "server.py"]
