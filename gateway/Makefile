include .env

deploy:
	gcloud builds submit

build-docker:
	docker build . -f Dockerfile -t gateway

run-docker:
	docker run --env-file=.env gateway 

build-docker-unmanaged:
	docker build . -f Dockerfile.unmanaged -t gateway-unmanaged

run-docker-unmanaged:
	docker run gateway-unmanaged