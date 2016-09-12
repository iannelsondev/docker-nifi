## Apache NiFi Dockerfile


This repository contains a **Dockerfile** to create a containerized version of [Apache NiFi](https://nifi.apache.org/) for [Docker](https://www.docker.com/)'s automated build published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [alpine:3.3](https://hub.docker.com/_/alpine/)


### Installation

1. Install [Docker](https://www.docker.com/)

2. Build an image from Dockerfile: `./build.sh`

3. Start the image: `./start.sh`


### Usage

    docker run -d --name nifi \
        -p 8080:8080 \
        -v $(pwd)/conf:/home/nifi/conf \
        -v $(pwd)/flowfile:/home/nifi/flowfile_repository \
        -v $(pwd)/database:/home/nifi/database_repository \
        -v $(pwd)/content:/home/nifi/content_repository \
        -v $(pwd)/provenance:/home/nifi/provenance_repository \
        in2rd/docker-nifi

1. 8080 is a common port, so script binds to 18080 for uniqueness

2. Configuration (`conf`) folder is a volume. If you choose to mount, ensure the conf files exist before starting.

3. Flow files are a exposed as a volume (`/home/nifi/flowfile_repository`)

4. Database files are a exposed as a volume (`/home/nifi/database_repository`)

5. Content files are a exposed as a volume (`/home/nifi/content_repository`)

6. Provenance tracking files are a exposed as a volume (`/home/nifi/provenance_repository`)
