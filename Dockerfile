ARG OVERMIND_VERSION=2.5.1
ARG TRAEFIK_VERSION=3.3.2
ARG NODE_VERSION=22

FROM debian:bookworm-slim

ARG OVERMIND_VERSION
ARG TRAEFIK_VERSION
ARG NODE_VERSION

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    supervisor \
    procps \
    tmux

RUN curl -fsSL https://github.com/DarthSim/overmind/releases/download/v${OVERMIND_VERSION}/overmind-v${OVERMIND_VERSION}-linux-amd64.gz | gunzip -c > /usr/local/bin/overmind
RUN curl -fsSL https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_amd64.tar.gz | tar -xz -C /usr/local/bin
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g n8n

RUN chmod +x /usr/local/bin/overmind
RUN chmod +x /usr/local/bin/traefik

COPY Procfile /app/Procfile
COPY traefik.yml /etc/traefik/traefik.yml

WORKDIR /app

EXPOSE 80 443 5678

CMD ["/usr/local/bin/overmind", "start"]
