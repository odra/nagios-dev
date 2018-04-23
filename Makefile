IMAGE = nagios-dev
TAG = latest

build-no-cache:
	docker build --no-cache -t $(IMAGE):$(TAG) .

build:
	docker build -t $(IMAGE):$(TAG) .

run:
	docker run -it -v $(shell pwd)/nagios-cfg:/etc/nagios/cfg -v $(shell pwd)/logs:/var/nagios/logs -v $(shell pwd)/custom-plugins:/opt/nagios/custom-plugins -p 8080:80 $(IMAGE):$(TAG)

run-setup:
	docker run -it -v $(shell pwd)/nagios-cfg:/etc/nagios/cfg -v $(shell pwd)/logs:/var/nagios/logs -v $(shell pwd)/custom-plugins:/opt/nagios/custom-plugins -v $(shell pwd)/setup-scripts:/opt/setup-scripts -p 8080:80 $(IMAGE):$(TAG)

debug:
	docker run -it --entrypoint /bin/bash -v $(shell pwd)/nagios-cfg:/etc/nagios/cfg -v $(shell pwd)/logs:/var/nagios/logs -v $(shell pwd)/custom-plugins:/opt/nagios/custom-plugins $(IMAGE):$(TAG)

clean:
	docker rmi -f $(shell docker images -q --filter dangling=true) && docker volume prune
