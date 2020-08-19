ifndef OPENAPI_DOCKER_COMMAND
OPENAPI_DOCKER_IMAGE=openapitools/openapi-generator-cli
OPENAPI_DOCKER_COMMAND=docker run --init --interactive --rm --user "$(shell id -u):$(shell id -g)" --volume "$(shell pwd):/project" --workdir /project ${OPENAPI_DOCKER_IMAGE}
endif

GENERATOR=php
OUTPUT=build

help:
	sh -c "${OPENAPI_DOCKER_COMMAND} help generate"
config-help:
	sh -c "${OPENAPI_DOCKER_COMMAND} config-help --generator-name ${GENERATOR}"

generate:
	sh -c "${OPENAPI_DOCKER_COMMAND} generate --generator-name ${GENERATOR} --input-spec ${INPUT} --output ${OUTPUT} --strict-spec true"
validate:
	sh -c "${OPENAPI_DOCKER_COMMAND} validate --input-spec ${INPUT} --recommend"
