# Variables
APP_NAME = cloud
DOCKER_USER = omkar1508
IMAGE= docker.io/$(DOCKER_USER)/$(APP_NAME):latest
KUBE_DEPLOYMENT=kubernetes/deployment.yaml

# Commands
.PHONY: build push deploy clean run test

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

deploy:
	kubectl apply -f $(KUBE_DEPLOYMENT)

clean:
	docker system prune -f

run:
	docker run -p 5000:5000 $(IMAGE)

test:
	curl http://localhost:5000
