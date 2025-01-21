ARG OVERMIND_VERSION=2.5.1
ARG NODE_VERSION=22

FROM debian:bookworm-slim

ARG OVERMIND_VERSION
ARG NODE_VERSION

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    procps \
    tmux \
    apt-transport-https \
    debian-keyring \
    debian-archive-keyring

# Install Caddy
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg && \
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list && \
    apt-get update && apt-get install -y caddy

# Install Overmind
RUN curl -fsSL https://github.com/DarthSim/overmind/releases/download/v${OVERMIND_VERSION}/overmind-v${OVERMIND_VERSION}-linux-amd64.gz | gunzip -c > /usr/local/bin/overmind && \
    chmod +x /usr/local/bin/overmind

# Install Node.js and n8n
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g n8n

# Copy configuration files
COPY Caddyfile /etc/caddy/Caddyfile
COPY Procfile /app/Procfile

WORKDIR /app

# Expose ports
EXPOSE 80 443 5678

CMD ["overmind", "start", "-f", "/app/Procfile"]
