#!/bin/sh

set -e

# Pull Request
if [[ -n $CI_PULL_REQUEST_NUMBER ]];
then
    echo "Linting..."
    brew install swiftlint

    cd $CI_WORKSPACE
    swiftlint --strict
fi
