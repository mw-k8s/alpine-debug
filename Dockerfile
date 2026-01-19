FROM alpine:3.23.2

LABEL org.opencontainers.image.authors = "Michael Straßberger <m.strassberger@metaways.de>"
LABEL org.opencontainers.image.source  = "https://github.com/mw-k8s/alpine-debug"

RUN apk add --no-cache \
  curl \
  wget \
  redis \
  mariadb-client \
  mariadb-bench \
  postgresql16-client \
  jq \
  yq \
  aws-cli \
  git \
  git-bash-completion \
  iperf3 \
  iproute2 \
  iputils-tracepath \
  traceroute \
  mtr \
  socat \
  nmap \
  s3cmd \
  bash \
  pv \
  zsh && \
  mkdir -p /workdir && \
  cd /workdir && \
  chown nobody:nogroup /workdir && \
  chmod 0700 /workdir

WORKDIR /workdir
