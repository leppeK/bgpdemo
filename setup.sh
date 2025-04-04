docker network create -d bridge --subnet 172.31.100.0/24 ptc
docker run -d -p 5000:5000 \
  -e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
  --restart always \
  --net ptc --ip 172.31.100.10 \
  --name registry-docker.io registry:2
docker run -d -p 5001:5000 \
  -e REGISTRY_PROXY_REMOTEURL=https://registry.k8s.io \
  --restart always \
  --net ptc --ip 172.31.100.11 \
  --name registry-registry.k8s.io registry:2
docker run -d -p 5002:5000 \
  -e REGISTRY_PROXY_REMOTEURL=https://quay.io \
  --restart always \
  --net ptc --ip 172.31.100.12 \
  --name registry-quay.io registry:2 \
  docker run -d -p 5003:5000 \
  -e REGISTRY_PROXY_REMOTEURL=https://gcr.io \
  --restart always \
  --net ptc --ip 172.31.100.13 \
  --name registry-gcr.io registry:2
docker run -d -p 5004:5000 \
  -e REGISTRY_PROXY_REMOTEURL=https://ghcr.io \
  --restart always \
  --net ptc --ip 172.31.100.14 \
  --name registry-ghcr.io registry:2
