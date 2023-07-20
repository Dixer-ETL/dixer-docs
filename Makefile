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
	@docker run --rm -p 8010:8000 -v ${PWD}:/docs dixer-docs:latest 'mkdocs serve --dev-addr=0.0.0.0:8000'

.PHONY: build
## build: Build site and set the permisions to user triggered the command. Call make build user_id:group or dynamic with $(id -u $(whoami)):$(id -g)
build:
	@docker run --rm -v ${PWD}:/docs dixer-docs:latest 'mkdocs build && chown -R $(filter-out $@,$(MAKECMDGOALS)) site'

%:
    @: