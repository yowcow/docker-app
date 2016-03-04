.PHONY: run stop log

IMAGE_NAME = "yowcow/example"
CID_FILE = "app.cid"

all:
	docker build -t $(IMAGE_NAME) .

run:
	docker run \
		-v $$(pwd):/src \
		-p 15000:5000 \
		-d \
		--cidfile="$(CID_FILE)" \
		-e MOJO_MODE=deployment \
		$(IMAGE_NAME) \
		plackup -s Starlet -I/src/lib /src/app.psgi

stop:
	docker stop $$(cat $(CID_FILE)) && rm $(CID_FILE)

log:
	docker logs -f $$(cat $(CID_FILE))
