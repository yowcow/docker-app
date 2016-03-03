.PHONY: run

all:
	sudo docker build -t yowcow/example .

run:
	sudo docker run \
		-v $$(pwd):/src \
		-p 15000:5000 \
		yowcow/example \
		plackup -s Starlet -E deployment -I/src/lib /src/app.psgi
