ifndef OPENAPI_DOCKER_COMMAND
OPENAPI_DOCKER_IMAGE=dkarlovi/openapi-generator
OPENAPI_DOCKER_COMMAND=docker run --init --interactive --rm --tty --user "$(shell id -u):$(shell id -g)" --volume "$(shell pwd):/project" --workdir /project ${OPENAPI_DOCKER_IMAGE}
endif

INPUT=reddit/v1/api.yaml
OUTPUT=build

generate:
	sh -c "${OPENAPI_DOCKER_COMMAND} ${INPUT} ${OUTPUT}"
