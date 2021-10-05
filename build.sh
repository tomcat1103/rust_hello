#!/bin/sh

CONTAINER_RUNNER=podman
RUST_VERSION=latest

# USER_PERMISSION="--user $(id -u):$(id -g)"

# test run
${CONTAINER_RUNNER} ps >/dev/null 2>&1
if [ $? -eq 0 ]; then
  RUNNER="${CONTAINER_RUNNER} run --rm ${USER_PERMISSION} -v $PWD:/usr/src/myapp:z -w /usr/src/myapp rust:${RUST_VERSION}"
fi
RUNNER="${RUNNER} cargo"

if [[ "0" -eq "$#" ]];then
  ${RUNNER} build --release
else
  ${RUNNER} $@
fi
