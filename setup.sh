#!/bin/bash
# This script replaces @willjschmitt's repository names, etc, with the attendees
# usernames and such throughout the repository to bootstrap a fork of the
# repository.
set -e

if [ -z "${GITHUB_USERNAME}" ]; then
  >&2 echo "GITHUB_USERNAME must be set."
  exit -1
fi

if [ -z "${DOCKERHUB_USERNAME}" ]; then
  >&2 echo "DOCKERHUB_USERNAME must be set."
  exit -1
fi

REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

>&2 echo "Updating files in repository in ${REPOSITORY_ROOT} to use ${GITHUB_USERNAME} as the GitHub username and ${DOCKERHUB_USERNAME} as the DockerHub username."
sed -i '' "s|willjschmitt/greeter-server|${DOCKERHUB_USERNAME}/greeter-server|g" "${REPOSITORY_ROOT}/.github/workflows/add-release-actions-workflow.patch"
sed -i '' "s|DOCKERHUB_USERNAME: willjschmitt|DOCKERHUB_USERNAME: ${DOCKERHUB_USERNAME}|g" "${REPOSITORY_ROOT}/.github/workflows/add-release-actions-workflow.patch"
sed -i '' "s|github.com/willjschmitt|github.com/${GITHUB_USERNAME}|g" "${REPOSITORY_ROOT}/config/greeter-service.applications.yaml"
sed -i '' "s|willjschmitt/greeter-server|${DOCKERHUB_USERNAME}/greeter-server|g" "${REPOSITORY_ROOT}/config/greeter-service-production/deployment.yaml"
sed -i '' "s|willjschmitt/greeter-server|${DOCKERHUB_USERNAME}/greeter-server|g" "${REPOSITORY_ROOT}/config/greeter-service-staging/deployment.yaml"
