#!/bin/bash

# Mengatur nama dan tag untuk image
IMAGE_NAME="item-app"
IMAGE_TAG="v1"

# 1. Membuat Docker image dari Dockerfile
echo "Membuat Docker image ${IMAGE_NAME}:${IMAGE_TAG}..."
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

# 2. Melihat daftar image di lokal
echo "Daftar Docker images di lokal:"
docker images

# 3. Mengubah nama image agar sesuai dengan format Docker Hub
# Ganti 'yourusername' dengan username Docker Hub Anda
DOCKER_HUB_USERNAME="kevinseptians"
DOCKER_IMAGE_NAME="${DOCKER_HUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
echo "Mengubah nama image menjadi ${DOCKER_IMAGE_NAME}..."
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_IMAGE_NAME}

# 4. Login ke Docker Hub
echo "Login ke Docker Hub..."
docker login

# 5. Mengunggah image ke Docker Hub
echo "Mengunggah image ${DOCKER_IMAGE_NAME} ke Docker Hub..."
docker push ${DOCKER_IMAGE_NAME}

echo "Proses build dan push image selesai."