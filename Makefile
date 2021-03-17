.PHONY: docker-build docker-run

NAME=phlummox/minimal-dokku-app
TAG=0.1

docker-build:
	docker build -t $(NAME):$(TAG) -f Dockerfile .

docker-run:
	docker -D run --rm -it -p 8080:8080 \
		$(NAME):$(TAG)

docker-shell:
	docker -D run --rm -it -p 8080:8080 \
		-v $$PWD:/opt/work \
		--entrypoint sh \
		$(NAME):$(TAG)



