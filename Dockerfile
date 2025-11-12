FROM alpine

MAINTAINER Michael Straßberger <m.strassberger@metaways.de>

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
  sysbench \
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
