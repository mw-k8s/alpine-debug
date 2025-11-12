# Alpine Debug

A lightweight Alpine Linux-based Docker image packed with essential debugging and troubleshooting tools for Kubernetes clusters.

## Purpose

This image is designed for customers and technicians to quickly debug and diagnose issues inside Kubernetes clusters without needing to install tools in production containers.

## Included Tools

### Network Utilities
- `curl` - HTTP client
- `wget` - File downloader
- `nmap` - Network scanner
- `socat` - Socket relay
- `iproute2` - Network configuration
- `iputils-tracepath` - Network path tracing
- `traceroute` - Route tracing
- `mtr` - Network diagnostics
- `iperf3` - Network performance testing

### Database Clients
- `mariadb-client` - MySQL/MariaDB client
- `mariadb-bench` - MySQL/MariaDB benchmarking
- `postgresql16-client` - PostgreSQL client
- `redis` - Redis CLI

### Cloud & Storage
- `aws-cli` - AWS command-line interface
- `s3cmd` - S3 storage tool

### Performance & Benchmarking
- `sysbench` - System benchmarking tool
- `pv` - Pipe viewer for monitoring data transfer

### Development Tools
- `git` - Version control
- `git-bash-completion` - Git auto-completion
- `jq` - JSON processor
- `yq` - YAML processor

### Shells
- `bash` - Bourne Again SHell
- `zsh` - Z Shell

## Usage

### Pull the Image

```bash
docker pull ghcr.io/mw-k8s/alpine-debug:latest
```

### Run as a Kubernetes Pod

Create a debug pod in your cluster:

```bash
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- /bin/bash
```

### Run as a Deployment

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: debug-pod
spec:
  containers:
  - name: debug
    image: ghcr.io/mw-k8s/alpine-debug:latest
    command: ["/bin/sleep", "infinity"]
```

Then exec into the pod:

```bash
kubectl exec -it debug-pod -- /bin/bash
```

### Debug Network Issues

```bash
# Test connectivity
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- curl http://service-name:port

# Trace route
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- traceroute hostname

# Network performance test
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- iperf3 -c hostname
```

### Debug Database Connections

```bash
# MySQL/MariaDB
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- mysql -h hostname -u user -p

# PostgreSQL
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- psql -h hostname -U user -d database

# Redis
kubectl run debug --image=ghcr.io/mw-k8s/alpine-debug:latest -it --rm -- redis-cli -h hostname
```

## Building

Build the image locally:

```bash
docker build -t alpine-debug .
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Maintainer

Michael Straßberger <m.strassberger@metaways.de>
