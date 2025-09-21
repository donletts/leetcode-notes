# Makefile for running lychee link checker in Docker
IMAGE_NAME = leetcode-lychee
CONTAINER_NAME = leetcode-lychee-container
SHELL := /usr/bin/bash

username = $(shell id -u -n)
uid = $(shell id -u)
gid = $(shell id -g)

.PHONY: in-container
in-container:
	if [[ ! -f /.in-container ]]; then \
		echo "not in container"; \
		false; \
	fi

.PHONY: not-in-container
not-in-container:
	if [[ -f /.in-container ]]; then \
		echo "in container"; \
		false; \
	fi

# Build the Docker image
.PHONY: docker-build
docker-build: not-in-container
docker-build: built = $(shell docker image list --filter reference=$(IMAGE_NAME) -aq)
docker-build:
	if [ -z "$(built)" ]; then \
		docker build -t $(IMAGE_NAME) .; \
	fi
# 		--build-arg user_name=$(username) \
# 		--build-arg user_uid=$(uid) \
# 		--build-arg user_gid=$(gid) \

# Run the container interactively with the repo mounted
.PHONY: docker-run
docker-run: not-in-container
docker-run: running = $(shell docker container ps --filter name=$(CONTAINER_NAME) --filter status=running -aq)
docker-run: docker-build
	if [ -z "$(running)" ]; then \
		docker run -d \
			-h $(CONTAINER_NAME) \
			--name $(CONTAINER_NAME) \
			-v $(PWD):/app \
			-w /app \
			-it $(IMAGE_NAME) /bin/bash; \
		docker exec $(CONTAINER_NAME) touch ./in-container; \
		docker exec $(CONTAINER_NAME) groupadd --gid $(gid) $(username); \
		docker exec $(CONTAINER_NAME) useradd -s /bin/bash --uid $(uid) --gid $(gid) -m $(username); \
		echo ${username} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${username} \
    	chmod 0440 /etc/sudoers.d/${username} \
		docker cp --follow-link ~/.bashrc $(CONTAINER_NAME):/home/$(username); \
		docker cp --follow-link ~/.gitconfig $(CONTAINER_NAME):/home/$(username); \
	fi
	${MAKE} docker-join

.PHONY: docker-join
docker-join: not-in-container
docker-join:
	docker exec -u $(username) -it $(CONTAINER_NAME) /bin/bash

.PHONY: docker-stop
docker-stop: not-in-container
docker-stop:
	docker container stop $(CONTAINER_NAME) >> /dev/null 2>&1 || true
	docker container rm $(CONTAINER_NAME) >> /dev/null 2>&1 || true

# Run lychee directly without opening a shell
.PHONY: docker-check
docker-check: not-in-container
docker-check: docker-build
	docker exec -u $(username) -it $(CONTAINER_NAME) lychee --verbose --no-progress --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36" --exclude-all-private .

# Clean up dangling images/containers
.PHONY: docker-clean
docker-clean: not-in-container
docker-clean:
	docker system prune -f

.PHONY: lint
lint: in-container
lint:
	lychee --verbose --no-progress --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36" --exclude-all-private .
