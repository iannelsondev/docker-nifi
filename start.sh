#!/bin/sh
docker run -d --name nifi -p 18080:8080 -v $(pwd)/conf:/home/nifi/conf -v $(pwd)/flowfile:/home/nifi/flowfile_repository -v $(pwd)/database:/home/nifi/database_repository -v $(pwd)/content:/home/nifi/content_repository -v $(pwd)/provenance:/home/nifi/provenance_repository in2rd/docker-nifi
