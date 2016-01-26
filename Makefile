all:

docker-build:
	docker build -t nginx-extras -f Dockerfile .