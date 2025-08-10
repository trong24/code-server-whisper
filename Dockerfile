
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and clean up
RUN apt update && \
	apt install -y sudo curl apt-transport-https ca-certificates gnupg software-properties-common git python3 python3-pip python3-venv ffmpeg && \
	rm -rf /var/lib/apt/lists/*

# Install code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Copy files and install Python requirements
COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt
RUN python3 -m pip install --no-cache-dir -r /requirements.txt

# Set permissions and create user in a single layer
RUN chmod +x /entrypoint.sh && useradd -ms /bin/bash jovyan

USER jovyan
ENTRYPOINT ["/entrypoint.sh"]