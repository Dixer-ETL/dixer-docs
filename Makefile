.PHONY: help
all: help
## help: Show this help message
help: Makefile
	@echo
	@echo " Choose a command to run:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


.PHONY: build-image
## build-image: Build docker image with required plugins
build-image:
	@docker build -t dixer-docs:latest .

.PHONY: serve
## serve: To serve in port 8010 to develop
serve:
	@docker run --rm -it -p 8010:8000 -v ${PWD}:/docs dixer-docs:latest 'mkdocs serve --dev-addr=0.0.0.0:8000'

.PHONY: build
## build: Build site
build:
	@docker run --rm -it -v ${PWD}:/docs dixer-docs:latest 'mkdocs build && chown -R 1000:1000 site'